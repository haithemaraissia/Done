using System;
using System.Collections;
using System.Globalization;
using System.IO;
using System.Linq;
using System.Net;
using System.Threading;
using System.Web;
using System.Web.UI.WebControls;
using SidejobModel;

public static class Utility
{
    public static string Login()
    {
        return string.Format("~/Account/Login.aspx?ReturnUrl={0}", HttpContext.Current.Request.Url.AbsoluteUri);
    }

    public static string GetZipcode(int countryID, int regionID, string cityName, string zipcode)
    {
        var selectedZipCode = "";
        using (var context = new SidejobEntities())
        {
            try
            {
                var queryRegion = from r in context.regionsUpdates
                                  where r.CountryId == countryID && r.RegionId == regionID
                                  select r.Code;
                var regioncode = queryRegion.FirstOrDefault();

                if (countryID == 254)
                {
                    var queryZipcode = from c in context.USAZipCodes
                                       where (c.City == cityName && c.PostalCodeID == Convert.ToInt32(zipcode) && c.State == regioncode)
                                       select c.PostalCodeID;
                    try
                    {
                        selectedZipCode = queryZipcode.FirstOrDefault().ToString(CultureInfo.InvariantCulture);
                    }
                    catch (Exception)
                    {

                        selectedZipCode = "";
                    }

                    if (selectedZipCode == "")
                    {

                        var defaultqueryzipcode = from c in context.USAZipCodes
                                                  where (c.City == cityName && c.State == regioncode)
                                                  select c.PostalCodeID;

                        selectedZipCode = defaultqueryzipcode.FirstOrDefault().ToString(CultureInfo.InvariantCulture);
                    }
                }
                if (countryID == 43)
                {
                    var queryZipcode = from c in context.CanadaZipCodes
                                       where (c.City == cityName && c.PostalCode == zipcode && c.ProvinceCode == regioncode)
                                       select c.PostalCodeID;
                    try
                    {
                        selectedZipCode = queryZipcode.FirstOrDefault().ToString(CultureInfo.InvariantCulture);
                    }
                    catch (Exception)
                    {

                        selectedZipCode = "";
                    }
                    if (selectedZipCode == "")
                    {

                        var defaultqueryzipcode = from c in context.CanadaZipCodes
                                                  where (c.City == cityName && c.ProvinceCode == regioncode)
                                                  select c.PostalCode;

                        selectedZipCode = defaultqueryzipcode.First();
                    }
                }
            }
            catch (Exception)
            {
                var i = "exception";
            }

        }
        if (selectedZipCode == "")
        {
            selectedZipCode = "0";
        }
        return selectedZipCode;
    }

    public static int GetLCID(string lang)
    {
        switch (lang)
        {

            case "en-US":
                return 1;

            case "fr":
                return 2;

            case "es":
                return 3;

            case "zh-CN":
                return 4;

            case "ru":
                return 5;

            case "ar":
                return 6;

            case "ja":
                return 7;

            case "de":
                return 8;
            default:
                return 1;
        }

    }

    public static string GetLanguage(int langid)
    {
        switch (langid)
        {

            case 1:
                return "en-US";

            case 2:
                return "fr";

            case 3:
                return "es";

            case 4:
                return "zh-CN";

            case 5:
                return "ru";

            case 6:
                return "ar";

            case 7:
                return "ja";

            case 8:
                return "de";
            default:
                return "en-US";
        }

    }

    public static string GetCurrentLCID(string lang)
    {
        if (lang != null | !string.IsNullOrEmpty(lang))
        {
            Thread.CurrentThread.CurrentUICulture = new CultureInfo(GetLanguage(Convert.ToInt32(lang)));
            Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(GetLanguage(Convert.ToInt32(lang)));
            return GetLCID(lang).ToString(CultureInfo.InvariantCulture);
        }
        return GetLanguage(1);
    }

    public static string GetIndustryById(int industryId, int lcid)
    {
        string resultcode;
        using (var context = new SidejobEntities())
        {
            IQueryable<string> result;
            switch (lcid)
            {
                case 1:
                    result = from c in context.Categories
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;

                case 2:
                    result = from c in context.CategoriesFrs
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;

                case 3:
                    result = from c in context.CategoriesSps
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;

                case 4:
                    result = from c in context.CategoriesCns
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;

                case 5:
                    result = from c in context.CategoriesRus
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;

                case 6:
                    result = from c in context.CategoriesArs
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;

                case 7:
                    result = from c in context.CategoriesJas
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;

                case 8:
                    result = from c in context.CategoriesDes
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;
                default:
                    result = from c in context.Categories
                             where c.CategoryID == industryId
                             select c.CategoryName;
                    break;
            }
            resultcode = result.ToList().FirstOrDefault();
        }


        return resultcode;
    }

    public static string GetFlagPath(int countryID)
    {
        using (var context = new SidejobEntities())
        {
            var result = from c in context.CountriesUpdates
                         where c.CountryId == countryID
                         select c.Path;
            return result.FirstOrDefault();
        }
    }

    public static void BindIndustry(DropDownList industryDropDownList)
    {
        industryDropDownList.DataValueField = "CategoryID";
        industryDropDownList.DataTextField = "CategoryName";
        industryDropDownList.DataSource = BindIndusty(HttpContext.Current.Session["LCID"].ToString());
        industryDropDownList.DataBind();
    }

    public static void BindSpecialities(ListBox specialityListBox1, ListBox specialityListBox2,ListBox specialityListBox3,DropDownList industryDropDownList)
    {
        FirstList(specialityListBox1, industryDropDownList);
        SecondList(specialityListBox2, industryDropDownList);
        ThirdList(specialityListBox3, industryDropDownList);
    }

    public static void FirstList(ListBox specialityListBox1, DropDownList industryDropDownList)
    {
        specialityListBox1.DataValueField = "JobID";
        specialityListBox1.DataTextField = "JobTitle";
        specialityListBox1.DataSource = BindSpecialityList(HttpContext.Current.Session["LCID"].ToString(), industryDropDownList.SelectedIndex.ToString(CultureInfo.InvariantCulture) == "-1" ? "1" : industryDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture));
        specialityListBox1.DataBind();

    }

    public static void SecondList(ListBox specialityListBox2, DropDownList industryDropDownList)
    {
        specialityListBox2.DataValueField = "JobID";
        specialityListBox2.DataTextField = "JobTitle";
        specialityListBox2.DataSource = BindSpecialityList2(HttpContext.Current.Session["LCID"].ToString(), industryDropDownList.SelectedIndex.ToString(CultureInfo.InvariantCulture) == "-1" ? "1" : industryDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture));
        specialityListBox2.DataBind();

    }

    public static void ThirdList(ListBox specialityListBox3, DropDownList industryDropDownList)
    {
        specialityListBox3.DataValueField = "JobID";
        specialityListBox3.DataTextField = "JobTitle";
        specialityListBox3.DataSource = BindSpecialityList3(HttpContext.Current.Session["LCID"].ToString(), industryDropDownList.SelectedIndex.ToString(CultureInfo.InvariantCulture) == "-1" ? "1" : industryDropDownList.SelectedValue.ToString(CultureInfo.InvariantCulture));
        specialityListBox3.DataBind();

    }

    public static IEnumerable BindIndusty(string lcid)
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

                    case 3:
                        return (from c in context.CategoriesSps
                                select c).ToList();

                    case 4:
                        return (from c in context.CategoriesCns
                                select c).ToList();

                    case 5:
                        return (from c in context.CategoriesRus
                                select c).ToList();

                    case 6:
                        return (from c in context.CategoriesArs
                                select c).ToList();

                    case 7:
                        return (from c in context.CategoriesJas
                                select c).ToList();

                    case 8:
                        return (from c in context.CategoriesDes
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

    public static IEnumerable BindSpecialityList(string lcid, string jobcategory)
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
                    case 3:
                        return (from c in context.JobsSps
                                where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                                select c).ToList();
                    case 4:
                        return (from c in context.JobsCns
                                where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                                select c).ToList();
                    case 5:
                        return (from c in context.JobsRus
                                where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                                select c).ToList();
                    case 6:
                        return (from c in context.JobsArs
                                where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                                select c).ToList();
                    case 7:
                        return (from c in context.JobsJas
                                where c.JobCategory == jobcategory && c.JobRank >= 1 && c.JobRank <= 13
                                select c).ToList();
                    case 8:
                        return (from c in context.JobsDes
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

    public static IEnumerable BindSpecialityList2(string lcid, string jobcategory)
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
                    case 3:
                        return (from c in context.JobsSps
                                where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                                select c).ToList();
                    case 4:
                        return (from c in context.JobsCns
                                where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                                select c).ToList();
                    case 5:
                        return (from c in context.JobsRus
                                where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                                select c).ToList();
                    case 6:
                        return (from c in context.JobsArs
                                where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                                select c).ToList();
                    case 7:
                        return (from c in context.JobsJas
                                where c.JobCategory == jobcategory && c.JobRank >= 14 && c.JobRank <= 26
                                select c).ToList();
                    case 8:
                        return (from c in context.JobsDes
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

    public static IEnumerable BindSpecialityList3(string lcid, string jobcategory)
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
                    case 3:
                        return (from c in context.JobsSps
                                where c.JobCategory == jobcategory && c.JobRank > 26
                                select c).ToList();
                    case 4:
                        return (from c in context.JobsCns
                                where c.JobCategory == jobcategory && c.JobRank > 26
                                select c).ToList();
                    case 5:
                        return (from c in context.JobsRus
                                where c.JobCategory == jobcategory && c.JobRank > 26
                                select c).ToList();
                    case 6:
                        return (from c in context.JobsArs
                                where c.JobCategory == jobcategory && c.JobRank > 26
                                select c).ToList();
                    case 7:
                        return (from c in context.JobsJas
                                where c.JobCategory == jobcategory && c.JobRank > 26
                                select c).ToList();
                    case 8:
                        return (from c in context.JobsDes
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

    public static string GetHtmlFrom(string url)
    {
        var wc = new WebClient();
        var resStream = wc.OpenRead(url);
        if (resStream != null)
        {
            var sr = new StreamReader(resStream, System.Text.Encoding.Default);
             return sr.ReadToEnd();
        }
        return "null";
        }
  
}

