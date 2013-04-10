<%@ Control Language="VB" AutoEventWireup="false" CodeFile="TemplateMainLowerButtons.ascx.vb"
    Inherits="common.TemplateMainLowerButtons" %>
<link href="http://my-side-job.com/Manage/Advertise/Styles/MainLowerStyleSheet.css" rel="stylesheet" type="text/css" />
<div id="footer_wrapper">
    <div id="" align="center">
        <table style="width: 960px;" align="center">
            <tr>
                <td style="padding: 10px; width: 230px">
                    <h2 id="H2Company">
                        <asp:Label ID="CompanyLabel" runat="server" Text="<%$ Resources:Resource, Company %>"
                            Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                    <div id="CompanyPanel" style="background-color: #FFFFFF; text-align: center; border-right-style: solid;
                        border-left-style: solid; border-right-width: 2px; border-left-width: 2px; border-right-color: #666666;
                        border-left-color: #666666;">
                        <table style="width: 210px">
                            <tr>
                                <td>
                                    <asp:HyperLink ID="AboutUSHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/Manage/Advertise/AboutUs.aspx"
                                        Text="<%$ Resources:Resource, AboutUS %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="PrivacyHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/Manage/Advertise/Privacy.aspx"
                                        Text="<%$ Resources:Resource, Privacy %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="SiteMapHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/Manage/Advertise/SiteMap.aspx"
                                        Text="<%$ Resources:Resource, SiteMap %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="ContactUSHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/Manage/Advertise/ContactUS.aspx"
                                        Text="<%$ Resources:Resource, ContactUS %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="background-color: #666666; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 2px; margin-right: 0px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 3px; margin-right: 1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 4px; margin-right: 2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 4px solid #666666; border-right: 4px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 8px; margin-right: 6px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                </td>
                <td style="padding: 10px; width: 230px">
                    <h2 id="H2Developer">
                        <asp:Label ID="DeveloperLabel" runat="server" Text="<%$ Resources:Resource, Developer %>"
                            Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                    <div id="DeveloperPanel" style="background-color: #FFFFFF; text-align: center; border-right-style: solid;
                        border-left-style: solid; border-right-width: 2px; border-left-width: 2px; border-right-color: #666666;
                        border-left-color: #666666;">
                        <table style="width: 210px">
                            <tr>
                                <td>
                                    <asp:HyperLink ID="APIDocumentationHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/Manage/Developer/Documentation/APIDocumentation.aspx"
                                        Text="<%$ Resources:Resource, APIDocumentation %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <br />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="background-color: #666666; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 2px; margin-right: 0px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 3px; margin-right: 1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 4px; margin-right: 2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 4px solid #666666; border-right: 4px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 8px; margin-right: 6px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                </td>
                <td style="padding: 10px; width: 230px">
                    <h2 id="H2Subscribe">
                        <asp:Label ID="SubscribeLabel" runat="server" Text="<%$ Resources:Resource, Subscribe %>"
                            Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                    <div id="SubscribePanel" style="background-color: #FFFFFF; text-align: center; border-right-style: solid;
                        border-left-style: solid; border-right-width: 2px; border-left-width: 2px; border-right-color: #666666;
                        border-left-color: #666666;">
                        <table style="width: 210px">
                            <tr>
                                <td>
                                    <asp:HyperLink ID="SubscriptionHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/NewsLetter/Subscription/Subscribe.aspx"
                                        Text="<%$ Resources:Resource, Subscription %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="NewsLetterHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/NewsLetter/Home.aspx"
                                        Text="<%$ Resources:Resource, NewsLetter %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="FacebookImageButton" runat="server" Height="14px" ImageUrl="~/Images/Facebook.png"
                                        Width="14px" />
                                    &nbsp;<br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:ImageButton ID="TwetterImageButton" runat="server" Height="14px" ImageUrl="~/Images/Twitter-icon.png"
                                        Width="14px" />
                                    &nbsp;<br />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="background-color: #666666; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 2px; margin-right: 0px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 3px; margin-right: 1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 4px; margin-right: 2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 4px solid #666666; border-right: 4px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 8px; margin-right: 6px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                </td>
                <td style="padding: 10px; width: 230px">
                    <h2 id="H2Advertise">
                        <asp:Label ID="AdvertiseLabel" runat="server" Text="<%$ Resources:Resource, Advertise %>"
                            Font-Bold="True" Font-Size="Large"></asp:Label></h2>
                    <div id="AdvertisePanel" style="background-color: #FFFFFF; text-align: center; border-right-style: solid;
                        text-align: center; border-left-style: solid; border-right-width: 2px; border-left-width: 2px;
                        border-right-color: #666666; border-left-color: #666666;">
                        <table style="width: 210px">
                            <tr>
                                <td>
                                    <asp:HyperLink ID="ProductHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/Product.aspx"
                                        Text="<%$ Resources:Resource, Product %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="BusinessHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/Business.aspx"
                                        Text="<%$ Resources:Resource, Business %>"></asp:HyperLink>
                                    <br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="NewsLetterHyperLink2" runat="server" NavigateUrl="http://www.my-side-job.com/NewsLetter/Audience/NewsLetter.aspx"
                                        Text="<%$ Resources:Resource, NewsLetter %>"></asp:HyperLink><br />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <asp:HyperLink ID="EblastHyperLink" runat="server" NavigateUrl="http://www.my-side-job.com/Newsletter/Audience/Eblast.aspx"
                                        Text="<%$ Resources:Resource, EBlast %>"></asp:HyperLink><br />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div style="background-color: #666666; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 0px; margin-right: -2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 1px; margin-right: -1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 2px; margin-right: 0px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 3px; margin-right: 1px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 4px; margin-right: 2px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 4px solid #666666; border-right: 4px solid #666666;">
                    </div>
                    <div style="background-color: #666666; margin-left: 8px; margin-right: 6px; height: 1px;
                        font-size: 1px; overflow: hidden; border-left: 1px solid #666666; border-right: 1px solid #666666;">
                    </div>
                </td>
            </tr>
        </table>
        <table style="width: 960px" align="center">
            <tr>
                <td rowspan="4">
                    <div id="" style="text-align: center">
                        <asp:Label ID="copyrightlabel" runat="server" Style="font-family: Serif" />
                        <asp:Label ID="yoursidejoblabel" Style="font-family: Andy; font-weight: bold; color: #1e8cbe"
                            runat="server">  YourSideJob.com</asp:Label>
                    </div>
                </td>
            </tr>
        </table>
    </div>
</div>
