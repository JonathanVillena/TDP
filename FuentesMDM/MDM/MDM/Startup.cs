using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(MDM.Startup))]
namespace MDM
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
