using Station.admin.setting;
using Station.classes;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Station.admin
{
    public partial class _default : ConnDB
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
            var Vehicles = db.GetVehicles().ToList();
            lblVehicle.Text = Vehicles.Count.ToString();
            //var Schedule = db.GetSchedule().Where(x => x.TripDate >= DateTime.Now).ToList();
            //lblSchedule.Text = Schedule.Count.ToString();
            var Booking = db.GetBooking().ToList();
            lblBooking.Text = Booking.Count.ToString();
            var Passengers = db.tbl_Passengers.ToList();
            lblPassenger.Text = Passengers.Count.ToString();

        }
    }
}