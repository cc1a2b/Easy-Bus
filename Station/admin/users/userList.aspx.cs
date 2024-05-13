using Microsoft.ReportingServices.Diagnostics.Internal;
using Station.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.admin.users
{
    public partial class userList : ConnDB
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                GetData();
            }
        }

        protected void GetData()
        {
            var Lst = db.tbl_Users.ToList();
            lvData.DataSource = Lst;
            lvData.DataBind();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int elementId = int.Parse((sender as LinkButton).CommandArgument);
                var obj = db.tbl_Users.Where(x => x.Id == elementId).FirstOrDefault();
                db.tbl_Users.Remove(obj);
                db.SaveChanges();
                GetData();
            }
            catch (Exception ex)
            {

            }
        }
    }
}