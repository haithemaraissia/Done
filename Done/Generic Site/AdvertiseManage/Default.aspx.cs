using System;
using System.Globalization;
using System.Threading;

public partial class Default : System.Web.UI.Page
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
    }
}