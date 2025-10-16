using Microsoft.AspNet.Identity;
using Microsoft.AspNet.Identity.Owin;
using RentACar.Models;
using System;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace RentACar
{
    public partial class SiteMaster : MasterPage
    {
        private const string AntiXsrfTokenKey = "__AntiXsrfToken";
        private const string AntiXsrfUserNameKey = "__AntiXsrfUserName";
        private string _antiXsrfTokenValue;

        // Varsayılan dil
        private const string DefaultCulture = "tr-TR";

        protected void Page_Init(object sender, EventArgs e)
        {
            Page.PreInit += Master_Page_PreInit;

            // ... (Anti-XSRF kodunuz aynı kalıyor) ...
            var requestCookie = Request.Cookies[AntiXsrfTokenKey];
            Guid requestCookieGuidValue;
            if (requestCookie != null && Guid.TryParse(requestCookie.Value, out requestCookieGuidValue))
            {
                _antiXsrfTokenValue = requestCookie.Value;
                Page.ViewStateUserKey = _antiXsrfTokenValue;
            }
            else
            {
                _antiXsrfTokenValue = Guid.NewGuid().ToString("N");
                Page.ViewStateUserKey = _antiXsrfTokenValue;

                var responseCookie = new HttpCookie(AntiXsrfTokenKey)
                {
                    HttpOnly = true,
                    Value = _antiXsrfTokenValue
                };
                if (FormsAuthentication.RequireSSL && Request.IsSecureConnection)
                {
                    responseCookie.Secure = true;
                }
                Response.Cookies.Set(responseCookie);
            }

            Page.PreLoad += master_Page_PreLoad;
        }

        protected void Master_Page_PreInit(object sender, EventArgs e)
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
                System.Diagnostics.Debug.WriteLine($"--cultureCode: {cultureCode}");

                Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(cultureCode);
                Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(cultureCode);

                Page.Culture = cultureCode;
                Page.UICulture = cultureCode;
            }
            catch (Exception ex)
            {
                System.Diagnostics.Debug.WriteLine($"hata: {ex.Message}");
                Thread.CurrentThread.CurrentCulture = new System.Globalization.CultureInfo(DefaultCulture);
                Thread.CurrentThread.CurrentUICulture = new System.Globalization.CultureInfo(DefaultCulture);
                Page.Culture = DefaultCulture;
                Page.UICulture = DefaultCulture;
            }
        }

        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie cultureCookie = Request.Cookies["Culture"];
            if (cultureCookie != null && !string.IsNullOrEmpty(cultureCookie.Value))
            {
                ApplyCulture(cultureCookie.Value);
            }
        }

        protected void master_Page_PreLoad(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                // Set Anti-XSRF token
                ViewState[AntiXsrfTokenKey] = Page.ViewStateUserKey;
                ViewState[AntiXsrfUserNameKey] = Context.User.Identity.Name ?? String.Empty;
            }
            else
            {
                // Validate the Anti-XSRF token
                if ((string)ViewState[AntiXsrfTokenKey] != _antiXsrfTokenValue
                    || (string)ViewState[AntiXsrfUserNameKey] != (Context.User.Identity.Name ?? String.Empty))
                {
                    throw new InvalidOperationException("Validation of Anti-XSRF token failed.");
                }
            }
        }


        protected void Unnamed_LoggingOut(object sender, LoginCancelEventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
        }

        protected void Page_PreRender(object sender, EventArgs e)
        {
            if (!Context.User.Identity.IsAuthenticated)
                return;

            var manager = Context.GetOwinContext().GetUserManager<ApplicationUserManager>();
            var userId = Context.User.Identity.GetUserId();
            var user = manager.FindById(userId);

            if (user == null)
                return;

            var lbl = LoginView1.FindControl("lblUserName") as Label;
            if (lbl != null)
            {
                if (!string.IsNullOrWhiteSpace(user.Name) || !string.IsNullOrWhiteSpace(user.Surname))
                    lbl.Text = $"{user.Name} {user.Surname}";
                else
                    lbl.Text = user.UserName;
            }
        }

        protected void Logout_Click(object sender, EventArgs e)
        {
            Context.GetOwinContext().Authentication.SignOut(DefaultAuthenticationTypes.ApplicationCookie);
            System.Web.Security.FormsAuthentication.SignOut();
            Session.Clear();
            Session.Abandon();
            Response.Cookies.Clear();
            Response.Redirect("~/Account/Login.aspx", true);
        }

        protected void SetLanguage_Click(object sender, EventArgs e)
        {
            LinkButton btn = (LinkButton)sender;
            string cultureCode = btn.CommandArgument;

            HttpCookie cultureCookie = new HttpCookie("Culture", cultureCode)
            {
                Expires = DateTime.Now.AddYears(1),
                HttpOnly = true
            };
            Response.Cookies.Add(cultureCookie);
            Response.Cookies.Set(cultureCookie);

            ApplyCulture(cultureCode);

            Response.Redirect(Request.RawUrl);
        }
    }
}