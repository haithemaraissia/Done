<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="ProfessionLCIDTest.aspx.cs" Inherits="Helper.ProfessionLCIDTest" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <asp:ToolkitScriptManager ID="ScriptManager1" runat="server">
    </asp:ToolkitScriptManager>
    <asp:Panel ID="IndustyPanel" runat="server" BackColor="White" Height="56px" Style="position: relative;"
        Width="485px">
        <asp:DropDownList ID="IndustryDropDownList" runat="server" AutoPostBack="True"
            DataTextField="CategoryName" DataValueField="CategoryID" Style="left: 143px;
            position: absolute; top: 18px" Width="260px" 
            onselectedindexchanged="IndustryDropDownListSelectedIndexChanged">
        </asp:DropDownList>
    </asp:Panel>
    <asp:Panel ID="SpecialityPanel" runat="server" BackColor="White" BorderColor="Maroon"
        BorderWidth="0px" Height="243px" Style="left: 14px; position: relative" Width="487px"
        Wrap="False">
        <asp:UpdatePanel ID="SpecializationUpdatePanel" runat="server" UpdateMode="Conditional">
            <ContentTemplate>
                <asp:ListBox ID="SpecialityListBox1" runat="server" 
                    DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                    SelectionMode="Multiple" Style="left: 6px; position: absolute; top: 25px" Width="160px">
                </asp:ListBox>
                <asp:ListBox ID="SpecialityListBox3" runat="server" 
                    DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                    SelectionMode="Multiple" Style="left: 340px; position: absolute; top: 25px" Width="160px">
                </asp:ListBox>
                &nbsp;
                <asp:ListBox ID="SpecialityListBox2" runat="server" 
                    DataTextField="JobTitle" DataValueField="JobID" Font-Size="8pt" Height="207px"
                    SelectionMode="Multiple" Style="left: 173px; position: absolute; top: 25px" Width="160px">
                </asp:ListBox>
                &nbsp;
            </ContentTemplate>
            <Triggers>
                <asp:AsyncPostBackTrigger ControlID="IndustryDropDownList" EventName="SelectedIndexChanged" />
            </Triggers>
        </asp:UpdatePanel>
        <br />
    </asp:Panel>
</asp:Content>
