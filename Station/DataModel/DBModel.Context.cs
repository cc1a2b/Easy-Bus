﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    using System.Data.Entity.Core.Objects;
    using System.Linq;
    
    public partial class DBEntities : DbContext
    {
        public DBEntities()
            : base("name=DBEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<tbl_City> tbl_City { get; set; }
        public virtual DbSet<tbl_Drivers> tbl_Drivers { get; set; }
        public virtual DbSet<tbl_Passengers> tbl_Passengers { get; set; }
        public virtual DbSet<tbl_Stations> tbl_Stations { get; set; }
        public virtual DbSet<tbl_TripStatus> tbl_TripStatus { get; set; }
        public virtual DbSet<tbl_Users> tbl_Users { get; set; }
        public virtual DbSet<tbl_Vehicles> tbl_Vehicles { get; set; }
        public virtual DbSet<tbl_VehicleType> tbl_VehicleType { get; set; }
        public virtual DbSet<tbl_Company> tbl_Company { get; set; }
        public virtual DbSet<tbl_Booking> tbl_Booking { get; set; }
        public virtual DbSet<tbl_About> tbl_About { get; set; }
        public virtual DbSet<tbl_Schedule> tbl_Schedule { get; set; }
    
        public virtual ObjectResult<GetSchedule_Result> GetSchedule()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetSchedule_Result>("GetSchedule");
        }
    
        public virtual ObjectResult<GetStations_Result> GetStations()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetStations_Result>("GetStations");
        }
    
        public virtual ObjectResult<GetVehicles_Result> GetVehicles()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetVehicles_Result>("GetVehicles");
        }
    
        public virtual ObjectResult<GetBooking_Result> GetBooking()
        {
            return ((IObjectContextAdapter)this).ObjectContext.ExecuteFunction<GetBooking_Result>("GetBooking");
        }
    }
}