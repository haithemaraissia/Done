<%@ Page Language="C#" AutoEventWireup="true" CodeFile="PasswordRecovery.aspx.cs"
    Inherits="EmailTemplates.AccountEmailTemplatesPasswordRecovery" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
</head>
<body>
    <h2>
        <asp:Label ID="YourPasswordHasBeenReset" runat="server" Text="<%$ Resources:Resource, YourPasswordHasBeenReset %>"></asp:Label></h2>
    <p>
        <asp:Label ID="Thisemailconfirmsthatyourpasswordhasbeenchanged" runat="server" Text="<%$ Resources:Resource, Thisemailconfirmsthatyourpasswordhasbeenchanged %>"></asp:Label>
    </p>
    <p>
        <asp:Label ID="ToLogonTo" runat="server" Text="<%$ Resources:Resource, ToLogonTo %>"></asp:Label>
        <a href="http://my-side-job.com/Manage/Advertise/Default.aspx">My-Side-Job
            <asp:Label ID="AdvertiseManagement" runat="server" Text="<%$ Resources:Resource, AdvertiseManagement %>"></asp:Label></a><asp:Label
                ID="usethefollowingcredentials" runat="server" Text="<%$ Resources:Resource, usethefollowingcredentials %>"></asp:Label>
    </p>
    <table>
        <tr>
            <td>
                <b>
                    <asp:Label ID="Username" runat="server" Text="<%$ Resources:Resource, Username1 %>"></asp:Label></b>
            </td>
            <td>
                <asp:Label ID="UsernameLabel" runat="server" Text=""></asp:Label>
            </td>
        </tr>
        <tr>
            <td>
                <b>
                    <asp:Label ID="Password" runat="server" Text="<%$ Resources:Resource, Password1 %>"></asp:Label></b>
            </td>
            <td>
                <asp:Label ID="PasswordLabel" runat="server" Text=""></asp:Label>
            </td>
        </tr>
    </table>
    <p>
        <asp:Label ID="ThankyouLabel" runat="server" Text="<%$ Resources:Resource, ThankYou %>"></asp:Label>
    </p>
</body>
</html>
