<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Future.aspx.cs" Inherits="Management_Advertiser_Test" %>
<%@ Register TagPrefix="asp" Namespace="AjaxControlToolkit" Assembly="AjaxControlToolkit" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server" UpdateMode="Always">
        <ContentTemplate>
            Authentication only admin role can see this
            
             <asp:GridView ID="GridView1" runat="server" AllowPaging="True" ForeColor="#333333"
                HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="AliceBlue" Font-Italic="True"
                GridLines="None" HeaderStyle-Font-Italic="false" PageSize="100" CellPadding="4"
                AutoGenerateColumns="true" >
                
                </asp:GridView>
        </ContentTemplate>
    </asp:UpdatePanel>
    </div>
    </form>
</body>
</html>
<%--            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" ForeColor="#333333"
                HeaderStyle-BackColor="DarkBlue" HeaderStyle-ForeColor="AliceBlue" Font-Italic="True"
                GridLines="None" HeaderStyle-Font-Italic="false" PageSize="10" CellPadding="4"
                AutoGenerateColumns="false" OnPageIndexChanging="GridView1PageIndexChanging">
                <Columns>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Name" runat="server" Text='<%#Eval("Name").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Name">
                        <ItemTemplate>
                            <asp:Label ID="Gender" runat="server" Text='<%#Eval("Gender").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Location">
                        <ItemTemplate>
                            <asp:Label ID="Location" runat="server" Text='<%#Eval("Location").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Industry">
                        <ItemTemplate>
                            <asp:Label ID="Industry" runat="server" Text='<%#Eval("Industry").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Age">
                        <ItemTemplate>
                            <asp:Label ID="Age" runat="server" Text='<%#Eval("Age").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Email">
                        <ItemTemplate>
                            <asp:Label ID="Email" runat="server" Text='<%#Eval("Email").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Language">
                        <ItemTemplate>
                            <asp:Label ID="Language" runat="server" Text='<%#Eval("Language").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="LCID">
                        <ItemTemplate>
                            <asp:Label ID="LCID" runat="server" Text='<%#Eval("LCID").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Cellphone">
                        <ItemTemplate>
                            <asp:Label ID="Cellphone" runat="server" Text='<%#Eval("Cellphone").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Picture1">
                        <ItemTemplate>
                            <asp:Image ID="ProfilePicture" runat="server" ImageUrl='<%#Eval("Picture1").ToString()%>'
                                Height="50px" Width="50px" />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="Activity">
                        <ItemTemplate>
                            <asp:Label ID="Activity" runat="server" Text='<%#Eval("Activity").ToString()%>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
                <AlternatingRowStyle BackColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#507CD1" ForeColor="White" Font-Bold="True"></HeaderStyle>
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="#EFF3FB" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F5F7FB" />
                <SortedAscendingHeaderStyle BackColor="#6D95E1" />
                <SortedDescendingCellStyle BackColor="#E9EBEF" />
                <SortedDescendingHeaderStyle BackColor="#4870BE" />
            </asp:GridView>--%>