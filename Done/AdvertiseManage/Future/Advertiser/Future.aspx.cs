using System;
using System.Collections;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using AdDatabaseModel;

public partial class Management_Advertiser_Test : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //USE THIS WITH APPLICATION ID = "4de2c56c-fbff-4fa1-b02c-4d4a3f300e1f" 
        //to match the other application : advertiser
        //Continue to find the extraction method of the profile


        //URL TO FOLLOW:
        //http://www.karpach.com/Get-asp-net-profile-value-MS-SQL-database-using-T-SQL.htm
        //http://www.opensourcec.org/blogs/dotnet_tweeks/default.aspx

        using (var context = new AdDatabaseModel.AdDatabaseEntities())
        {
           //var result = (from c in context.aspnet_Users 
           //              where c.ApplicationId == Guid.Parse("4de2c56c-fbff-4fa1-b02c-4d4a3f300e1f")
           //                                      select c).ToList();


           var result = (from c in context.aspnet_Users
                         select c).ToList();
            


            foreach ( aspnet_Users i in (IEnumerable) result)
            {
                var y = (from c in context.aspnet_Profile
                         where c.UserId == i.UserId
                         select c).ToList();
            }
        }


        //SAMPLE DATA



        GridView1.DataSource = Membership.GetAllUsers(); 
        GridView1.DataBind();

        //Afghanistan1Admin228230~/Advertiser/Profile/Photo/add-male-user.pngsmith10Concierge,postmaster@programmingfundamental.com~/Advertiser/Profile/Photo/add-male-user.png1~/Advertiser/Profile/Photo/add-male-user.pngBadakhshan~/Advertiser/Profile/Photo/add-male-user.pngFavorite PetSinglehttp://www.haithem-araissia.comnonehaithemEnglish18

        //Country:S:0:11:Gender:S:11:1:Description:S:12:5:Cellphone:S:17:0:Facebook:S:17:0:ProfessionID:S:17:2:RegionID:S:19:3:Zipcode:S:22:1:Picture3:S:23:44:LastName:S:67:5:Industry:S:72:1:City:S:73:0:CityID:S:73:1:Profession:S:74:10:Email:S:84:37:Picture2:S:121:44:Twitter:S:165:0:CountryID:S:165:1:LinkedIn:S:166:0:Picture1:S:166:44:Region:S:210:10:Picture4:S:220:44:Question:S:264:12:MaritalStatus:S:276:6:CompanyURL:S:282:31:Answer:S:313:4:FirstName:S:317:7:Language:S:324:7:Age:S:331:2:




        ////Another Approach that had failed;
        //Using different membership
        var test = Membership.Provider.ApplicationName.ToString();

        var membershipProvider1 = Membership.Providers["AdvertiseManagementSideJobSqlMembershipProvider"];

        var test2 = membershipProvider1.GetUser("Tim", false);
        var profile = Profile.GetProfile("Tim"); 

        var membershipProvider2 = Membership.Providers["AdvertiseSideJobSqlMembershipProvider"];

        var test3 = membershipProvider2.GetUser("Tim", false);
        var profile2 = Profile.GetProfile("Tim"); 


    }




    protected void GridView1PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
        GridView1.DataBind();
    }
}

