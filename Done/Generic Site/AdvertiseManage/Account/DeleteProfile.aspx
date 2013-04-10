<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="DeleteProfile.aspx.cs" Inherits="Account.AccountDeleteProfile" %>

<asp:Content ID="HeaderContent" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:Panel ID="DeletePanel" runat="server">
        <h2>
            <asp:Label ID="DeleteProfileLabel" Text="<%$ Resources:Resource, DeleteProfile %>"
                runat="server"></asp:Label></h2>
        <br />
        <p>
            <asp:Label ID="DeleteProfileQuestionLabel" Text="<%$ Resources:Resource, DeleteProfileQuestion %>"
                runat="server"></asp:Label>
        </p>
        <br />
        <asp:Button ID="DeleteButton" runat="server" Text="<%$ Resources:Resource, Delete %>"
            Height="35px" Width="90px" OnClick="DeleteButtonClick" /><span>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
        <asp:Button ID="CancelButton" runat="server" Text="<%$ Resources:Resource, Cancel %>"
            Height="35px" Width="90px" OnClick="CancelButtonClick" />
        <p>
        </p>
    </asp:Panel>
</asp:Content>
