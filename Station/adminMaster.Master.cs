using Station.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using static Station.siteMaster;

namespace Station
{
    public partial class adminMaster : System.Web.UI.MasterPage
    {
        public CompanyInfo companyInfo = new CompanyInfo();
        public UserSetting UserSetting = new UserSetting();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                ddLang.SelectedValue = UserSetting.ci.ToString();
                if (Session["UserId"] == null)
                {
                    Response.Redirect("~/login.aspx", false);
                }
            }
        }
        protected void ddLang_SelectedIndexChanged(object sender, EventArgs e)
        {
            UserSetting.SetUserCulture(ddLang.SelectedValue.ToString());
            Response.Redirect(Request.RawUrl);
        }
        public void PopAlertMsg(string CssClass, string Message)
        {
            DivAlert.Visible = true;
            DivAlert.Attributes.Add("class", CssClass);
            AlertMsg.Text = Message;
        }

        
    }
}