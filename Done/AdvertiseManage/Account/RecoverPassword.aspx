<%@ Page CodeFile="RecoverPassword.aspx.cs" Title="" Language="C#" MasterPageFile="~/Plain.master"
    AutoEventWireup="true" CodeBehind="RecoverPassword.aspx.cs" Inherits="Account.RecoverPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <title>
        <asp:Label ID="RecoverPasswordLabel" runat="server" Text="<%$ Resources:Resource, RecoverYourPassword %>">
        </asp:Label>
    </title>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:PasswordRecovery ID="PasswordRecovery1" runat="server" BorderColor="#E6E2D8"
        BorderPadding="4" BorderStyle="Solid" BorderWidth="1px" Font-Size="Large" Width="850px"
        Height="400px" onsendingmail="PasswordRecovery1SendingMail">
        <MailDefinition From="postmaster@my-side-job.com" Subject="<%$ Resources:Resource, ForgotPassword %>"
            Priority="High" BodyFileName="../EmailTemplates/PasswordRecovery.aspx"
            IsBodyHtml="true">
        </MailDefinition>
        <InstructionTextStyle Font-Italic="True" ForeColor="Black" />
        <SuccessTextStyle Font-Bold="True" ForeColor="#5D7B9D" />
        <TextBoxStyle Font-Size="Medium" />
        <UserNameTemplate>
            <span style="text-align: center">
                <h2>
                    <asp:Label ID="ForgotPasswordLabel" runat="server" Text="<%$ Resources:Resource, ForgotPassword %>"></asp:Label>
                </h2>
                <fieldset class="login">
                    <p>
                        &nbsp;</p>
                    <asp:Label ID="UserNameLabel" runat="server" Text="<%$ Resources:Resource, Username1 %>"
                        CssClass="label" Font-Size="Large"></asp:Label>&nbsp;
                    <asp:TextBox ID="UserName" runat="server" Width="236px"></asp:TextBox>&nbsp;<asp:Button
                        ID="SubmitButton" runat="server" Text="<%$ Resources:Resource, Send %>" 
                        CommandName="Submit" Width="103px" />
                    <br />  <br />
                    <span style="color: #FF0000; font-size: large">
                        <asp:Literal ID="FailureText" runat="server"></asp:Literal>
                      
                    </span>
            </span>&nbsp;&nbsp;</fieldset>
            <br />
            <br />
        </UserNameTemplate>
        <QuestionTemplate>
            <h2>
                <asp:Label ID="ForgotPasswordLabel2" runat="server" Text="<%$ Resources:Resource, ForgotPassword %>"></asp:Label></h2>
            <asp:Literal ID="UserName2" runat="server"></asp:Literal><br />
            <asp:Label ID="AnswerPasswordQuestionLabel" runat="server" Text="<%$ Resources:Resource, AnswerPasswordQuestion %>"></asp:Label>
            <br /> <br />
            <asp:Literal ID="Question" runat="server"></asp:Literal>
            <asp:TextBox ID="Answer" runat="server"></asp:TextBox><br /><br />
            <asp:Button ID="SubmitButton2" runat="server" Text="<%$ Resources:Resource, SendAnswerByMail %>"
                CommandName="Submit" /><br />
            <asp:Literal ID="FailureText2" runat="server"></asp:Literal>
        </QuestionTemplate>
        <SuccessTemplate>
            <asp:Label ID="PasswordSentLabel" runat="server" Text="<%$ Resources:Resource, PasswordSent %>"></asp:Label>
            <asp:Label ID="EmailLabel" runat="server"></asp:Label>
        </SuccessTemplate>
        <TitleTextStyle BackColor="#5D7B9D" Font-Bold="True" Font-Size="0.9em" ForeColor="White" />
        <SubmitButtonStyle BackColor="#FFFBFF" BorderColor="#CCCCCC" BorderStyle="Solid"
            BorderWidth="1px" Font-Size="0.8em" ForeColor="#284775" />
    </asp:PasswordRecovery>
</asp:Content>
