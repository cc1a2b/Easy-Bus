//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace Station.DataModel
{
    using System;
    
    public partial class GetSchedule_Result
    {
        public int Id { get; set; }
        public Nullable<int> FromStationId { get; set; }
        public Nullable<int> ToStationId { get; set; }
        public Nullable<int> TripStatusId { get; set; }
        public string FromStation { get; set; }
        public string ToStation { get; set; }
        public string TripStatus { get; set; }
        public Nullable<double> TtripCost { get; set; }
        public string StringTime { get; set; }
        public Nullable<System.TimeSpan> TripTime { get; set; }
    }
}
