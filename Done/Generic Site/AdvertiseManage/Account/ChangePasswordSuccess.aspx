<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="ChangePasswordSuccess.aspx.cs" Inherits="Account.ChangePasswordSuccess" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:Label ID="ChangePasswordLabel" Text="<%$ Resources:Resource, ChangeYourPassword %>"
            runat="server"></asp:Label>
    </h2>
    <p>
        <asp:Label ID="ChangePasswordSuccessLabel" Text="<%$ Resources:Resource, PasswordChangeSuccess %>"
            runat="server"></asp:Label>
    </p>
    <p>
        <br />
        <asp:HyperLink ID="BackToProfileHyperLink" runat="server" Text="<%$ Resources:Resource, BackToProfileLinkButton %>"
            NavigateUrl="http://www.my-side-job.com/Manage/Advertise/Default.aspx"></asp:HyperLink>
    </p>
</asp:Content>
