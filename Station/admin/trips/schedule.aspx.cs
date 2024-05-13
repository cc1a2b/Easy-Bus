using Station.classes;
using Station.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.admin.trips
{
    public partial class schedule : ConnDB
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnSave.Text = (Master as adminMaster).UserSetting.rm.GetString("Save", (Master as adminMaster).UserSetting.ci);
                BindSelections();
                GetData();
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
            ////***********ddlStatus***********//
            //var statusLst = db.tbl_TripStatus.ToList();
            //ddlStatus.DataSource = statusLst;
            //ddlStatus.DataValueField = "Id";
            //ddlStatus.DataTextField = "TripStatus";
            //ddlStatus.DataBind();
        }
        protected void GetData()
        {
            var Lst = db.GetSchedule().ToList();
            lvData.DataSource = Lst;
            lvData.DataBind();
        }
        protected void btnAddNew_Click(object sender, EventArgs e)
        {
            try
            {
                openModal();
            }
            catch (Exception ex)
            {
                (Master as adminMaster).PopAlertMsg("alert alert-danger", AlertMessage.FailedView);
            }
        }
        protected void openModal()
        {
            ClearControls();
            DivAlert.Visible = false;
            ScriptManager.RegisterStartupScript(this.Page, typeof(Page), ClientID, "<script language='javascript'> $('#myModal').modal('show'); </script>", false);
            UpdatePanel1.Update();
        }
        protected void btnUpdate_Click(object sender, EventArgs e)
        {
            try
            {
                openModal();
                int elementId = int.Parse((sender as LinkButton).CommandArgument);
                ElementId.Value = elementId.ToString();
                var obj = db.tbl_Schedule.Where(x => x.Id == elementId).FirstOrDefault();
                ddlFromStation.SelectedValue = obj.FromStationId.ToString();
                ddlToStation.SelectedValue = obj.ToStationId.ToString();
                txtTime.Text = Convert.ToDateTime(obj.TripTime).TimeOfDay.ToString();
                txtPrice.Text = obj.TtripCost.ToString();
                //ddlStatus.SelectedValue = obj.TripStatusId.ToString();
            }
            catch (Exception ex)
            {
                (Master as adminMaster).PopAlertMsg("alert alert-danger", AlertMessage.FailedView);
            }
        }
        protected void btnSave_Click(object sender, EventArgs e)
        {
            try
            {
                if (Page.IsValid)
                {
                    if (ElementId.Value == "")
                    {
                        SaveData();
                    }
                    else
                    {
                        UpdateData();
                    }
                }
            }
            catch (Exception ex)
            {
                (Master as adminMaster).PopAlertMsg("alert alert-danger", AlertMessage.FailedSave);
            }
        }
        protected void SaveData()
        {
            try
            {
                var obj = new tbl_Schedule();
                obj.FromStationId = Convert.ToInt32(ddlFromStation.SelectedValue);
                obj.ToStationId = Convert.ToInt32(ddlToStation.SelectedValue);
                TimeSpan time = Convert.ToDateTime(txtTime.Text).TimeOfDay;
                obj.TripTime = time;
                obj.TtripCost = Convert.ToDouble(txtPrice.Text);
                //obj.TripStatusId = Convert.ToInt32(ddlStatus.SelectedValue);
                obj.TripStatusId = 1;
                db.tbl_Schedule.Add(obj);
                db.SaveChanges();

                ShowMessge("alert alert-success", AlertMessage.SuccessSave);
                GetData();
            }
            catch (Exception ex)
            {
                ShowMessge("alert alert-danger", AlertMessage.FailedSave);
            }
        }
        protected void UpdateData()
        {
            try
            {
                int objId = Convert.ToInt32(ElementId.Value);
                var obj = db.tbl_Schedule.Where(x => x.Id == objId).FirstOrDefault();
                obj.FromStationId = Convert.ToInt32(ddlFromStation.SelectedValue);
                obj.ToStationId = Convert.ToInt32(ddlToStation.SelectedValue);
                TimeSpan time = Convert.ToDateTime(txtTime.Text).TimeOfDay;
                obj.TripTime = time;
                obj.TtripCost = Convert.ToDouble(txtPrice.Text);
                //obj.TripStatusId = Convert.ToInt32(ddlStatus.SelectedValue);
                db.Entry(obj);
                db.SaveChanges();

                ShowMessge("alert alert-success", AlertMessage.SuccessUpdate);
                GetData();
            }
            catch (Exception ex)
            {
                ShowMessge("alert alert-danger", AlertMessage.FailedUpdate);
            }
        }
        protected void ClearControls()
        {
            ElementId.Value = txtTime.Text = txtPrice.Text = "";
            ddlFromStation.SelectedValue = ddlToStation.SelectedValue = "-1";
            //ddlStatus.SelectedValue = "-1";
        }
        protected void ShowMessge(string CssClass, string Message)
        {
            openModal();
            DivAlert.Visible = true;
            DivAlert.Attributes.Add("class", CssClass);
            AlertMsg.Text = Message;
        }
        protected void btnDelete_Click(object sender, EventArgs e)
        {
            try
            {
                int elementId = int.Parse((sender as LinkButton).CommandArgument);
                var obj = db.tbl_Schedule.Where(x => x.Id == elementId).FirstOrDefault();
                db.tbl_Schedule.Remove(obj);
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