<%@ Page Title="Change Password" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="ChangePassword.aspx.cs" Inherits="Account.ChangePassword" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        <asp:Label ID="ChangePasswordLabel" Text="<%$ Resources:Resource, ChangeYourPassword %>"
            runat="server"></asp:Label>
    </h2>
    <p>
        <asp:Label ID="UseFormMessageLabel" Text="<%$ Resources:Resource, UseFormMessage %>"
            runat="server"></asp:Label>
    </p>
    <p>
        <asp:Label ID="NewPasswordMessageLabel" Text="<%$ Resources:Resource, NewPasswordMessage %>"
            runat="server"></asp:Label>
        <%= Membership.MinRequiredPasswordLength %>
        <asp:Label ID="NewPasswordCharacterLabel" Text="<%$ Resources:Resource, NewPasswordCharacter %>"
            runat="server"></asp:Label>
    </p>
    <asp:ChangePassword ID="ChangeUserPassword" runat="server" CancelDestinationPageUrl="~/"
        EnableViewState="false" RenderOuterTable="false" SuccessPageUrl="ChangePasswordSuccess.aspx">
        <ChangePasswordTemplate>
            <span class="failureNotification">
                <asp:Literal ID="FailureText" runat="server"></asp:Literal>
            </span>
            <asp:ValidationSummary ID="ChangeUserPasswordValidationSummary" runat="server" CssClass="failureNotification"
                ValidationGroup="ChangeUserPasswordValidationGroup" />
            <div style="margin-right: 35px">
                <fieldset class="changePassword">
                    <legend>
                        <asp:Label ID="AccountInformationLabel" Text="<%$ Resources:Resource, AccountInformation %>"
                            runat="server"></asp:Label></legend>
                    <p>
                        <asp:Label ID="CurrentPasswordLabel" runat="server" AssociatedControlID="CurrentPassword"
                            Text="<%$ Resources:Resource, OldPassword %>"></asp:Label>
                        <asp:TextBox ID="CurrentPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server" ControlToValidate="CurrentPassword"
                            CssClass="failureNotification" ErrorMessage="<%$ Resources:Resource, PasswordRequired %>"
                            ToolTip="<%$ Resources:Resource, OldPasswordRequired %>" ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="NewPasswordLabel" runat="server" AssociatedControlID="NewPassword"
                            Text="<%$ Resources:Resource, NewPassword %>"></asp:Label>
                        <asp:TextBox ID="NewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server" ControlToValidate="NewPassword"
                            CssClass="failureNotification" ErrorMessage="<%$ Resources:Resource, NewPasswordRequired %>"
                            ToolTip="<%$ Resources:Resource, NewPasswordRequired %>" ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                    </p>
                    <p>
                        <asp:Label ID="ConfirmNewPasswordLabel" runat="server" AssociatedControlID="ConfirmNewPassword"
                            Text="<%$ Resources:Resource, ConfirmNewPassword %>"></asp:Label>
                        <asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="passwordEntry" TextMode="Password"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server" ControlToValidate="ConfirmNewPassword"
                            CssClass="failureNotification" Display="Dynamic" ErrorMessage="<%$ Resources:Resource, ConfirmNewPasswordRequired %>"
                            ToolTip="<%$ Resources:Resource, ConfirmNewPasswordRequired %>" ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:RequiredFieldValidator>
                        <asp:CompareValidator ID="NewPasswordCompare" runat="server" ControlToCompare="NewPassword"
                            ControlToValidate="ConfirmNewPassword" CssClass="failureNotification" Display="Dynamic"
                            ErrorMessage="<%$ Resources:Resource, PasswordMatchMessage %>" ValidationGroup="ChangeUserPasswordValidationGroup">*</asp:CompareValidator><span>&nbsp;</span>
                    </p>
                </fieldset>
                <p class="submitButton">
                    <asp:Button ID="CancelPushButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="<%$ Resources:Resource, Cancel %>" />
                    <asp:Button ID="ChangePasswordPushButton" runat="server" CommandName="ChangePassword"
                        Text="<%$ Resources:Resource, ChangePassword %>" ValidationGroup="ChangeUserPasswordValidationGroup" />
                </p>
            </div>
        </ChangePasswordTemplate>
    </asp:ChangePassword>
</asp:Content>
