using Station.classes;
using Station.DataModel;
using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.admin.vehicles
{
    public partial class vehicleList : ConnDB
    {
        string filePath = HostingEnvironment.MapPath("~/uploads/vehicles/");
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
            var Lst = db.tbl_VehicleType.ToList();
            ddlType.DataSource = Lst;
            ddlType.DataValueField = "Id";
            ddlType.DataTextField = "VehicleType";
            ddlType.DataBind();
        }
        protected void GetData()
        {
            var Lst = db.GetVehicles().ToList();
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
                var obj = db.tbl_Vehicles.Where(x => x.Id == elementId).FirstOrDefault();
                ddlType.SelectedValue = obj.TypeId.ToString();
                txtPlateNo.Text = obj.VehiclePlate;
                txtModel.Text = obj.VehicleModel;
                txtSerial.Text = obj.VehicleSerial;
                txtColor.Text = obj.VehicleColor;
                txtSeatCount.Text = obj.SeatCount.ToString();
                ProdImg.ImageUrl = "~/uploads/vehicles/" + obj.VehicleImage;
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
                var obj = new tbl_Vehicles();
                obj.TypeId = Convert.ToInt32(ddlType.SelectedValue);
                obj.VehiclePlate = txtPlateNo.Text;
                obj.VehicleModel = txtModel.Text;
                obj.VehicleSerial = txtSerial.Text;
                obj.VehicleColor = txtColor.Text;
                obj.SeatCount = Convert.ToInt32(txtSeatCount.Text);
                #region FileUpload
                if (fileUplaod1.HasFile)
                {
                    // Upload New Image
                    string ItemImg = null;
                    string FileExtention = fileUplaod1.FileName.Split('.').Last().ToString();
                    ItemImg = Guid.NewGuid() + "." + FileExtention;
                    fileUplaod1.PostedFile.SaveAs(filePath + ItemImg);
                    obj.VehicleImage = ItemImg;
                }
                #endregion
                db.tbl_Vehicles.Add(obj);
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
                var obj = db.tbl_Vehicles.Where(x => x.Id == objId).FirstOrDefault();
                obj.TypeId = Convert.ToInt32(ddlType.SelectedValue);
                obj.VehiclePlate = txtPlateNo.Text;
                obj.VehicleModel = txtModel.Text;
                obj.VehicleSerial = txtSerial.Text;
                obj.VehicleColor = txtColor.Text;
                obj.SeatCount = Convert.ToInt32(txtSeatCount.Text);
                #region FileUpload
                if (fileUplaod1.HasFile)
                {
                    // Delete Old Image
                    if (!string.IsNullOrEmpty(obj.VehicleImage) && File.Exists(filePath + obj.VehicleImage))
                    {
                        File.Delete(filePath + obj.VehicleImage);
                    }
                    // Upload New Image
                    string ItemImg = null;
                    string FileExtention = fileUplaod1.FileName.Split('.').Last().ToString();
                    ItemImg = Guid.NewGuid() + "." + FileExtention;
                    fileUplaod1.PostedFile.SaveAs(filePath + ItemImg);
                    obj.VehicleImage = ItemImg;
                }
                #endregion
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
            ElementId.Value = txtPlateNo.Text = txtModel.Text = txtSerial.Text = txtColor.Text = txtSeatCount.Text = "";
            ddlType.SelectedValue = "-1"; 
            ProdImg.ImageUrl = null;
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
                var obj = db.tbl_Vehicles.Where(x => x.Id == elementId).FirstOrDefault();
                db.tbl_Vehicles.Remove(obj);
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