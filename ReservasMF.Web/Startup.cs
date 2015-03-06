using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(ReservasMF.Web.Startup))]
namespace ReservasMF.Web
{
    public partial class Startup
    {
        public void Configuration(IAppBuilder app)
        {
            ConfigureAuth(app);
        }
    }
}
