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
    
    public partial class tbl_Passengers
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public tbl_Passengers()
        {
            this.tbl_Booking = new HashSet<tbl_Booking>();
        }
    
        public int Id { get; set; }
        public string PassengerName { get; set; }
        public string PassengerIdNum { get; set; }
        public string PassengerMobile { get; set; }
        public string PassengerEmail { get; set; }
        public string UserName { get; set; }
        public string Password { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<tbl_Booking> tbl_Booking { get; set; }
    }
}
