using System;
using System.Collections;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web.UI;
using SidejobModel;

namespace Helper
{
    public partial class ProfessionLCIDTest : Page
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
            if (Session["LCID"] == null)
            {
                Session["LCID"] = 1;
            }
            if (!Page.IsPostBack)
            {
                BindIndustryandSpeciality(); 
            }
       
        }

        public void BindIndustryandSpeciality()
        {
            BindIndustry();
            BindSpecialities();
        }

        public void BindIndustry()
        {
            IndustryDropDownList.DataValueField = "CategoryID";
            IndustryDropDownList.DataTextField = "CategoryName";
            IndustryDropDownList.DataSource = BindIndusty(Session["LCID"].ToString());
            IndustryDropDownList.DataBind();
        }

        public  void BindSpecialities()
        {
            FirstList();
            SecondList();
            ThirdList();
        }

        public  void FirstList()
        {
            SpecialityListBox1.DataValueField = "JobID";
            SpecialityListBox1.DataTextField = "JobTitle";
            SpecialityListBox1.DataSource = BindSpecialityList(Session["LCID"].ToString(), IndustryDropDownList.SelectedIndex.ToString(CultureInfo.InvariantCulture) == "-1" ? "1" : IndustryDropDownList.SelectedValue);
            SpecialityListBox1.DataBind();

        }

        public  void SecondList()
        {
            SpecialityListBox2.DataValueField = "JobID";
            SpecialityListBox2.DataTextField = "JobTitle";
            SpecialityListBox2.DataSource = BindSpecialityList(Session["LCID"].ToString(), IndustryDropDownList.SelectedIndex.ToString(CultureInfo.InvariantCulture) == "-1" ? "1" : IndustryDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture));
            SpecialityListBox2.DataBind();

        }

        public  void ThirdList()
        {
            SpecialityListBox3.DataValueField = "JobID";
            SpecialityListBox3.DataTextField = "JobTitle";
            SpecialityListBox3.DataSource = BindSpecialityList(Session["LCID"].ToString(), IndustryDropDownList.SelectedIndex.ToString(CultureInfo.InvariantCulture) == "-1" ? "1" : IndustryDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture));
            SpecialityListBox3.DataBind();

        }

        public  IEnumerable BindIndusty(string lcid)
        {
            try
            {
                using (var context = new SidejobEntities())
                {
                    switch (Convert.ToInt32(lcid))
                    {
                        case 1:
                            return (from c in context.Categories
                                    select c).ToList();

                        case 2:
                            return (from c in context.CategoriesFrs
                                    select c).ToList();

                        default:
                            return (from c in context.Categories
                                    select c).ToList();

                    }
                }
            }
            catch (Exception)
            {
                using (var context = new SidejobEntities())
                {
                    return (from c in context.Categories
                            select c).ToList();
                }
            }

        }

        public  IEnumerable BindSpecialityList(string lcid, string jobcategory)
        {
            try
            {
                using (var context = new SidejobEntities())
                {
                    switch (Convert.ToInt32(lcid))
                    {
                        case 1:
                            return (from c in context.Jobs
                                    where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                                    select c).ToList();
                        case 2:
                            return (from c in context.JobsFrs
                                    where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                                    select c).ToList();

                        default:
                            return (from c in context.Jobs
                                    where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                                    select c).ToList();
                    }
                }
            }
            catch (Exception)
            {
                using (var context = new SidejobEntities())
                {
                    return (from c in context.Jobs
                            where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                            select c).ToList();
                }
            }
        }

        public  IEnumerable BindSpecialityList2(string lcid, string jobcategory)
        {
            try
            {
                using (var context = new SidejobEntities())
                {
                    switch (Convert.ToInt32(lcid))
                    {
                        case 1:
                            return (from c in context.Jobs
                                    where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                                    select c).ToList();
                        case 2:
                            return (from c in context.JobsFrs
                                    where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                                    select c).ToList();

                        default:
                            return (from c in context.Jobs
                                    where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                                    select c).ToList();
                    }
                }
            }
            catch (Exception)
            {
                using (var context = new SidejobEntities())
                {
                    return (from c in context.Jobs
                            where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                            select c).ToList();
                }
            }

        }

        public  IEnumerable BindSpecialityList3(string lcid, string jobcategory)
        {
            try
            {
                using (var context = new SidejobEntities())
                {
                    switch (Convert.ToInt32(lcid))
                    {
                        case 1:
                            return (from c in context.Jobs
                                    where c.JobCategory == jobcategory && c.JobRank > 26
                                    select c).ToList();
                        case 2:
                            return (from c in context.JobsFrs
                                    where c.JobCategory == jobcategory && c.JobRank > 26
                                    select c).ToList();

                        default:
                            return (from c in context.Jobs
                                    where c.JobCategory == jobcategory && c.JobRank > 26
                                    select c).ToList();
                    }
                }
            }
            catch (Exception)
            {
                using (var context = new SidejobEntities())
                {
                    return (from c in context.Jobs
                            where c.JobCategory == jobcategory && c.JobRank > 26
                            select c).ToList();
                }
            }
        }

        public  void IndustryDropDownListSelectedIndexChanged(object sender, EventArgs e)
        {
            BindSpecialities();
        }
    }
}