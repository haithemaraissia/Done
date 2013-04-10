using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Profile;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using SidejobModel;

public partial class Management_Advertise_Test : System.Web.UI.Page
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
                ((ProfileCommon)(i)).LastActivityDate));

        }


        //GridView1.DataSource = profileList;
        // GridView1.DataBind();
        GridView1.DataSource = profileList2;
        GridView1.DataBind();
    }




    protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        GridView1.PageIndex = e.NewPageIndex;
    }
}

public class CustomProfileList
{
    public string Name { get; set; }
    public string Gender { get; set; }
    public string Location { get; set; }
    public string Industry { get; set; }
    public string Age { get; set; }
    public string Email { get; set; }
    public string Language { get; set; }
    public int LCID { get; set; }
    public string Cellphone { get; set; }
    public string Picture1 { get; set; }
    public DateTime Activity { get; set; }

    public CustomProfileList(string name, string gender, string location,
        string industry, string age, string email, string language, int lcid,
        string cellphone, string picture1, DateTime activity)
    {
        Name = name;
        Gender = gender;
        Location = location;
        Industry = industry;
        Age = age;
        Email = email;
        Language = language;
        LCID = lcid;
        Cellphone = cellphone;
        Picture1 = picture1;
        Activity = activity;
    }
}