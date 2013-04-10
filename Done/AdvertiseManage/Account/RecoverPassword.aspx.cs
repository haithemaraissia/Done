using System;
using System.Globalization;
using System.Net;
using System.Net.Mail;
using System.Text;
using System.Threading;
using System.Web.Security;

namespace Account
{
    public partial class RecoverPassword : System.Web.UI.Page
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

        protected void PasswordRecovery1SendingMail(object sender, System.Web.UI.WebControls.MailMessageEventArgs e)
        {
            var currentuser = Membership.GetUser(PasswordRecovery1.UserName);
            if (currentuser != null)
            {
                var pwd = currentuser.GetPassword(PasswordRecovery1.Answer);
                ProfileCommon UserProfile = Profile.GetProfile(PasswordRecovery1.UserName);
                SendEmail(currentuser.Email, pwd, currentuser.UserName);
            }
            // cancel the component's email here
            e.Cancel = true;

        }

        protected void SendEmail(string memberEmail, string psw, string username)
        {
            //var response = @"<script language='javascript'>alert('" 
            //                        + Resources.Resource.PasswordSent  
            //                        + @"'); window.location = 'http://my-side-job.com/Manage/Advertise/Default.aspx';</script>";
            //Response.Write(response);


            var lang = Request.QueryString["l"] ?? "en-US";
            var url = "http://www.my-side-job.com/Manage/Advertise/EmailTemplates/PasswordRecovery.aspx?psw=" + psw +
                      "&usn=" + username + "&l=" + lang;
            const string strFrom = "postmaster@my-side-job.com";
            var mailMsg = new MailMessage(new MailAddress(strFrom), new MailAddress(memberEmail))
            {
                BodyEncoding = Encoding.Default,
                Subject = Resources.Resource.ForgotPassword,
                Body = Utility.GetHtmlFrom(url),
                Priority = MailPriority.High,
                IsBodyHtml = true
            };
            var smtpMail = new SmtpClient();
            var basicAuthenticationInfo = new NetworkCredential("postmaster@my-side-job.com", "haithem759163");
            smtpMail.Host = "mail.my-side-job.com";
            smtpMail.UseDefaultCredentials = false;
            smtpMail.Credentials = basicAuthenticationInfo;
            try
            {
                smtpMail.Send(mailMsg);
            }
            catch (Exception)
            {
                Response.Redirect(Request.Url.ToString());
                throw;
            }
        }
    }
}
