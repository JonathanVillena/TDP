package oculus.acelerometer;

import java.io.IOException;
import java.net.Socket;
import java.net.UnknownHostException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

import android.graphics.Color;
import android.graphics.drawable.ColorDrawable;
import android.support.v7.app.ActionBarActivity;
import android.os.Bundle;
import android.os.Handler;
import android.os.HandlerThread;
import android.os.Looper;
import android.os.Message;
//import android.support.v7.app.AppCompatActivity;
import android.support.v7.app.AlertDialog;
import android.view.Menu;
import android.view.MenuItem;
import android.view.View;
import android.view.Window;
import android.view.WindowManager;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;
import android.net.wifi.WifiManager;
import android.text.format.Formatter;
import android.widget.Toast;

public class MainActivity extends ActionBarActivity implements SensorFusion.ISensorFusionListener{

    private SensorFusion sensors;
    private Socket socket;
    private boolean connected;
    private boolean running;

    private HandlerThread networkThread;
    private Handler networkHandler;

    private TextView statusView,textStatus;
    private EditText ipText;
    private Button button;

    private EditText textPort;
    private Button buttonPort;
    private Button btnCerrar;

    private int port= 19834;



    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        requestWindowFeature(Window.FEATURE_NO_TITLE);
        getWindow().setFlags(WindowManager.LayoutParams.FLAG_FULLSCREEN,WindowManager.LayoutParams.FLAG_FULLSCREEN);
        setContentView(R.layout.activity_main);
        //obtener ip
        WifiManager wm = (WifiManager)getApplicationContext().getSystemService(WIFI_SERVICE);
        String ip = Formatter.formatIpAddress(wm.getConnectionInfo().getIpAddress());

        //
        connected = false;
        running = false;
        networkHandler = null;

        statusView = (TextView) findViewById(R.id.statusView);
        ipText = (EditText) findViewById(R.id.ipText);
        button = (Button) findViewById(R.id.connectButton);
        btnCerrar = (Button) findViewById(R.id.btnclose) ;
        textStatus = (TextView) findViewById(R.id.textStatus);

        ipText.setText(ip);



        ipText.setSelection(ipText.getText().length());
        button.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {

                if (ipText.getText().length() < 10) {
                    Toast.makeText(getApplicationContext(), "Ingresa un IP Correcto", Toast.LENGTH_LONG).show();

                } else {
                    AlertDialog.Builder mBuilder = new AlertDialog.Builder(MainActivity.this);
                    View mView = getLayoutInflater().inflate(R.layout.dialog_connection, null);
                    mBuilder.setView(mView);

                    final Button btnOK = (Button) mView.findViewById(R.id.btnOK);
                    final AlertDialog dialog = mBuilder.create();
                    dialog.getWindow().setBackgroundDrawable(new ColorDrawable(Color.TRANSPARENT));
                    dialog.show();

                    btnOK.setOnClickListener(new View.OnClickListener() {
                        @Override
                        public void onClick(View v) {
                            dialog.dismiss();

                        }
                    });
                    if (connected)
                        disconnect();
                    else
                        connect();
                }
            }
        });

        btnCerrar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View v) {
                finish();
            }
        });

        textPort = (EditText) findViewById(R.id.port);
        buttonPort = (Button) findViewById(R.id.routeButton);
        /*buttonPort.setOnClickListener(new View.OnClickListener(){
            @Override
            public void onClick(View v){
                changePort();
            }
        });*/
        networkThread = new HandlerThread("network thread");

        networkThread.start();

        networkHandler = new Handler(networkThread.getLooper()) {
            @Override
            public void handleMessage(Message msg) {
                running = true;
            }
        };

        networkHandler.sendEmptyMessage(0);

        sensors = new SensorFusion(this, this);

        sensors.start();

    }


@Override
protected void onDestroy() {
    super.onDestroy();
    networkThread.quit();
    try {
        networkThread.join();
    } catch (InterruptedException e) {
        // TODO Auto-generated catch block
        e.printStackTrace();
    }
}

    @Override
    public boolean onCreateOptionsMenu(Menu menu) {
        // Inflate the menu; this adds items to the action bar if it is present.
        getMenuInflater().inflate(R.menu.sensor_controller, menu);
        return true;
    }

    @Override
    public boolean onOptionsItemSelected(MenuItem item) {
        // Handle action bar item clicks here. The action bar will
        // automatically handle clicks on the Home/Up button, so long
        // as you specify a parent activity in AndroidManifest.xml.
        int id = item.getItemId();
        if (id == R.id.action_settings) {
            return true;
        }
        return super.onOptionsItemSelected(item);
    }

    @Override
    public void newOrientation(final float[] orientation) {
        final String status = String.format(" X: %f \n Y: %f \n Z: %f", orientation[0], orientation[1], orientation[2]);
        this.runOnUiThread(new Runnable() {
            @Override
            public void run() {
                statusView.setText(status);
            }
        });

        if(running) {
            networkHandler.post(new Runnable() {

                @Override
                public void run() {
                    if(connected) {
                        ByteBuffer buffer = ByteBuffer.allocate(orientation.length * 4);
                        buffer.order(ByteOrder.LITTLE_ENDIAN);
                        buffer.asFloatBuffer().put(orientation);

                        try {
                            socket.getOutputStream().write(buffer.array());
                        } catch (IOException e) {
                            // TODO Auto-generated catch block
                            e.printStackTrace();
                        }
                    }
                }
            });
        }
    }

    public void changePort(){
        port = Integer.parseInt(textPort.getText().toString());
        textPort.setText(String.valueOf(port));
    }

    public void connect() {
        final String ip = ipText.getText().toString();

        networkHandler.post(new Runnable() {

            @Override
            public void run() {
                try {
                    socket = new Socket(ip,19844);
                } catch (UnknownHostException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                    return;
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                    return;
                }

                connected = true;

                runOnUiThread(new Runnable() {

                    @Override
                    public void run() {
                        button.setText("DESCONECTAR");
                        textStatus.setText("Conectado");

                    }
                });
            }
        });
    }

    public void disconnect() {
        networkHandler.post(new Runnable() {

            @Override
            public void run() {
                connected = false;

                try {
                    socket.close();
                } catch (IOException e) {
                    // TODO Auto-generated catch block
                    e.printStackTrace();
                }

                socket = null;

                runOnUiThread(new Runnable() {

                    @Override
                    public void run() {
                        button.setText("CONECTADO");
                        textStatus.setText("Desconectado");

                    }
                });
            }
        });
    }
}
