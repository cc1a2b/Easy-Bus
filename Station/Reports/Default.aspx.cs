using Microsoft.Reporting.WebForms;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using Station.Classes;
using Station.classes;
using Microsoft.ReportingServices.Diagnostics.Internal;
using Microsoft.ReportingServices.Interfaces;
using System.Web.Hosting;

namespace Station.Reports
{
    public partial class Default : ConnDB
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.IsPostBack)
            {
                if (Session["ClientId"] != null)
                {
                    try
                    {
                        ReportViewer1.LocalReport.ReportPath = MapPath(@"~/Reports/" + Session["ReportPath"].ToString());
                        ReportDataSource ds = new ReportDataSource();
                        ds.Name = Session["DSname"] != null ? Session["DSname"].ToString() : "";
                        ds.Value = Session["DataSources"];
                        ReportViewer1.LocalReport.EnableExternalImages = true;

                        #region SetReportParameters
                        var Info = db.tbl_Company.Find(1);
                        List<ReportParameter> prm = new List<ReportParameter>();
                        ReportParameterInfoCollection GetParameter = ReportViewer1.LocalReport.GetParameters();
                        if (GetParameter.Where(x => x.Name.Contains("CompanyName")).Count() > 0)
                        {
                            prm.Add(new ReportParameter("CompanyName", Info.CompanyName));
                        }
                        if (GetParameter.Where(x => x.Name.Contains("Mobile")).Count() > 0)
                        {
                            prm.Add(new ReportParameter("Mobile", Info.CompanyMobile));
                        }
                        if (GetParameter.Where(x => x.Name.Contains("Address")).Count() > 0)
                        {
                            prm.Add(new ReportParameter("Address", Info.CompanyAddress));
                        }
                        if (GetParameter.Where(x => x.Name.Contains("Logo")).Count() > 0)
                        {
                            prm.Add(new ReportParameter("Logo", "file:///" + HostingEnvironment.MapPath("~/Uploads/" + Info.CompanyLogo)));
                        }
                        #endregion

                        ReportViewer1.LocalReport.DataSources.Add(ds);

                        #region print to PDF
                        string mimeType = string.Empty;
                        string encoding = string.Empty;
                        string extension = string.Empty;
                        string deviceInfo = "<DeviceInfo>" +
                        "<OutputFormat>PDF</OutputFormat>" +
                        "<EmbedFonts>None</EmbedFonts>" +
                        "</DeviceInfo>";
                        Warning[] warnings;
                        string[] streams;
                        byte[] result = ReportViewer1.LocalReport.Render("PDF", deviceInfo, out mimeType, out encoding, out extension, out streams, out warnings);
                        this.Response.Clear();
                        this.Response.ContentType = mimeType;
                        this.Response.Cache.SetCacheability(HttpCacheability.Private);
                        this.Response.Expires = -1;
                        this.Response.Buffer = true;
                        this.Response.BinaryWrite(result);
                        this.Response.End();
                        #endregion
                    }
                    catch (Exception ex)
                    {

                    }
                }
                else
                {
                    Response.Redirect("~/site/index.aspx", false);
                }
            }
        }

    }
}