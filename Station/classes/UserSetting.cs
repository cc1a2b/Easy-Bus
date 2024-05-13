using System;
using System.Globalization;
using System.Reflection;
using System.Resources;
using System.Threading;
using System.Web;

namespace Station.Classes
{
    public class UserSetting
    {
        public ResourceManager rm { get; set; }
        public CultureInfo ci { get; set; }

        public UserSetting()
        {
            rm = new ResourceManager("Station.App_GlobalResources.Lang", Assembly.GetExecutingAssembly());
            ci = Thread.CurrentThread.CurrentCulture;
        }

        public void CheckUserCookie()
        {
            ////CREATE COOKIES FOR USER SETTINGS
            HttpCookie cookie = HttpContext.Current.Request.Cookies["UserInfo"];
            string lang = "en-US";
            if (cookie == null || cookie.Value == null)
            {
                cookie = new HttpCookie("UserInfo");
                HttpContext.Current.Response.Cookies.Add(cookie);
            }
            else
            {
                lang = cookie["UserLang"].ToString();
            }

            SetUserCulture(lang);
        }

        public void SetUserCulture(string lang)
        {
            HttpCookie cookie = HttpContext.Current.Request.Cookies["UserInfo"];
            cookie["UserLang"] = lang;
            cookie.Expires = DateTime.Now.AddDays(30);
            HttpContext.Current.Response.Cookies.Add(cookie);

            Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
            Thread.CurrentThread.CurrentCulture = new CultureInfo(lang);
            ci = Thread.CurrentThread.CurrentCulture;
        }
    }

}