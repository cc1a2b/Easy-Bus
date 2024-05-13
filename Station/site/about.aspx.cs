using Station.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml.Linq;

namespace Station.site
{
    public partial class about : ConnDB
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
            var about = db.tbl_About.Find(1);

            lblParagTitle.InnerText = about.ParagTitle;
            lblParagraph.InnerText = about.Paragraph;
            imgAbout.Src = "" + about.aboutImg;

            var Lst = db.GetVehicles().ToList();
            lvData.DataSource = Lst;
            lvData.DataBind();
        }
    }
}