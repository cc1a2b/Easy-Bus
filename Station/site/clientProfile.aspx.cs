using Station.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.site
{
    public partial class clientProfile : ConnDB
    {
        public int? ClientId
        {
            get
            {
                if (ViewState["ClientId"] != null)
                    return int.Parse(ViewState["ClientId"].ToString());
                else
                    return null;
            }
            set
            {
                ViewState["ClientId"] = value;
            }
        }
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnSave.Text = (Master as siteMaster).UserSetting.rm.GetString("Save", (Master as siteMaster).UserSetting.ci);

                if (Session["PassengerId"] != null)
                {
                    ClientId = Convert.ToInt32(Session["PassengerId"].ToString());
                    GetClient();
                    GetClientBooking();
                }
                else
                {
                    Response.Redirect("~/site/index.aspx", false);
                }
            }
        }
        protected void GetClient()
        {
            var info = db.tbl_Passengers.Find(ClientId);
            if (info != null)
            {
                lblName.InnerText = info.PassengerName;
                lblMobile.InnerText = info.PassengerMobile;
                lblEmail.InnerText = info.PassengerEmail;
            }
        }
        protected void GetClientBooking()
        {
            var Lst = db.GetBooking().Where(x => x.PassengerId == ClientId).OrderByDescending(x => x.Id).ToList();
            lvData.DataSource = Lst;
            lvData.DataBind();
        }


        protected void DataGrid_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            lvData.PageIndex = e.NewPageIndex;
            GetClientBooking();
            lvData.Focus();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            openModal();
            var passenger = db.tbl_Passengers.Find(ClientId.Value);
            txtName.Text = passenger.PassengerName;
            txtID.Text = passenger.PassengerIdNum;
            txtMobile.Text = passenger.PassengerMobile;
            txtEmail.Text = passenger.PassengerEmail;
            txtPassword.Text = passenger.Password;
        }
        protected void openModal()
        {
            ClearControls();
            //DivAlert.Visible = false;
            ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('show'); </script>", false);
            UpdatePanel1.Update();
        }
        protected void ClearControls()
        {
            elementId.Value = txtName.Text = txtID.Text = txtMobile.Text = txtEmail.Text = txtPassword.Text = "";
        }
        protected void btnSavePassenger_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    var passenger = db.tbl_Passengers.Where(x => x.Id != ClientId.Value &&
                    (x.PassengerIdNum == txtID.Text || x.PassengerMobile == txtMobile.Text)).ToList();
                    if (passenger.Count <= 0)
                    {
                        SaveData();
                    }
                    else
                    {
                        Div1.Visible = true;
                        Div1.Attributes.Add("class", "alert alert-danger");
                        Label1.Text = "عفواً..! رقم الهوية أو رقم الجوال مسبقاً..؛";
                        ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('show'); </script>", false);
                    }
                }
            }
            catch (Exception ex)
            {
                Div1.Visible = true;
                Div1.Attributes.Add("class", "alert alert-danger");
                Label1.Text = AlertMessage.FailedSave;
                ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('show'); </script>", false);

            }
        }
        protected void SaveData()
        {
            //****************Save Passenger***************//
            var passenger = db.tbl_Passengers.Find(ClientId.Value);
            passenger.PassengerName = txtName.Text;
            passenger.PassengerIdNum = txtID.Text;
            passenger.PassengerMobile = txtMobile.Text;
            passenger.PassengerEmail = txtEmail.Text;
            passenger.Password = txtPassword.Text;
            db.Entry(passenger);
            db.SaveChanges();

            ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('hide'); </script>", false);
            GetClient();
        }

        protected void btnPrint_Click(object sender, EventArgs e)
        {
            try
            {
                int bookingId = int.Parse((sender as LinkButton).CommandArgument);
                Session["DataSources"] = db.GetBooking().Where(x => x.Id == bookingId).ToList();
                Session["ReportPath"] = "ClientInvoice_Rp.rdlc";
                Session["DSname"] = "DataSet1";
                string Url = ResolveUrl("~") + "Reports/";
                ScriptManager.RegisterStartupScript(Page, Page.GetType(), "popup", "window.open('" + Url + "','_blank')", true);
            }
            catch (Exception ex)
            {
            }
        }
    }
}