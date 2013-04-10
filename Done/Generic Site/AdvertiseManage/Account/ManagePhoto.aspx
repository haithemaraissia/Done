<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ManagePhoto.aspx.cs" Inherits="Account.AccountManagePhoto" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="asp" %>
<%@ Register TagPrefix="UpperNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainUpperButtons.ascx" %>
<%@ Register TagPrefix="LowerNavigationButtons" TagName="NavigationButtons" Src="../common/TemplateMainLowerButtons.ascx" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>ManagePhoto</title>
    <link href="http://my-side-job.com/Manage/Advertise/Styles/Site.css" rel="stylesheet" type="text/css" />
    <link href="http://my-side-job.com/Manage/Advertise/Styles/Services.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .follow
        {
            padding-top: 7px;
        }
        .profile-formats
        {
            font-size: 80%;
        }
        #navlist li
        {
            display: inline;
            list-style-type: none;
            padding-right: 20px;
        }
        .modalBackground
        {
            background-color: Gray;
            filter: alpha(opacity=70);
            opacity: 0.7;
        }
    </style>
    <script type="text/javascript">
        function uploadError() {
            window.$get("SucessLabel").style.display = 'none';
            window.$get("FailureLabel").style.display = 'block';
            window.$get("ErrorFileTypeLabel").style.display = 'block';
            window.$get("ErrorFileSizeLabel").style.display = 'block';
        }
        function uploadComplete(sender, args) {
            var completeSuccess;
            completeSuccess = true;
            /*Validation for file extension*/
            var fileName = args.get_fileName();

            // extract and store the file extension into another variable
            var fileExtension = fileName.substr(fileName.length - 3, 3);

            // array of allowed file type extensions
            // peg for jpeg  iff for tiff
            var validFileExtensions = new Array("jpg", "gif", "peg", "png", "bmp", "iff", "swf");

            var flag = false;
            // loop over the valid file extensions to compare them with uploaded file
            for (var index = 0; index < validFileExtensions.length; index++) {
                if (fileExtension.toLowerCase() == validFileExtensions[index].toString().toLowerCase()) {
                    flag = true;
                }
            }
            /*Validation for file size*/
            if (parseInt(args.get_length()) >= 4096000) {
                completeSuccess = false;
                flag = false;
                return;
            }
            /*Validation for file size*/
            if (flag == false) {
                window.$get("SucessLabel").style.display = 'none';
                window.$get("FailureLabel").style.display = 'block';
                window.$get("ErrorFileTypeLabel").style.display = 'block';
                completeSuccess = false;
                return;
            }
            if (flag == true) {
                window.$get("SucessLabel").style.display = 'block';
                window.$get("FailureLabel").style.display = 'none';
                window.$get("ErrorFileSizeLabel").style.display = 'none';
                window.$get("ErrorFileTypeLabel").style.display = 'none';
                window.location.href = window.location.href;
            }
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div style="width: 100%; background: #00457A;">
        <table style="margin: 0 auto;" align="center">
            <tr>
                <td>
                    <h2 id="H2SideJob" style="width: 960px;" align="center">
                        <asp:Label ID="H2SideJobLabel" runat="server" Text="Side Job" Font-Bold="True" Font-Size="Large"
                            Style="font-size: xx-large; font-family: Andy; color: #FFFFFF;"></asp:Label></h2>
                </td>
            </tr>
        </table>
    </div>
    <div id="wrap">
        <div id="header">
            <div class="middle">
                <UpperNavigationButtons:NavigationButtons runat="server" />
            </div>
        </div>
        <div id="main">
            <div class="middle">
                <div class="box-top">
                </div>
                <div class="box">
                    <asp:ToolkitScriptManager runat="server">
                    </asp:ToolkitScriptManager>
                    <div id="content" class="profile" style="text-align: left">
                        <div class="vcard grofile">
                            <table width="940px" align="center">
                                <tr>
                                    <td>
                                        <table width="100%" align="center">
                                            <tr>
                                                <td>
                                                    <div id="photo0wrap" class="photoimg">
                                                        <a href="#" onclick="display_img( 0 ); return false;">
                                                            <img id="photo0" src="http://my-side-job.com/Manage/Advertise/Management/Profile/Photo/add-male-user.png" alt="Small Photo"
                                                                runat="server" height="100" width="100" /></a>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div id="photo1wrap" class="photoimg">
                                                        <a href="#" onclick="display_img( 1 ); return false;">
                                                            <img id="photo1" src="http://my-side-job.com/Manage/Advertise/Management/Profile/Photo/add-male-user.png" alt="Small Photo"
                                                                class="photo" runat="server" height="100" width="100" /></a>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div id="photo2wrap" class="photoimg">
                                                        <a href="#" onclick="display_img( 2 ); return false;">
                                                            <img id="photo2" src="http://my-side-job.com/Manage/Advertise/Management/Profile/Photo/add-male-user.png" alt="Small Photo"
                                                                class="photo" runat="server" height="100" width="100" /></a>
                                                    </div>
                                                </td>
                                                <td>
                                                    <div id="photo3wrap" class="photoimg">
                                                        <a href="#" onclick="display_img( 3 ); return false;">
                                                            <img id="photo3" src="http://my-side-job.com/Manage/Advertise/Management/Profile/Photo/add-male-user.png" alt="Small Photo"
                                                                class="photo" runat="server" height="100" width="100" /></a>
                                                    </div>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                            </table>
                            <p class="clear">
                            </p>
                            <div style="margin-top: 60px; margin-left: 115px" align="center" id="Adjustement">
                                <div>
                                    <table cellpadding="10px">
                                        <tr>
                                            <td>
                                                <div id="gallery" style="width: 430px">
                                                    <span class="gallery-paperclip"></span>
                                                    <div class="gallery-main">
                                                        <img src="http://my-side-job.com/Manage/Advertise/Management/Profile/Photo/add-male-user.png" width="420" height="420"
                                                            id="centerstage" alt="Photo" class="photo" runat="server" />
                                                        <p class="clear">
                                                        </p>
                                                    </div>
                                                </div>
                                            </td>
                                            <td>
                                                <div id="Edit">
                                                    <asp:LinkButton ID="ChangePhotoLinkButton" runat="server" OnClick="ChangePhotoLinkButtonClick" Text="<%$ Resources:Resource, ChangePhoto %>"></asp:LinkButton>
                                                </div>
                                            </td>
                                        </tr>
                                    </table>
                                    <p class="clear">
                                    </p>
                                </div>
                            </div>
                        </div>
                        <script type="text/javascript">
                            var curr_image;
                            // Load a large image onto center stage
                            function display_img(idx) {
                                if (!$('#photo' + idx).size())
                                    idx = 0;
                                curr_image = idx;
                                $('#centerstage').attr('src', $('#photo' + idx).attr('src').replace(/size=120/, 'size=420'));
                                highlight_img(idx,"#");
                                $('.gallery-main a').attr('href', '#photo' + (curr_image * 1 + 1));
                                $('.gallery-main a').unbind('click').click(function () {
                                    display_img((curr_image * 1 + 1));
                                    return false;
                                });
                            }
                            function highlight_img(idx, changeUrl) {
                                $('.photoimg').removeClass('sel');
                                $('#photo' + idx + 'wrap.photoimg').addClass('sel');
                                $('#ProfileHiddenField').val(idx);
                                var href = jQuery(location).attr('href');
                                href = href + "?ID=" + idx;
                                jQuery(location).href = href;
                            }
                            // Page load actions/defaults
                            $(document).ready(function () {
                                if ('' != document.location.hash)
                                    curr_image = 0;
                                display_img(curr_image, false);
                            });
                            // Stop automatic window-closing on return to profiles
                            window.opener = null;
                        </script>
                    </div>
                    <asp:Panel ID="ImageUploadPanel" runat="server" BackColor="#E0E0E0" Height="80px"
                        Style="display: none;" Width="345px" BorderColor="MidnightBlue" BorderStyle="Solid"
                        BorderWidth="3px">
                        <asp:UpdatePanel ID="ImageUploadUpdatePanel" runat="server">
                            <ContentTemplate>
                                <asp:ModalPopupExtender ID="ChangePhotoModalPopUpExtender" runat="server" TargetControlID="ConfirmationLabel"
                                    PopupControlID="ImageUploadPanel" BackgroundCssClass="modalBackground"></asp:ModalPopupExtender>
                                <asp:Label ID="ConfirmationLabel" runat="server" Style="position: absolute; left: 8px;
                                    top: 12px;" Text="<%$ Resources:Resource, ConfirmationLabel %>" Width="334px"></asp:Label>
                                <p>
                                    &nbsp;<asp:AsyncFileUpload OnClientUploadError="uploadError" OnClientUploadComplete="uploadComplete"
                                        runat="server" ID="AsyncFileUpload1" Width="300px" UploaderStyle="Modern" UploadingBackColor="#CCFFFF"
                                        ThrobberID="myThrobber" FailedValidation="False" BorderWidth="0px" OnUploadedComplete="AsyncFileUploadUploadedComplete" />
                                    <p>
                                        <asp:TextBox ID="AsyncFileUpload" runat="server" Height="0px" Width="0px"></asp:TextBox>
                                        <asp:Label ID="myThrobber" runat="server" Style="display: none; top: 10">

&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;

                                <img  alt="uploading" src="../Images/uploading.gif" />
                                        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </asp:Label>
                                        <asp:Label ID="SucessLabel" runat="server" Style="display: none; position: relative;
                                            top: 15px; z-index: 1; left: 10px" Width="20px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img alt="GreenCheckMark" src="../Images/GreenCheckMark.gif" width="16" />
                                        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </asp:Label>
                                        <asp:Label ID="FailureLabel" runat="server" Style="display: none; position: relative;
                                            z-index: 1; top: 15px; left: 10px" Width="20px">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img alt="RedCheckMark" src="../Images/RedCheckMark.gif"  width="16" />
                                        
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                        </asp:Label>
                                        <br />
                                        <asp:Label ID="ErrorFileTypeLabel" runat="server" Font-Bold="True" Font-Names="Times New Roman"
                                            Font-Size="Small" ForeColor="Maroon" Height="52px" Style="display: none; overflow: visible;
                                            text-align: center; z-index: 2; top: -10px;" Text="<%$ Resources:Resource, ProjectRequirementContentTypeLabel %>"
                                            Width="113px"></asp:Label>
                                        <asp:Label ID="ErrorFileSizeLabel" runat="server" Font-Bold="True" Font-Names="Times New Roman"
                                            Font-Size="Small" ForeColor="Maroon" Style="display: none; position: relative;
                                            z-index: 100; top: 30px; left: 0px; text-align: center" Text="<%$ Resources:Resource, ProjectRequirementContentSizeLabel %>"
                                            Width="100px"></asp:Label>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </asp:Panel>
                    <span class="clear">
                        <asp:HyperLink ID="BackToProfileHyperLink" runat="server"  Text="<%$ Resources:Resource, BackToProfileLinkButton %>" NavigateUrl="http://my-side-job.com/Manage/Advertise/Management/Profile/ViewProfile.aspx"></asp:HyperLink>
                        </span></div>
                <div class="box-bottom">
                </div>
                <span class="clear"></span>
            </div>
            <span class="clear"></span>
            <asp:HiddenField ID="ProfileHiddenField" runat="server" />
        </div>
        <div id="footer1">
            <LowerNavigationButtons:NavigationButtons runat="server" />
        </div>
    </div>
    </form>
</body>
</html>
