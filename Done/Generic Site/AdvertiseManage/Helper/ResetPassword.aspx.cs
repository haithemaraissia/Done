using System;
using System.Collections.Generic;
using System.Linq;
using System.Net.Mail;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Helper_ResetPassword : System.Web.UI.Page
{
    MembershipUser u;

    public void Page_Load(object sender, EventArgs args)
    {
        if (!Membership.EnablePasswordReset)
        {
            FormsAuthentication.RedirectToLoginPage();
        }

        Msg.Text = "";

        if (!IsPostBack)
        {
            Msg.Text = "Please supply a username.";
        }
        else
        {
            VerifyUsername();
        }
    }


    public void VerifyUsername()
    {
        u = Membership.GetUser(UsernameTextBox.Text, false);

        if (u == null)
        {
            Msg.Text = "Username " + Server.HtmlEncode(UsernameTextBox.Text) + " not found. Please check the value and re-enter.";

            QuestionLabel.Text = "";
            QuestionLabel.Enabled = false;
            AnswerTextBox.Enabled = false;
            ResetPasswordButton.Enabled = false;
        }
        else
        {
            QuestionLabel.Text = u.PasswordQuestion;
            QuestionLabel.Enabled = true;
            AnswerTextBox.Enabled = true;
            ResetPasswordButton.Enabled = true;
        }
    }

    public void ResetPassword_OnClick(object sender, EventArgs args)
    {
        string newPassword;
        u = Membership.GetUser(UsernameTextBox.Text, false);

        if (u == null)
        {
            Msg.Text = "Username " + Server.HtmlEncode(UsernameTextBox.Text) + " not found. Please check the value and re-enter.";
            return;
        }

        try
        {
            newPassword = u.ResetPassword(AnswerTextBox.Text);
        }
        catch (MembershipPasswordException e)
        {
            Msg.Text = "Invalid password answer. Please re-enter and try again.";
            return;
        }
        catch (Exception e)
        {
            Msg.Text = e.Message;
            return;
        }

        if (newPassword != null)
        {
            Msg.Text = "Password reset. Your new password is: " + Server.HtmlEncode(newPassword);
        }
        else
        {
            Msg.Text = "Password reset failed. Please re-enter your values and try again.";
        }
    }
}