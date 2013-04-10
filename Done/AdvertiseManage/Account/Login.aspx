<%@ Page Title="Log In" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="Login.aspx.cs" Inherits="Account.Login" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:Label ID="LogInLabel" runat="server" Text="<%$ Resources:Resource, LogIn %>"></asp:Label>
    </h2>
 <%--   <p>
        <asp:Label ID="EnterUserNameandPasswordLabel" runat="server" Text="<%$ Resources:Resource, EnterUserNameandPassword %>"></asp:Label>
        <asp:HyperLink ID="RegisterHyperLink" runat="server" EnableViewState="false">
            <asp:Label ID="RegisterLabel" runat="server" Text="<%$ Resources:Resource, Register %>"></asp:Label></asp:HyperLink>
        <asp:Label ID="NoAccountLabel" runat="server" Text="<%$ Resources:Resource, NoAccount %>"></asp:Label>
    </p>--%>
    <asp:Login ID="LoginUser" runat="server" EnableViewState="false" RenderOuterTable="false"
        DestinationPageUrl="~/Advertiser/Home.aspx">
        <LayoutTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="LoginUserValidationSummary" runat="server" CssClass="failureNotification"
                ValidationGroup="LoginUserValidationGroup" />
            <div class="accountInfo">
                <fieldset class="login">
                    <legend>
                        <asp:Label ID="AccountInformationLabel" runat="server" Text="<%$ Resources:Resource, AccountInformation %>"></asp:Label>
                    </legend>
                    <p>
                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" Text="<%$ Resources:Resource, UserName1 %>"></asp:Label>
                        <asp:TextBox ID="UserName" runat="server" CssClass="textEntry"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName"
                            CssClass="failureNotification" ErrorMessage="<%$ Resources:Resource, UserNameRequiredFieldValidator %>"
                            ToolTip="<%$ Resources:Resource, UserNameRequiredFieldValidator %>" ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" Text="<%$ Resources:Resource, Password1 %>"></asp:Label>
                        <asp:TextBox ID="Password" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password"
                            CssClass="failureNotification" ErrorMessage="<%$ Resources:Resource, PasswordRequiredValidator %>"
                            ToolTip="<%$ Resources:Resource, PasswordRequiredValidator %>" ValidationGroup="LoginUserValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:CheckBox ID="RememberMe" runat="server" />
                        <asp:Label ID="RememberMeLabel" runat="server" AssociatedControlID="RememberMe" CssClass="inline"
                            Text="<%$ Resources:Resource, LoggedIn %>"></asp:Label>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="<%$ Resources:Resource, LogIn %>"
                        ValidationGroup="LoginUserValidationGroup" />
                </p>
            </div>
        </LayoutTemplate>
    </asp:Login>
</asp:Content>
