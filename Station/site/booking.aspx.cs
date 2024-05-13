using Microsoft.Reporting.Map.WebForms.BingMaps;
using Station.classes;
using Station.DataModel;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Station.site
{
    public partial class booking : ConnDB
    {
        CultureInfo enCulture = new CultureInfo("en-US");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                BindSelections();
            }
        }
        protected void BindSelections()
        {
            //***********ddlFromStation***********//
            var stationLst = db.tbl_Stations.ToList();
            ddlFromStation.DataSource = stationLst;
            ddlFromStation.DataValueField = "Id";
            ddlFromStation.DataTextField = "StationName";
            ddlFromStation.DataBind();
            //***********ddlToStation***********//
            ddlToStation.DataSource = stationLst;
            ddlToStation.DataValueField = "Id";
            ddlToStation.DataTextField = "StationName";
            ddlToStation.DataBind();
        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    int fromStation = Convert.ToInt32(ddlFromStation.SelectedValue);
                    int toStation = Convert.ToInt32(ddlToStation.SelectedValue);
                    DateTime date = Convert.ToDateTime(txtDepartureDate.Text, enCulture).Date;
                    if (date.Date < DateTime.Now.Date)
                    {
                        DivAlert.Visible = true;
                        DivAlert.Attributes.Add("class", "alert alert-danger");
                        AlertMsg.Text = "التاريخ غير صحيح..؛";
                        return;
                    }
                    var Lst = db.GetSchedule().Where(x => x.FromStationId == fromStation && x.ToStationId == toStation).ToList();
                    if (Lst.Count > 0)
                    {
                        DivAlert.Visible = false;
                        lvData.DataSource = Lst;
                        lvData.DataBind();
                    }
                    else
                    {
                        lvData.DataSource = null;
                        lvData.DataBind();
                        DivAlert.Visible = true;
                        DivAlert.Attributes.Add("class", "alert alert-danger");
                        AlertMsg.Text = "لم يتم العثور على نتائج..؛";
                    }
                }
            }
            catch (Exception ex)
            {
                DivAlert.Visible = true;
                DivAlert.Attributes.Add("class", "alert alert-danger");
                AlertMsg.Text = "لم يتم العثور على نتائج..؛";
            }
        }
        protected void btnBook_Click(object sender, EventArgs e)
        {
            try
            {
                if (Session["PassengerId"] != null)
                {
                    int tripId = int.Parse((sender as LinkButton).CommandArgument);
                    //*******************************//
                    var booking = new tbl_Booking();
                    booking.tripId = tripId;
                    booking.PassengerId = Convert.ToInt32(Session["PassengerId"]);
                    DateTime travelDate = Convert.ToDateTime(txtDepartureDate.Text, enCulture).Date;
                    booking.TravelDate = travelDate;
                    booking.RegistDate = DateTime.Now;
                    booking.BookStatus = 1;
                    db.tbl_Booking.Add(booking);
                    db.SaveChanges();
                    
                    DivAlert.Visible = true;
                    DivAlert.Attributes.Add("class", "alert alert-success");
                    AlertMsg.Text = AlertMessage.SuccessSave;

                    //Session["DataSources"] = db.GetBooking().Where(x => x.Id == booking.Id).ToList();
                    //Session["ReportPath"] = "ClientInvoice_Rp.rdlc";
                    //Session["DSname"] = "DataSet1";
                    //string Url = ResolveUrl("~") + "Reports/";
                    //ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + Url + "','_blank')", true);
                }
                else
                {
                    Response.Redirect("~/login.aspx",false);
                    //openModal();
                    ////int elementId = int.Parse((sender as LinkButton).CommandArgument);
                    //tripId.Value = elementId.ToString();
                }
            }
            catch (Exception ex)
            {
                DivAlert.Visible = true;
                DivAlert.Attributes.Add("class", "alert alert-danger");
                AlertMsg.Text = AlertMessage.FailedView;
            }
        }

        //protected void openModal()
        //{
        //    ClearControls();
        //    DivAlert.Visible = false;
        //    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('show'); </script>", false);
        //    UpdatePanel1.Update();
        //}
        //protected void ClearControls()
        //{
        //    tripId.Value = txtName.Text = txtID.Text = txtMobile.Text = txtEmail.Text = txtPassword.Text = "";
        //    //txtusername.Text = txtPassword.Text= "";
        //}
        //protected void btnSavePassenger_Click(object sender, EventArgs e)
        //{
        //    try
        //    {
        //        if (Page.IsValid)
        //        {
        //            if (tripId.Value != "")
        //            {
        //                var passenger = db.tbl_Passengers.Where(x => x.PassengerIdNum == txtID.Text ||
        //                x.PassengerMobile == txtMobile.Text).ToList();
        //                if (passenger.Count <= 0)
        //                { SaveData(); }
        //                else
        //                {
        //                    Div1.Visible = true;
        //                    Div1.Attributes.Add("class", "alert alert-danger");
        //                    Label1.Text = "عفواً..! رقم الهوية أو رقم الجوال مسبقاً..؛";
        //                    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('show'); </script>", false);
        //                }
        //            }
        //        }
        //    }
        //    catch (Exception ex)
        //    {
        //        Div1.Visible = true;
        //        Div1.Attributes.Add("class", "alert alert-danger");
        //        Label1.Text = AlertMessage.FailedSave;
        //        ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('show'); </script>", false);

        //    }
        //}
        //protected void SaveData()
        //{
        //    //****************Save Passenger***************//
        //    var passenger = new tbl_Passengers();
        //    passenger.PassengerName = txtName.Text;
        //    passenger.PassengerIdNum = txtID.Text;
        //    passenger.PassengerMobile = txtMobile.Text;
        //    passenger.PassengerEmail = txtEmail.Text;
        //    //passenger.UserName = txtMobile.Text;
        //    passenger.Password = txtPassword.Text;
        //    db.tbl_Passengers.Add(passenger);
        //    db.SaveChanges();


        //    ////*******************************//
        //    //var book = new tbl_Booking();
        //    //book.tripId = Convert.ToInt32(tripId.Value);
        //    //book.PassengerId = passenger.Id;
        //    //book.RegistDate = DateTime.Now;
        //    //book.BookStatus = 1;
        //    //db.tbl_Booking.Add(book);
        //    //db.SaveChanges();

        //    ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('hide'); </script>", false);

        //    //DivAlert.Visible = true;
        //    //DivAlert.Attributes.Add("class", "alert alert-success");
        //    //AlertMsg.Text = AlertMessage.SuccessSave;
        //}

    }
}