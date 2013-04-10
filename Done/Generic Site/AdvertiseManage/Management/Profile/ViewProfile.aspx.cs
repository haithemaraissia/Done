using System;
using System.Globalization;
using System.Threading;
using System.Web.Security;

namespace Management.Profile
{
    public partial class AdvertiserProfileViewProfile : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            string lang = Request.QueryString["l"];
            if (lang != null | !string.IsNullOrEmpty(lang))
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
                Session["LCID"] = Utility.GetLCID(lang);
            }
            else
            {
                if (Session["LCID"] != null)
                {
                    Thread.CurrentThread.CurrentUICulture = new CultureInfo(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                    Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                }
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["LCID"] == null)
            {
                Session["LCID"] = 1;
            }
            if (Page.IsPostBack) return;
            var user = Membership.GetUser();
            if (user != null)
            {
                GetAttributes();
            }
            else
            {
                Response.Redirect(Utility.Login());
            }
        }

        protected void GetAttributes()
        {
            if (Profile.Email == "null")
            {
                EmailAddress.NavigateUrl = "";
                EmailAddress.Text = "";
            }
            else
            {
                EmailAddress.NavigateUrl = "mailto:" + Profile.Email;
                EmailAddress.Text = Profile.Email;
            }

            if (Profile.CompanyURL == "null")
            {
                CompanyWebsite.NavigateUrl = "";
                CompanyWebsite.Text = "";
            }
            else
            {
                CompanyWebsite.NavigateUrl = Profile.CompanyURL;
                CompanyWebsite.Text = Profile.CompanyURL;
            }
            Industry.NavigateUrl = "";
            Industry.Text = Utility.GetIndustryById(Convert.ToInt32(Profile.Industry), Convert.ToInt32(Session["LCID"].ToString()));
            if (Profile.LinkedIn == "null")
            {
                linkedin.NavigateUrl = "";
                linkedin.Text = "";
            }
            else
            {
                linkedin.NavigateUrl = Profile.LinkedIn;
                linkedin.Text = Profile.LinkedIn;
            }
            Cellphone.Text = Profile.Cellphone == "null" ? "" : Profile.Cellphone;
            Cellphone.NavigateUrl = "";
            if (Profile.Twitter == "null")
            {
                Twitter.NavigateUrl = "";
                Twitter.Text = "";
                twitterfollow.HRef = "";
            }
            else
            {
                Twitter.NavigateUrl = Profile.Twitter;
                Twitter.Text = Profile.Twitter;
                twitterfollow.HRef = Profile.Twitter;
            }
            if (Profile.Facebook == "null")
            {
                Facebook.NavigateUrl = "";
                Facebook.Text = "";
                FacebookFrame.Attributes["src"] = "";
            }
            else
            {
                Facebook.NavigateUrl = Profile.Facebook;
                Facebook.Text = Profile.Facebook;
                FacebookFrame.Attributes["src"] = "//www.facebook.com/plugins/like.php?href=" + Profile.Facebook +
                                                  ";layout=button_count&amp;width=450&amp;show_faces=true&amp;action=like&amp;colorscheme=light&amp;font&amp;height=21";
            }
            centerstage.Src = Profile.Picture1;
            photo0.Src = Profile.Picture1;
            photo1.Src = Profile.Picture2;
            photo2.Src = Profile.Picture3;
            photo3.Src = Profile.Picture4;
            FirstName.Text = Profile.FirstName;
            LastName.Text = Profile.LastName;
            Location.Text = GetLocation();
            CountryImage.ImageUrl = Utility.GetFlagPath(Profile.CountryID);
            Description.Text = Profile.Description == "null" ? "" : Profile.Description;
        }

        protected string GetLocation()
        {
            var location ="";
            if (Profile.City != "null" && Profile.City != "-1")
            {
                location += Profile.City + ", ";
            }
            location += Profile.Region + ", " + Profile.Country + " ";
            return location;
        }
    }
}