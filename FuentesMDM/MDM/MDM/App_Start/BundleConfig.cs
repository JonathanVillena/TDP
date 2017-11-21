using System.Web;
using System.Web.Optimization;

namespace MDM
{
    public class BundleConfig
    {
        // For more information on bundling, visit http://go.microsoft.com/fwlink/?LinkId=301862
        public static void RegisterBundles(BundleCollection bundles)
        {
            bundles.Add(new ScriptBundle("~/bundles/jquery").Include(
                        "~/Content/plugins/jQuery/jquery-2.2.3.min.js",
                        "~/Content/plugins/jQueryUI/jquery-ui.min.js"));

            bundles.Add(new ScriptBundle("~/bundles/bootstrap/Script").Include(
                      "~/Content/bootstrap/js/bootstrap.min.js"));

            bundles.Add(new StyleBundle("~/bundles/bootstrap").Include(
                      "~/Content/bootstrap/css/bootstrap.min.css",
                      "~/Content/plugins/jQueryUI/jquery-ui.css"
                      ));

            bundles.Add(new StyleBundle("~/bundles/dist").Include(
                 "~/Content/dist/css/AdminLTE.min.css",
                 "~/Content/dist/css/skins/_all-skins.min.css"
                ));
        }
    }
}
