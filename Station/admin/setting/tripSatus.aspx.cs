using Station.classes;
using Station.DataModel;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.admin.setting
{
    public partial class tripSatus : ConnDB
    {
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
            var Lst = db.tbl_TripStatus.ToList();
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
                var obj = db.tbl_TripStatus.Where(x => x.Id == elementId).FirstOrDefault();
                txtName.Text = obj.TripStatus;
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
                var obj = new tbl_TripStatus();
                obj.TripStatus = txtName.Text;
                db.tbl_TripStatus.Add(obj);
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
                var obj = db.tbl_TripStatus.Where(x => x.Id == objId).FirstOrDefault();
                obj.TripStatus = txtName.Text;
                db.Entry(obj);
                db.SaveChanges();

                ShowMessge("alert alert-success", AlertMessage.SuccessUpdate);
                txtName.Text = obj.TripStatus;
                GetData();
            }
            catch (Exception ex)
            {
                ShowMessge("alert alert-danger", AlertMessage.FailedUpdate);
            }
        }
        protected void ClearControls()
        {
            ElementId.Value = txtName.Text = "";
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
                var obj = db.tbl_TripStatus.Where(x => x.Id == elementId).FirstOrDefault();
                db.tbl_TripStatus.Remove(obj);
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