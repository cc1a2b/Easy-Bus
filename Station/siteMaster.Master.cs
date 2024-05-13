using Station.Classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station
{
    public partial class siteMaster : System.Web.UI.MasterPage
    {
        public CompanyInfo companyInfo = new CompanyInfo();
        public UserSetting UserSetting = new UserSetting();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {

            }
        }
        protected void btnlang_Click(object sender, EventArgs e)
        {
            if (UserSetting.ci.ToString() == "ar-SA")
            {
                UserSetting.SetUserCulture("en-US");
            }
            else
            {
                UserSetting.SetUserCulture("ar-SA");
            }
            Response.Redirect(Request.RawUrl);
        }
    }
}