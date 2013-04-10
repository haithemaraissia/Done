using System;
using System.Web.Security;

namespace Account
{
    public partial class AccountLogOut : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            FormsAuthentication.SignOut();
            Session.Abandon();
            Response.Redirect("http://my-side-job.com/Manage/Advertise/Default.aspx");
        }
    }
}