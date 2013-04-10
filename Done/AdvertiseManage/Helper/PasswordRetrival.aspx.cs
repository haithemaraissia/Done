using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Helper_PasswordRetrival : System.Web.UI.Page
{

    public void Page_Load(object sender, EventArgs args)
    {
        if (!Membership.EnablePasswordRetrieval)
        {
            FormsAuthentication.RedirectToLoginPage();
        }

        Msg.Text = "";

        if (!IsPostBack)
        {
            Msg.Text = "Please enter a user name.";
        }
        else
        {
            VerifyUsername();
        }
    }


    public void VerifyUsername()
    {
        MembershipUser user = Membership.GetUser(UsernameTextBox.Text, false);

        if (user == null)
        {
            Msg.Text = "The user name " + Server.HtmlEncode(UsernameTextBox.Text) + " was not found. Please check the value and re-enter.";

            QuestionLabel.Text = "";
            QuestionLabel.Enabled = false;
            AnswerTextBox.Enabled = false;
            EmailPasswordButton.Enabled = false;
        }
        else
        {
            QuestionLabel.Text = user.PasswordQuestion;
            QuestionLabel.Enabled = true;
            AnswerTextBox.Enabled = true;
            EmailPasswordButton.Enabled = true;
        }
    }


    public void EmailPassword_OnClick(object sender, EventArgs args)
    {
        // Note: Returning a password in clear text using e-mail is not recommended for
        // sites that require a high level of security.

        try
        {
            string password = Membership.Provider.GetPassword(UsernameTextBox.Text, AnswerTextBox.Text);
            MembershipUser u = Membership.GetUser(UsernameTextBox.Text);
            EmailPassword(u.Email, password);
            Msg.Text = "Your password was sent via e-mail.";
        }
        catch (MembershipPasswordException e)
        {
            Msg.Text = "The password answer is incorrect. Please check the value and try again.";
        }
        catch (System.Configuration.Provider.ProviderException e)
        {
            Msg.Text = "An error occurred retrieving your password. Please check your values " +
                       "and try again.";
        }
    }


    private void EmailPassword(string email, string password)
    {
        try
        {
            MailMessage Message = new MailMessage("administrator", email);
            Message.Subject = "Your Password";
            Message.Body = "Your password is: " + Server.HtmlEncode(password);

            SmtpClient SmtpMail = new SmtpClient("SMTPSERVER");
            SmtpMail.Send(Message);
        }
        catch
        {
            Msg.Text = "An exception occurred while sending your password. Please try again.";
        }
    }
}