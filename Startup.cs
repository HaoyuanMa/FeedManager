using Microsoft.Owin;
using Owin;

[assembly: OwinStartupAttribute(typeof(Feed_Manager.Startup))]
namespace Feed_Manager
{
    public partial class Startup {
        public void Configuration(IAppBuilder app) {
            ConfigureAuth(app);
        }
    }
}
