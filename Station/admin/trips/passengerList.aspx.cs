using Station.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.admin.trips
{
    public partial class passengerList : ConnDB
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
            var Lst = db.tbl_Passengers.ToList();
            lvData.DataSource = Lst;
            lvData.DataBind();
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int elementId = int.Parse((sender as LinkButton).CommandArgument);
                var obj = db.tbl_Passengers.Where(x => x.Id == elementId).FirstOrDefault();
                db.tbl_Passengers.Remove(obj);
                db.SaveChanges();
                GetData();
                (Master as adminMaster).PopAlertMsg("alert alert-success", AlertMessage.SuccessDelete);
            }
            catch (Exception ex)
            {
                (Master as adminMaster).PopAlertMsg("alert alert-danger", AlertMessage.FailedDelete);
            }
        }

    }
}