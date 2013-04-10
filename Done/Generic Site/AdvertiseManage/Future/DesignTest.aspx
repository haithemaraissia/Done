<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="DesignTest.aspx.cs" Inherits="Future_DesignTest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:Label ID="ComingSoonLabel" runat="server" Width="100%" Text="<%$ Resources:Resource, ComingSoon %>"
        Style="color: #003366; font-weight: 700"></asp:Label>
</asp:Content>
