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

namespace Station.admin.setting
{
    public partial class company : ConnDB
    {
        string filePath = HostingEnvironment.MapPath("~/uploads/");
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                btnSave.Text = (Master as adminMaster).UserSetting.rm.GetString("Save", (Master as adminMaster).UserSetting.ci);
                GetData();
            }
        }

        protected void GetData()
        {
            var Lst = db.tbl_Company.ToList();
            lvData.DataSource = Lst;
            lvData.DataBind();
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
                var obj = db.tbl_Company.Where(x => x.Id == elementId).FirstOrDefault();
                txtName.Text = obj.CompanyName;
                txtMobile.Text = obj.CompanyMobile;
                txtEmail.Text = obj.CompanyEmail;
                txtAddress.Text = obj.CompanyAddress;
                ProdImg.ImageUrl = "~/uploads/" + obj.CompanyLogo;
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
                if (Page.IsValid && ElementId.Value != "")
                {
                    UpdateData();
                }
            }
            catch (Exception ex)
            {
                (Master as adminMaster).PopAlertMsg("alert alert-danger", AlertMessage.FailedSave);
            }
        }
        protected void UpdateData()
        {
            try
            {
                int objId = Convert.ToInt32(ElementId.Value);
                var obj = db.tbl_Company.Where(x => x.Id == objId).FirstOrDefault();
                obj.CompanyName = txtName.Text;
                obj.CompanyMobile = txtMobile.Text;
                obj.CompanyEmail = txtEmail.Text;
                obj.CompanyAddress = txtAddress.Text;
                #region FileUpload
                if (fileUplaod1.HasFile)
                {
                    // Delete Old Image
                    if (!string.IsNullOrEmpty(obj.CompanyLogo) && File.Exists(filePath + obj.CompanyLogo))
                    {
                        File.Delete(filePath + obj.CompanyLogo);
                    }
                    // Upload New Image
                    string ItemImg = null;
                    string FileExtention = fileUplaod1.FileName.Split('.').Last().ToString();
                    ItemImg = Guid.NewGuid() + "." + FileExtention;
                    fileUplaod1.PostedFile.SaveAs(filePath + ItemImg);
                    obj.CompanyLogo = ItemImg;
                }
                #endregion
                db.Entry(obj);
                db.SaveChanges();

                //ShowMessge("alert alert-success", AlertMessage.SuccessUpdate);
                GetData();
            }
            catch (Exception ex)
            {
                ShowMessge("alert alert-danger", AlertMessage.FailedUpdate);
            }
        }
        protected void ClearControls()
        {
            ElementId.Value = txtName.Text = txtMobile.Text = txtEmail.Text = txtAddress.Text = "";
            ProdImg.ImageUrl = null;
        }
        protected void ShowMessge(string CssClass, string Message)
        {
            openModal();
            DivAlert.Visible = true;
            DivAlert.Attributes.Add("class", CssClass);
            AlertMsg.Text = Message;
        }
    }
}