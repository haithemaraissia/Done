using System;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web.Security;

namespace Account
{
    public partial class AccountEditProfile : System.Web.UI.Page
    {
        protected override void InitializeCulture()
        {
            var lang = Request.QueryString["l"];
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
                    Thread.CurrentThread.CurrentUICulture =
                        new CultureInfo(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                    Thread.CurrentThread.CurrentCulture =
                        CultureInfo.CreateSpecificCulture(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                }
            }

        }

        protected void Page_Load(object sender, EventArgs e)
        {
            if (Page.IsPostBack) return;
            if (Session["LCID"] == null)
            {
                Session["LCID"] = 1;
            }
            if (!Page.IsPostBack)
            {
                BindIndustryandSpeciality();
            }
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

        public void BindIndustryandSpeciality()
        {
            Utility.BindIndustry(IndustryDropDownList);
            Utility.BindSpecialities(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3, IndustryDropDownList);
        }

        protected void GetAttributes()
        {
            UserName.Text = User.Identity.Name;
            Email.Text = Profile.Email == "null" ? "" : Profile.Email;
            FirstName.Text = Profile.FirstName;
            LastName.Text = Profile.LastName;
            Gender.SelectedValue = Profile.Gender;
            Age.Text = Profile.Age;
            CountryDropDownList.SelectedValue = Profile.CountryID.ToString(CultureInfo.InvariantCulture);
            CountryDropDownList.DataBind();
            RegionsDropDownList.SelectedValue = Profile.RegionID.ToString(CultureInfo.InvariantCulture);
            RegionsDropDownList.DataBind();
            CitiesDropDownList.SelectedIndex = Convert.ToInt32(Profile.CityID);
            Zipcode.Text = Profile.Zipcode == "null" ? "" : Profile.Zipcode;
            MaritalStatus.SelectedValue = Profile.MaritalStatus;
            Language.SelectedValue = Profile.Language;
            Question.SelectedValue = Profile.Question;
            Answer.Text = Profile.Answer;
            Cellphone.Text = Profile.Cellphone == "null" ? "" : Profile.Cellphone;
            Facebook.Text = Profile.Facebook == "null" ? "" : Profile.Facebook;
            LinkedIn.Text = Profile.LinkedIn == "null" ? "" : Profile.LinkedIn;
            Twitter.Text = Profile.Twitter == "null" ? "" : Profile.Twitter;
            BindIndustryandSpeciality();
            try
            {
                IndustryDropDownList.SelectedValue = Profile.Industry;
            }
            catch (Exception)
            {
                var error = "true";
                throw;
            }
            //
            //IndustryDropDownList.DataBind();
            //SpecialityListBox1.DataBind();
            //SpecialityListBox2.DataBind();
            //SpecialityListBox3.DataBind();
            var s1 = Profile.ProfessionID;
            var ia = s1.Split(',').ToArray();
            foreach (var t in ia)
            {
                for (var j = 0; j < SpecialityListBox1.Items.Count - 1; j++)
                {
                    if (t == SpecialityListBox1.Items[j].Value)
                    {
                        SpecialityListBox1.Items[j].Selected = true;
                    }
                }
                for (var j = 0; j < SpecialityListBox2.Items.Count - 1; j++)
                {
                    if (t == SpecialityListBox2.Items[j].Value)
                    {
                        SpecialityListBox2.Items[j].Selected = true;
                    }
                }
                for (var j = 0; j < SpecialityListBox3.Items.Count - 1; j++)
                {
                    if (t == SpecialityListBox3.Items[j].Value)
                    {
                        SpecialityListBox3.Items[j].Selected = true;
                    }
                }
            }
            CompanyURL.Text = Profile.CompanyURL == "null" ? "" : Profile.CompanyURL;
            Description.Text = Profile.Description == "null" ? "" : Profile.Description;
        }

        protected void SaveAttributes()
        {
            Profile.Email = Email.Text;
            Profile.FirstName = FirstName.Text;
            Profile.LastName = LastName.Text;
            Profile.Gender = Gender.SelectedValue;
            Profile.Age = Age.Text;
            Profile.Country = CountryDropDownList.SelectedItem.Text;
            Profile.CountryID = Convert.ToInt32(CountryDropDownList.SelectedValue);
            Profile.Region = RegionsDropDownList.SelectedItem.Text;
            Profile.RegionID = Convert.ToInt32(RegionsDropDownList.SelectedValue);
            if (CitiesDropDownList.SelectedIndex == -1)
            {
                Profile.CityID = 0;
                Profile.City = "";
            }
            else
            {
                Profile.CityID = CitiesDropDownList.SelectedIndex;
                Profile.City = CitiesDropDownList.SelectedItem.Text;

            }
            Zipcode.Text = Profile.Zipcode == "null" ? "" : Profile.Zipcode;
            Profile.MaritalStatus = MaritalStatus.SelectedValue;
            Profile.Language = Language.SelectedValue;
            Profile.Question = Question.SelectedValue;
            Profile.Answer = Answer.Text;
            Profile.Cellphone = Cellphone.Text;
            Profile.Facebook = Facebook.Text;
            Profile.LinkedIn = LinkedIn.Text;
            Profile.Twitter = Twitter.Text;
            Profile.Industry = IndustryDropDownList.SelectedValue;
            Profile.Profession = "";
            Profile.ProfessionID = "";
            Profile.CompanyURL = CompanyURL.Text;
            Profile.Description = Description.Text;

        }

        protected void UpdateButtonClick(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                SaveAttributes();
                Response.Redirect("http://www.my-side-job.com/Manage/Advertise/Management/Profile/ViewProfile.aspx");
            }
        }

        protected void CancelClick(object sender, EventArgs e)
        {
            Response.Redirect("http://www.my-side-job.com/Manage/Advertise/Management/Profile/ViewProfile.aspx");
        }

        public void IndustryDropDownListSelectedIndexChanged(object sender, EventArgs e)
        {
            Utility.BindSpecialities(SpecialityListBox1, SpecialityListBox2, SpecialityListBox3, IndustryDropDownList);
        }
    }
}