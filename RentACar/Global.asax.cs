using System;
using System.Web;
using System.Web.Routing;
using System.Web.Optimization;
using System.Web.Security;
using System.Web.SessionState;
using System.Threading;
using System.Globalization;
using System.Data.Entity;
using RentACar.Data; 

namespace RentACar
{
    public class Global : HttpApplication
    {
        private const string DefaultCulture = "tr-TR";

        void Application_Start(object sender, EventArgs e)
        {
            Database.SetInitializer(new CreateDatabaseIfNotExists<RentACarDbContext>());

            RouteConfig.RegisterRoutes(RouteTable.Routes);
            BundleConfig.RegisterBundles(BundleTable.Bundles);
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {
            SetCurrentCulture();
        }

        private void SetCurrentCulture()
        {
            string cultureCode = DefaultCulture;
            HttpCookie cultureCookie = Request.Cookies["Culture"];

            if (cultureCookie != null && !string.IsNullOrEmpty(cultureCookie.Value))
            {
                cultureCode = cultureCookie.Value;
            }
            else
            {
                HttpCookie newCookie = new HttpCookie("Culture", DefaultCulture)
                {
                    Expires = DateTime.Now.AddYears(1),
                    HttpOnly = true
                };
                Response.Cookies.Add(newCookie);
            }

            ApplyCulture(cultureCode);
        }

        private void ApplyCulture(string cultureCode)
        {
            try
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo(cultureCode);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(cultureCode);
            }
            catch (Exception ex)
            {
                Thread.CurrentThread.CurrentCulture = new CultureInfo(DefaultCulture);
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(DefaultCulture);
            }
        }
    }
}