using Station.admin.trips;
using Station.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.site
{
    public partial class index : ConnDB
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSearch_Click(object sender, EventArgs e)
        {
            try
            {
                var booking = db.GetBooking().Where(x => x.BookingRef == Convert.ToInt32(txtBookingRef.Text)).FirstOrDefault();

                if (booking != null)
                {
                    DivAlert.Visible = false;
                    DivBooking.Visible = true;
                    lblPassenger.InnerText = booking.PassengerName;
                    lblDistination.InnerText = booking.FromStation + "_" + booking.ToStation;
                    lblDate.InnerText = Convert.ToDateTime(booking.TravelDate).ToString("yyyy/MM/dd");
                    lblTime.InnerText = booking.StringTime;
                }
                else
                {
                    DivBooking.Visible = false;
                    DivAlert.Visible = true;
                    DivAlert.Attributes.Add("class", "alert alert-danger");
                    AlertMsg.Text = "لم يتم العثور على نتائج..؛";
                }
            }
            catch (Exception ex)
            {
                DivBooking.Visible = false;
                DivAlert.Visible = true;
                DivAlert.Attributes.Add("class", "alert alert-danger");
                AlertMsg.Text = AlertMessage.FailedView;
            }
        }
    }
}