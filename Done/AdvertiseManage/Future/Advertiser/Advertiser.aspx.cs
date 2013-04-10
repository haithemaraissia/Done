using System;
using System.Collections.Generic;
using System.Linq;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI.WebControls;

namespace Management.Advertiser
{
    public partial class ManagementAdvertiserAdvertiser : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //GridView1.DataSource = ProfileManager.GetAllProfiles(ProfileAuthenticationOption.Authenticated);
            //GridView1.DataBind();


            //  Roles.GetUsersInRole("RoleName");



            using (var context = new AdDatabaseModel.AdDatabaseEntities())
            {
                var result = from c in context.aspnet_Users
                             select c;
                var t = result.FirstOrDefault();
            }


           // ProfileCommon profile = (ProfileCommon)ProfileBase.Create("Tim", true);
            var membershipProvider1 = Membership.Providers["MembershipProvider1"];

           var test =  membershipProvider1.GetUser("Tim", false);
            var profile = Profile.GetProfile("Tim"); 
            var muc = Roles.GetUsersInRole("Advertiser").Select(Membership.GetUser).ToList();
            // var muc = Membership.GetAllUsers();
            List<object> profileList =
                (from MembershipUser mu in muc select Profile.GetProfile(mu.UserName))
                    .Cast<object>()
                    .ToList();

            var profileList2 = new List<CustomProfileList>();
            foreach (var i in profileList)
            {

                profileList2.Add(new CustomProfileList
                                     (((ProfileCommon)(i)).FirstName + "," + ((ProfileCommon)(i)).LastName,
                                      ((ProfileCommon)(i)).Gender, ((ProfileCommon)(i)).CountryID.ToString() + "," +
                                                                   ((ProfileCommon)(i)).RegionID + "," + ((ProfileCommon)(i)).CityID + "," +
                                                                   ((ProfileCommon)(i)).Zipcode, ((ProfileCommon)(i)).ProfessionID,
                                      ((ProfileCommon)(i)).Age, ((ProfileCommon)(i)).Email, ((ProfileCommon)(i)).Language,
                                      ((ProfileCommon)(i)).LCID, ((ProfileCommon)(i)).Cellphone, ((ProfileCommon)(i)).Picture1,
                                      ((ProfileCommon)(i)).LastActivityDate, ((ProfileCommon)(i)).UserName));

            }


            //GridView1.DataSource = profileList;
            // GridView1.DataBind();
            GridView1.DataSource = profileList2;
            GridView1.DataBind();
        }




        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            GridView1.PageIndex = e.NewPageIndex;
            GridView1.DataBind();
        }
    }
}

