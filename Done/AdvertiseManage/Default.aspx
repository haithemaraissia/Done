<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="Default.aspx.cs" Inherits="Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <p>
        <asp:Label ID="ComingSoonLabel" runat="server" Width="100%" Text="<%$ Resources:Resource, ComingSoon %>"
            Style="color: #003366; font-weight: 700"></asp:Label>
    </p>
</asp:Content>
