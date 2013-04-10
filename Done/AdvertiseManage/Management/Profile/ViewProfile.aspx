<%@ Page Title="" Language="C#" MasterPageFile="~/Plain.master" AutoEventWireup="true"
    CodeFile="ViewProfile.aspx.cs" Inherits="Management.Profile.AdvertiserProfileViewProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="Server">
    <link href="http://www.my-side-job.com/Manage/Advertise/Styles/Services.css" rel="stylesheet" type="text/css" />
    <style type="text/css">
        .follow
        {
            padding-top: 7px;
        }
        .profile-formats
        {
            font-size: 80%;
        }
        .industry
        {
            background-image: url('../../images/Icons/tourist_industry.png');
            background-repeat: no-repeat;
            float: left;
            font-size: 12px;
            font-weight: bold;
            line-height: 16px;
            padding-bottom: 0;
            padding-left: 22px;
            padding-right: 0;
            padding-top: 0;
        }
        .companywebsite
        {
            background-image: url('../../images/Icons/folder_web.png');
            background-repeat: no-repeat;
            float: left;
            font-size: 12px;
            font-weight: bold;
            line-height: 16px;
            padding-bottom: 0;
            padding-left: 22px;
            padding-right: 0;
            padding-top: 0;
            background-position: 0 -8px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="Server">
    <div id="content" class="profile" style="text-align: left">
        <div class="vcard grofile">
            <div class="column-left">
                <h3>
                    <asp:Label ID="ProfileInformationLabel" runat="server" Text="<%$ Resources:Resource, ProfileInformation %>"></asp:Label>
                </h3>
                <ul class="list-details">
                    <li><span class="img emails_primary">&nbsp;</span>
                        <h6>
                            <asp:Label ID="EmailLabel" runat="server" Text="<%$ Resources:Resource, EmailAddress %>"></asp:Label></h6>
                        <p>
                            <asp:HyperLink ID="EmailAddress" runat="server" NavigateUrl="" CssClass="url"></asp:HyperLink>
                        </p>
                    </li>
                    <li><span class="companywebsite">&nbsp;</span>
                        <h6>
                            <asp:Label ID="CompanyWebsiteLabel" runat="server" Text="<%$ Resources:Resource, CompanyWebsite %>"></asp:Label></h6>
                        <p>
                            <asp:HyperLink ID="CompanyWebsite" runat="server" CssClass="url" 
                                Target="_blank">[CompanyWebsite]</asp:HyperLink>
                        </p>
                    </li>
                    <li><span class="industry">&nbsp;</span>
                        <h6>
                            <asp:Label ID="IndustryLabel" runat="server" Text="<%$ Resources:Resource, IndustryLabel %>"></asp:Label></h6>
                        <p>
                            <asp:HyperLink ID="Industry" runat="server" NavigateUrl="" CssClass="url"></asp:HyperLink>
                        </p>
                    </li>
                    <li><span class="img accounts_linkedin">&nbsp;</span>
                        <h6>
                            <asp:Label ID="LinkedInLabel" runat="server" Text="<%$ Resources:Resource, LinkedIn %>"></asp:Label></h6>
                        <p>
                            <asp:HyperLink ID="linkedin" runat="server" CssClass="url" Target="_blank">[linkedin]</asp:HyperLink>
                        </p>
                    </li>
                    <li class="tel"><span class="img phoneNumbers_mobile">&nbsp;</span>
                        <h6>
                            <asp:Label ID="CellphoneLabel" runat="server" Text="<%$ Resources:Resource, Cellphone %>"></asp:Label></h6>
                        <p>
                            <asp:HyperLink ID="Cellphone" runat="server" NavigateUrl="" CssClass="url"></asp:HyperLink>
                        </p>
                        <br />
                    </li>
                </ul>
                <ul class="list-details">
                    <li><span class="img accounts_twitter" title="Twitter">&nbsp;</span>
                        <h6>
                            <asp:HyperLink ID="Twitter" runat="server" CssClass="url" Target="_blank">[Twitter]</asp:HyperLink>
                        </h6>
                        <p class="follow">
                            <a href="" class="twitter-follow-button" data-show-screen-name="false" data-show-count="true"
                                runat="server" text="<%$ Resources:Resource, Follow %>" id="twitterfollow" 
                                target="_blank"></a>
                            <script src="../../Scripts/widgets.js" type="text/javascript"></script>
                        </p>
                    </li>
                    <li><span class="img accounts_facebook" title="Facebook">&nbsp;</span>
                        <h6 style="width: 50px">
                            <div style="width: 50px">
                                 <asp:HyperLink ID="Facebook" runat="server" CssClass="url" 
                                Target="_blank" Width="50px" style="width:50">[Facebook]</asp:HyperLink>
                            </div>
                        </h6>
                        <p class="follow">
                            <iframe runat="server" id="FacebookFrame" src="" scrolling="no" frameborder="0" style="border: none;
                                overflow: hidden; width: 50px; height: 21px;" allowtransparency="true"></iframe>
                        </p>
                    </li>
                </ul>
            </div>
            <div class="column-right">
                <div id="gallery">
                    <span class="gallery-paperclip"></span>
                    <div class="gallery-main">
                        <img src="http://my-side-job.com/Manage/Advertise/Management/Profile/Photo/add-male-user.png" width="420" height="420"
                            id="centerstage" alt="Photo" class="photo" runat="server" />
                    </div>
                    <ul class="gallery-browser" style="overflow: hidden">
                        <li id="photo0wrap" class="photo-wrap sel"><a href="#" onclick="display_img( 0 ); return false;">
                            <img id="photo0" src="~/Management/Profile/Photo/add-male-user.png" alt="Small Photo"
                                class="photo" runat="server" height="85" width="85" /></a> </li>
                        <li id="photo1wrap" class="photo-wrap"><a href="#" onclick="display_img( 1 ); return false;">
                            <img id="photo1" src="~/Management/Profile/Photo/add-male-user.png" alt="Small Photo"
                                class="photo" runat="server" height="85" width="85" /></a> </li>
                        <li id="photo2wrap" class="photo-wrap"><a href="#" onclick="display_img( 2 ); return false;">
                            <img id="photo2" src="~/Management/Profile/Photo/add-male-user.png" alt="Small Photo"
                                class="photo" runat="server" height="85" width="85" /></a> </li>
                        <li id="photo3wrap" class="photo-wrap"><a href="#" onclick="display_img( 3 ); return false;">
                            <img id="photo3" src="~/Management/Profile/Photo/add-male-user.png" alt="Small Photo"
                                class="photo" runat="server" height="85" width="85" /></a> </li>
                    </ul>
                    <p class="clear">
                    </p>
                </div>
                <h2 class="fn">
                    <asp:Label ID="FirstName" runat="server"></asp:Label>
                    <asp:Label ID="LastName" runat="server"></asp:Label><br />
                </h2>
                <p class="location">
                    <asp:Label ID="Location" runat="server"></asp:Label><asp:Image ID="CountryImage"
                        runat="server" Width="18px" Height="18px" />
                </p>
                <p id="bio" class="description">
                    <asp:Label ID="Description" runat="server"></asp:Label>
                </p>
            </div>
            <p class="clear">
            </p>
        </div>
        <script type="text/javascript">
            var curr_image = 0;

            // Load a large image onto center stage
            function display_img(idx) {
                if (!$('#MainContent_photo' + idx).size())
                    idx = 0;
                curr_image = idx;
                $('#MainContent_centerstage').attr('src', $('#MainContent_photo' + idx).attr('src').replace(/size=120/, 'size=420'));
                highlight_img(idx);
                $('.gallery-main a').attr('href', '#MainContent_photo' + (curr_image * 1 + 1));
                $('.gallery-main a').unbind('click').click(function () {
                    display_img((curr_image * 1 + 1));
                    return false;
                });
            }

            // Highlights the currently selected image on stage right
            function highlight_img(idx, changeUrl) {
                $('.photo-wrap').removeClass('sel');
                $('#photo' + idx + 'wrap.photo-wrap').addClass('sel');
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
</asp:Content>
