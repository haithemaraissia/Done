using System;
using System.Globalization;
using System.Linq;
using System.Net.Mail;
using SidejobModel;

namespace Advertise
{
    public partial class AdvertiseSchedule : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            ////Scenario 1://///
            //Cleaning up of TempAd for any ad created date older than 7 days.
            CleanTempAd();

            /////Scenario 2://///
            //Checking if Active Compaing Date is Yesterday, 
            //Then Set the Compaing following properties: 
            //Complete = True and IsActive = False
            UpdateActiveCompaingToComplete();
        }

        private static void CleanTempAd()
        {
            int count = 0;
            using (var context = new AdDatabaseModel.AdDatabaseEntities())
            {
                DateTime start = DateTime.Today;
                start = start.AddDays(-7);
                var tempAd = (from c in context.TempAds
                              where c.DateCreated < start
                              orderby c.DateCreated
                              select c).ToList();
                foreach (var t in tempAd)
                {
                    context.TempAds.DeleteObject(t);
                    count++;
                }
                context.SaveChanges();
                string subject = "Advertise Schedule Routing" + DateTime.Now.ToUniversalTime();
                string body = "Number of records:" + count;
                SendEmail(subject, body);
            }
        }

        private static void UpdateActiveCompaingToComplete()
        {
            using (var context = new AdDatabaseModel.AdDatabaseEntities())
            {
                DateTime start = DateTime.Today;
                start = start.AddDays(-1);
                var activeCompaing = (from c in context.AdGenerals
                                      where c.EndDate <= start && c.IsActive
                                      orderby c.EndDate
                                      select c).ToList();
                foreach (var t in activeCompaing)
                {
                    t.IsActive = false;
                    t.Completed = true;
                }
                context.SaveChanges();
            }
        }

        protected void CheckingUpdateActiveCompaingToComplete()
        {
            using (var context = new AdDatabaseModel.AdDatabaseEntities())
            {
                DateTime start = DateTime.Today;
                start = start.AddDays(-1);
                var activeCompaing = (from c in context.AdGenerals
                                      where c.EndDate < start
                                      orderby c.EndDate
                                      select c).ToList();
                foreach (var t in activeCompaing)
                {
                    Response.Write("ID");
                    Response.Write(t.ID);
                    Response.Write("------  ");
                    Response.Write("EndDate");
                    Response.Write(t.EndDate.ToString(CultureInfo.InvariantCulture));
                    Response.Write("Yesterday");
                    Response.Write(start.Date.ToString(CultureInfo.InvariantCulture));
                    Response.Write("------  ");
                    Response.Write("ISActive");
                    Response.Write(t.IsActive);
                    Response.Write("------  ");
                    Response.Write("Complete");
                    Response.Write(t.Completed);
                    Response.Write("------  ");
                    Response.Write("<br/>");

                }
                context.SaveChanges();
            }
        }

        private static void SendEmail( string subject, string body)
        {
            using (new SidejobEntities())
            {
                const string receiveremail = "postmaster@my-side-job.com";
                var mailMessage = new MailMessage {From = new MailAddress("automated_noreply@my-side-job.com")};
                mailMessage.To.Add(new MailAddress(receiveremail));
                mailMessage.Subject = subject;
                mailMessage.Body = body;
                mailMessage.IsBodyHtml = true;
                var smtpClient = new SmtpClient();
                object userState = mailMessage;
                try
                {
                    smtpClient.SendAsync(mailMessage, userState);
                }
                catch (Exception)
                {
                    InsertEmailSentException(0, "Error while Sending the Email for Advertise Schedule", receiveremail);
                }
            }
        }

        private static void InsertEmailSentException(int userid, string reason, string receiverEmail = "NoEmailAddress")
        {
            using (var context = new SidejobEntities())
            {
                var emailException = new EmailSentException
                                         {
                                             Reason = reason,
                                             UserId = userid,
                                             EmailAddress = receiverEmail,
                                             DateTime = DateTime.UtcNow.Date,
                                             UserRole = "ADM"
                                         };
                context.AddToEmailSentExceptions(emailException);
                context.SaveChanges();
            }
        }

    }
}