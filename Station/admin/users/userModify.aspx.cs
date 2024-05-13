using Station.classes;
using Station.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.admin.users
{
    public partial class userModify : ConnDB
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnSave.Text = (Master as adminMaster).UserSetting.rm.GetString("Save", (Master as adminMaster).UserSetting.ci);
                if (Request.QueryString["userId"] != null)
                {
                    GetData(int.Parse(Request.QueryString["userId"]));
                }
            }
        }
        protected void GetData(int userId)
        {
            var obj = db.tbl_Users.Where(x => x.Id == userId).FirstOrDefault();
            txtName.Text = obj.FullName;
            txtMobile.Text = obj.UserMobile;
            txtEmail.Text = obj.UserEmail;
            txtUserName.Text = obj.UserName;
            txtPassword.Text = obj.UserPassword;
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    if (Request.QueryString["userId"] == null)
                    {
                        var obj = new tbl_Users();
                        SetData(obj);
                        db.tbl_Users.Add(obj);
                        db.SaveChanges();
                    }
                    else
                    {
                        int userId = int.Parse(Request.QueryString["userId"]);
                        var obj = db.tbl_Users.Where(x => x.Id == userId).FirstOrDefault();
                        SetData(obj);
                        db.Entry(obj);
                        db.SaveChanges();

                    }
                }
            }
            catch (Exception ex)
            {
            }
        }

        protected void SetData(tbl_Users obj)
        {
            obj.FullName = txtName.Text;
            obj.UserMobile = txtMobile.Text;
            obj.UserEmail = txtEmail.Text;
            obj.UserName = txtUserName.Text;
            obj.UserPassword = txtPassword.Text;
        }
    }
}