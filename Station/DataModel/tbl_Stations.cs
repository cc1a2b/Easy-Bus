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
    using System.Collections.Generic;
    
    public partial class tbl_Stations
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_Stations()
        {
            this.tbl_Users = new HashSet<tbl_Users>();
        }
    
        public int Id { get; set; }
        public Nullable<int> CityId { get; set; }
        public string StationName { get; set; }
        public string StationAddress { get; set; }
        public string StationLongitude { get; set; }
        public string StationLatitude { get; set; }
    
        public virtual tbl_City tbl_City { get; set; }
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Users> tbl_Users { get; set; }
    }
}