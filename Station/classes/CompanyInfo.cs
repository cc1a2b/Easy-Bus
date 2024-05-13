using Station.classes;

namespace Station
{
    public partial class siteMaster
    {
        public class CompanyInfo
        {
            public int Id { get; set; }
            public string CompanyName { get; set; }
            public string CompanyMobile { get; set; }
            public string CompanyEmail { get; set; }
            public string CompanyAddress { get; set; }
            public string Longitude { get; set; }
            public string Latitude { get; set; }
            public string CompanyLogo { get; set; }

            public CompanyInfo()
            {
                ConnDB connDB = new ConnDB();
                var info = connDB.db.tbl_Company.Find(1);
                if (info != null)
                {
                    Id = info.Id;
                    CompanyName = info.CompanyName;
                    CompanyMobile = info.CompanyMobile;
                    CompanyEmail = info.CompanyEmail;
                    CompanyAddress = info.CompanyAddress;
                    Latitude = info.Latitude;
                    Longitude = info.Longitude;
                    CompanyLogo = info.CompanyLogo;
                }
            }

        }
    }
}