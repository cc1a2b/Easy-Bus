using Station.classes;
using Station.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection.Emit;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station
{
    public partial class register : ConnDB
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnRegister_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    var passenger = db.tbl_Passengers.Where(x => x.PassengerIdNum == txtID.Text ||
                    x.PassengerMobile == txtMobile.Text).ToList();
                    if (passenger.Count <= 0)
                    {
                        SaveData();
                    }
                    else
                    {
                        DivAlert.Visible = true;
                        DivAlert.Attributes.Add("class", "alert alert-danger");
                        AlertMsg.Text = "عفواً..! رقم الهوية أو رقم الجوال مسبقاً..؛";
                    }
                }
            }
            catch (Exception ex)
            {
                DivAlert.Visible = true;
                DivAlert.Attributes.Add("class", "alert alert-danger");
                AlertMsg.Text = AlertMessage.FailedSave;
            }
        }
        protected void SaveData()
        {
            //****************Save Passenger***************//
            var passenger = new tbl_Passengers();
            passenger.PassengerName = txtName.Text;
            passenger.PassengerIdNum = txtID.Text;
            passenger.PassengerMobile = txtMobile.Text;
            passenger.PassengerEmail = txtEmail.Text;
            passenger.Password = txtPassword.Text;
            db.tbl_Passengers.Add(passenger);
            db.SaveChanges();

            DivAlert.Visible = true;
            DivAlert.Attributes.Add("class", "alert alert-success");
            AlertMsg.Text = AlertMessage.SuccessSave;

            Response.Redirect("~/login.aspx", false);
        }
    }
}