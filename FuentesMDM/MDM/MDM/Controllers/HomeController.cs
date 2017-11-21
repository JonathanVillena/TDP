using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using MDM.Models;
using MDM.ViewModel;
using MDM.Service;
using PagedList;
using Newtonsoft.Json;
using System.Text;

namespace MDM.Controllers
{

  
    public class HomeController : Controller
    {
      
        CuestionarioService _service = new CuestionarioService();
        public ActionResult Index()
        {
            return RedirectToAction("Login");
        }
        public ActionResult CerrarSesion()
        {
            Session.Clear();
            return RedirectToAction("Login");
        }
        public ActionResult Inicio()
        {
            if(Session["objUsuario"]==null)
                return RedirectToAction("Login");
            return View();
        }
        [HttpPost]
        public JsonResult GrabarRespuesta(string idPregunta,string valuePregunta)
        {

            int idUsuario = ((Usuario)Session["objUsuario"]).IdUsuario;
            int numRespondidos = _service.obtenerNumeroDeRespondidos(idUsuario);
            int numVez = (numRespondidos/40)+1;
            var estadoEncuenta = ((Usuario)Session["objUsuario"]).EncuestaTerminada;
            if(numRespondidos != 0)
              if (numRespondidos % 40 == 0 &&  estadoEncuenta == false)
                 {
                numVez = numVez - 1;
                    }
            
            _service.AgregarRespuesta(Int32.Parse(idPregunta) ,Convert.ToInt32(valuePregunta), idUsuario, numVez);
            string porcentaje = _service.ObtenerPorcentajeCompletado(idUsuario,numVez);//Calcular porcentaje completado
            return Json(porcentaje, JsonRequestBehavior.AllowGet);
        }
        public ActionResult InicioCuestionario()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            Session["recienIniciado"] = false;
            return View();
        }
        public ActionResult Cuestionario(int? page)
        {
            
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
           
            int idUsuario = ((Usuario)Session["objUsuario"]).IdUsuario;
            if (((bool)Session["recienIniciado"]) == true && _service.SinRepuesta(idUsuario))
                return RedirectToAction("InicioCuestionario");
            int numVez = (_service.obtenerNumeroDeRespondidos(idUsuario) / 40) + 1;

            if ( _service.obtenerNumeroDeRespondidos(idUsuario) % 40 == 0  && ((Usuario)Session["objUsuario"]).EncuestaTerminada == false)
            {
                numVez = numVez - 1;
            }

            CuestionarioViewModel objViewModel = new CuestionarioViewModel();
            int pageSize = 4;
            int pageNumber = (page ?? 1);
            List<Pregunta> ListaPregunta = objViewModel.LstPregunta.ToPagedList(pageNumber, pageSize).ToList();
           

            _service.ObtenerRespuestas(ListaPregunta,idUsuario, numVez);
            ViewBag.Porcentaje = _service.ObtenerPorcentajeCompletado(idUsuario,numVez);
            return View(objViewModel.LstPregunta.ToPagedList(pageNumber, pageSize));
        }
        public ActionResult ResultadoEvaluacion()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            if (((Usuario)Session["objUsuario"]).EncuestaTerminada == false)
                return RedirectToAction("ResultadoEvaluacionIncompleto");
           
            int idUsuario = ((Usuario)Session["objUsuario"]).IdUsuario;

            if(_service.obtenerNumeroDeRespondidos(idUsuario)/40 == 0)
            {
                return RedirectToAction("ResultadoEvaluacionIncompleto");

            }

            int cant = (_service.obtenerNumeroDeRespondidos(idUsuario) / 40);

            List<ResultadoEvaluacion_Result> listaResultado = _service.ListaResultado(idUsuario,cant);//SE TIENE QUE PONER EL CONTVEZ

            _service.AsignarValorEsperado(listaResultado);

            var json = JsonConvert.SerializeObject(listaResultado);
            ViewBag.JsonData = json;

            List<DimensionResultado> ListaDetallesResultado = _service.ListaDetallesResultado(idUsuario, cant);//SE TIENE QUE PONER EL CONTVEZ

            return View(ListaDetallesResultado);

        }
        public ActionResult ResultadoEvaluacionIncompleto()
        {
            return View();
        }
        public ActionResult Informacion()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            return View();
        }
        public ActionResult SinHistorial()
        {
            return View();
        }
        public ActionResult InformacionNiveles()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            return View();
        }
        public ActionResult InformacionDimensiones()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            return View();
        }
        public ActionResult FinalizarEncuesta()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            int idUsuario = ((Usuario)Session["objUsuario"]).IdUsuario;
            Session["objUsuario"] = _service.FinalizarEncuesta(idUsuario);
            return View();
        }
        public ActionResult ReiniciarEncuesta()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            int idUsuario = ((Usuario)Session["objUsuario"]).IdUsuario;
            Session["objUsuario"] =_service.BorrarUltimaEncuesta(idUsuario);
            return RedirectToAction("Cuestionario");
        }
        public ActionResult NuevaEncuesta()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            int idUsuario = ((Usuario)Session["objUsuario"]).IdUsuario;
        //    Session["objUsuario"] = _service.BorrarRespuestas(idUsuario);
            return RedirectToAction("Cuestionario");
        }
        public ActionResult HistorialRespuestas()
        {
            if (Session["objUsuario"] == null)
                return RedirectToAction("Login");
            if (((Usuario)Session["objUsuario"]).EncuestaTerminada == false)
                return RedirectToAction("SinHistorial");
            int idUsuario = ((Usuario)Session["objUsuario"]).IdUsuario;
            ///////////////////////////////////////////////////////////
           
            List<Grap> listGrap = _service.ListaGraficos(idUsuario);
            List<ResultadosHistoricos_Result> listaResultado = _service.ListHisotiroResultado(idUsuario);
            
            var json = JsonConvert.SerializeObject(listaResultado);
            var jsongrap = JsonConvert.SerializeObject(listGrap);


      

            ViewBag.JsonData = dataprovierforgrap(idUsuario); 
            ViewBag.JsonGrap = jsongrap;
            

            List<LisDimensionResultado> ListaDetallesResultados = _service.ListaHistoriaResultados(idUsuario);//SE TIENE QUE PONER EL CONTVEZ
            return View(ListaDetallesResultados);

        }
        [HttpGet]
        public ActionResult Login()
        {
            LoginViewModel objViewModel = new LoginViewModel();
            return View(objViewModel);
        }
        [HttpPost]
        public ActionResult Login(LoginViewModel objViewModel)
        {
            try
            {
                MDMEntities context = new MDMEntities();
                Usuario objUsuario = context.Usuario.FirstOrDefault(x => x.UsuarioIngreso == objViewModel.UsuarioIngreso &&
                                                                    x.Clave == objViewModel.Clave);
                if (objUsuario == null)
                    return View(objViewModel);

                Session["objUsuario"] = objUsuario;//Guardar los datos en la sesion
                Session["recienIniciado"] = true;
                return RedirectToAction("Inicio");
            }
            catch (Exception)
            {
                return View(objViewModel);
            }
        }

        public string dataprovierforgrap (int idUsuario)
        {
            
            int cant = (_service.obtenerNumeroDeRespondidos(idUsuario) / 40);
            var jsonString = new StringBuilder();

            jsonString.Append("[");
            List<ResultadosHistoricos_Result> listaResultado = _service.ListHisotiroResultado(idUsuario);
            for (int i = 0; i < 6; i++)
            {
                string dimName = Convert.ToString(listaResultado[i].Dimension);
                jsonString.Append("{");
                
                jsonString.Append("\"Dimension\": \"" + dimName + "\",");
                for (int j = 0; j < cant; j++)
                {
                    List<ResultadoEvaluacion_Result> listaResultadoVez = _service.ListaResultado(idUsuario, j + 1);
                    string dimValor = Convert.ToString(  listaResultadoVez[i].Valor).Replace(",",".");
                    

                    jsonString.Append("\"Valor " + (j+1) + "\": " + dimValor + ",");
                    if (j == (cant-1))
                    {
                        jsonString = jsonString.Remove(jsonString.Length - 1, 1);
                    }
                }
                
                jsonString.Append("},");


            }

            jsonString = jsonString.Remove(jsonString.Length - 1, 1);
            jsonString.Append("]");
            return jsonString.ToString();
        }
    }
}