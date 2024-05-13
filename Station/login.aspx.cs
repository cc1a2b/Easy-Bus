using Station.classes;
using Station.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station
{
    public partial class login : ConnDB
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session.Clear();
        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    var user = db.tbl_Users.Where(x => x.UserName.ToLower() == txtUser.Text.ToLower() &&
                                                      x.UserPassword == txtPassword.Text).FirstOrDefault();
                    var passenger = db.tbl_Passengers.Where(x => x.PassengerMobile == txtUser.Text &&
                                                      x.Password == txtPassword.Text).FirstOrDefault();
                    if (user != null)
                    {
                        Session["UserId"] = user.Id;
                        Session["UserName"] = user.FullName;
                        Response.Redirect("~/admin/default.aspx", false);
                    }
                    else if (passenger != null)
                    {
                        Session["PassengerId"] = passenger.Id;
                        Session["PassengerName"] = passenger.PassengerName;
                        Response.Redirect("~/site/index.aspx", false);
                    }
                    else
                    {
                        DivAlert.Visible = true;
                        AlertMsg.Text = "اسم المستخدم أو كلمة المرو غير صحيح..؛";
                    }
                }
            }
            catch (Exception ex)
            {
                DivAlert.Visible = true;
                AlertMsg.Text = "تعذر تسجيل الدخول..؛";
            }
        }
    }
}