<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TemplateMainUpperButtons.ascx.vb" Inherits="common.TemplateMainUpperButtons" %>
<link href="http://my-side-job.com/Manage/Advertise/Styles/Site.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="http://my-side-job.com/Manage/Advertise/Styles/Menustyle.css" type="text/css" />
<!--[if lte IE 7]>
        <link rel="stylesheet" type="text/css" href=Styles/ie.css" media="screen" />
    <![endif]-->
<script type="text/javascript" src="http://my-side-job.com/Manage/Advertise/Scripts/jquery-1.4.1.min.js"></script>
<script type="text/javascript" language="javascript" src="http://my-side-job.com/Manage/Advertise/Scripts/jquery.dropdownPlain.js"></script>
<div id="page-wrap">
    <ul class="dropdown" style="z-index: 100">
        <li>
            <asp:HyperLink ID="HomeHyperlink"  runat="server" NavigateUrl="http://my-side-job.com/Manage/Advertise/Default.aspx" 
            Text="<%$ Resources:Resource, Home %>"></asp:HyperLink>
        </li>
        <li><asp:HyperLink ID="ManagementHyperLink" runat="server" NavigateUrl="" Text="<%$ Resources:Resource, Management %>"></asp:HyperLink>
            <ul>
                <li><asp:HyperLink ID="AdvertiserHyperLink" runat="server" NavigateUrl="" Text="<%$ Resources:Resource, Advertiser %>"></asp:HyperLink>
                    <ul>
                        <li><a href="#">Advertiser External Link</a></li>
                    </ul>
                </li>
            </ul>
        </li>
        <li><a href="#"></a>
        </li>
        <li><asp:HyperLink ID="AccountHyperLink" runat="server" NavigateUrl="" Text="<%$ Resources:Resource, Account %>"></asp:HyperLink>
            <ul>
                <li>
                    <asp:HyperLink ID="ViewProfileHyperLink" runat="server" NavigateUrl="http://my-side-job.com/Manage/Advertise/Management/Profile/ViewProfile.aspx" 
                    Text="<%$ Resources:Resource, ViewProfile %>"></asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="EditProfileHyperLink" runat="server" NavigateUrl="http://my-side-job.com/Manage/Advertise/Account/EditProfile.aspx" 
                    Text="<%$ Resources:Resource, EditProfile %>"></asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="DeleteProfileHyperLink" runat="server" NavigateUrl="http://my-side-job.com/Manage/Advertise/Account/DeleteProfile.aspx" 
                    Text="<%$ Resources:Resource, DeleteProfile %>"></asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="ManagePhotoHyperLink" runat="server" NavigateUrl="http://my-side-job.com/Manage/Advertise/Account/ManagePhoto.aspx" 
                    Text="<%$ Resources:Resource, ManagePhoto %>"></asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="ChangePasswordHyperLink" runat="server" NavigateUrl="http://my-side-job.com/Manage/Advertise/Account/ChangePassword.aspx" 
                    Text="<%$ Resources:Resource, ChangePassword %>"></asp:HyperLink>
                </li>
                <li>
                    <asp:HyperLink ID="LogOutHyperLink" runat="server" NavigateUrl="http://my-side-job.com/Manage/Advertise/Account/LogOut.aspx" 
                    Text="<%$ Resources:Resource, LogOut %>"></asp:HyperLink>
                </li>
            </ul>
        </li>
        <li style="width: 132px">
            <asp:HyperLink ID="HelpHyperlink" runat="server" NavigateUrl="" 
                Text="<%$ Resources:Resource, Help %>"></asp:HyperLink>
           <%-- <ul>
                <li><a href="../AboutUs.aspx">About Us</a></li>
                <li><a href="../WhiteBoard.aspx">WhiteBoard</a></li>
                <li><a href="../ContactUs.aspx">Contact Us</a></li>
            </ul>--%>
        </li>
        	<li style="float:right">
        	    <a href="#">
        	         <img id="selectedlanguage" alt="earth" src="http://www.my-side-job.com/Manage/Advertise/Images/flags/earth.png" runat="server" height="42" width="42" />
        	     </a>
        		<ul>
        		     <li><a href="?l=en-US"><img src="http://www.my-side-job.com/Manage/Advertise/Images/flags/US.png" <asp:Label ID="EnglishLanguageLabel" ForeColor="White" runat="server" Text="<%$ Resources:Resource, English %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a href="?l=fr"><img src="http://www.my-side-job.com/Manage/Advertise/Images/flags/FR.png" <asp:Label ID="FrenchLanguageLabel" runat="server" Text="<%$ Resources:Resource, French %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a href="?l=es"><img src="http://www.my-side-job.com/Manage/Advertise/Images/flags/ES.png"  <asp:Label ID="SpanishLanguageLabel" runat="server" Text="<%$ Resources:Resource, Spanish %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a href="?l=zh-CN"><img src="http://www.my-side-job.com/Manage/Advertise/Images/flags/CN.png"  <asp:Label ID="ChineseLanguageLabelbel4" runat="server" Text="<%$ Resources:Resource, Chinese %>" Font-Size="Smaller"></asp:Label>  </></a></li>
                                                <li><a href="?l=ru"><img src="http://www.my-side-job.com/Manage/Advertise/Images/flags/RU.png"  <asp:Label ID="RussianLanguageLabel" runat="server" Text="<%$ Resources:Resource, Russian %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a href="?l=ar"><img src="http://www.my-side-job.com/Manage/Advertise/Images/flags/AE.png" <asp:Label ID="ArabicLanguageLabel" runat="server" Text="<%$ Resources:Resource, Arabic %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a href="?l=ja"><img src="http://www.my-side-job.com/Manage/Advertise/Images/flags/JP.png" <asp:Label ID="JapaneseLanguageLabel" runat="server" Text="<%$ Resources:Resource, Japanese %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                                                <li><a href="?l=de"><img src="http://www.my-side-job.com/Manage/Advertise/Images/flags/DE.png" <asp:Label ID="GermanLanguageLabel" runat="server" Text="<%$ Resources:Resource, German %>" Font-Size="Smaller"></asp:Label></>  </a></li>
                            </ul>
        	</li>
        </ul>
	</div>