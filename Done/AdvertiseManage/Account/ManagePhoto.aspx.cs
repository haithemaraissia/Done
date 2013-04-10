using System;
using System.Globalization;
using System.IO;
using System.Threading;
using System.Web;

namespace Account
{
    public partial class AccountManagePhoto : System.Web.UI.Page
    {

        protected override void InitializeCulture()
        {
            var lang = Request.QueryString["l"];
            if (lang != null | !string.IsNullOrEmpty(lang))
            {
                Thread.CurrentThread.CurrentUICulture = new CultureInfo(lang);
                Thread.CurrentThread.CurrentCulture = CultureInfo.CreateSpecificCulture(lang);
                Session["LCID"] = Utility.GetLCID(lang);
            }
            else
            {
                if (Session["LCID"] != null)
                {
                    Thread.CurrentThread.CurrentUICulture =
                        new CultureInfo(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                    Thread.CurrentThread.CurrentCulture =
                        CultureInfo.CreateSpecificCulture(Utility.GetLanguage(Convert.ToInt32(Session["LCID"])));
                }
            }

        }

        bool _flag = true;

        protected void Page_Load(Object sender, EventArgs e)
        {
            centerstage.Src = Profile.Picture1;
            photo0.Src = Profile.Picture1;
            photo1.Src = Profile.Picture2;
            photo2.Src = Profile.Picture3;
            photo3.Src = Profile.Picture4;
            if (Session["LCID"] == null)
            {
                Session["LCID"] = 1;
            }
        }

        protected void ChangePhotoLinkButtonClick(object sender, EventArgs e)
        {
            ChangePhotoModalPopUpExtender.Show();
            switch (ProfileHiddenField.Value)
            {
                case "0":
                    Session["SelectedImage"] = 0;
                    break;
                case "1":
                    Session["SelectedImage"] = 1;
                    break;
                case "2":
                    Session["SelectedImage"] = 2;
                    break;
                case "3":
                    Session["SelectedImage"] = 3;
                    break;
                default:
                    Session["SelectedImage"] = 0;
                    break;
            }
        }


        protected void AsyncFileUploadUploadedComplete(object sender, AjaxControlToolkit.AsyncFileUploadEventArgs e)
        {
            _flag = true;
            if ((Convert.ToInt32(e.FileSize) >= 4096000))
            {
                _flag = false;
            }

            string typeAllowed = null;
            var extension = Path.GetExtension(e.FileName);
            if (extension != null)
                typeAllowed = extension.ToLower();
            if ((typeAllowed == ".jpg" | typeAllowed == ".jpeg" | typeAllowed == ".gif" | typeAllowed == ".png" | typeAllowed == ".bmp" | typeAllowed == ".tiff" | typeAllowed == ".swf") == false)
            {
                _flag = false;
            }
            if (AsyncFileUpload1.HasFile == false)
            {
                _flag = false;
            }

            if (!_flag) return;
            //save
            var path = Server.MapPath("~/Management/Profile/Photo/") + User.Identity.Name + "/"   + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
            switch (Session["SelectedImage"].ToString())
            {
                case "0":
                    Profile.Picture1 = "http://www.my-side-job.com/Manage/Advertise/Management/Profile/Photo/" + User.Identity.Name + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                    break;
                case "1":
                    Profile.Picture2 = "http://www.my-side-job.com/Manage/Advertise/Management/Profile/Photo/" + User.Identity.Name + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                    break;
                case "2":
                    Profile.Picture3 = "http://www.my-side-job.com/Manage/Advertise/Management/Profile/Photo/" + User.Identity.Name + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                    break;
                case "3":
                    Profile.Picture4 = "http://www.my-side-job.com/Manage/Advertise/Management/Profile/Photo/" + User.Identity.Name + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                    break;
                default:
                    Profile.Picture1 = "http://www.my-side-job.com/Manage/Advertise/Management/Profile/Photo/" + User.Identity.Name + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                    break;
            }
            centerstage.Src = "~/Profile/Photo/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
            AsyncFileUpload1.SaveAs(path);
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
            Response.Redirect(HttpContext.Current.Request.Url.AbsoluteUri);
        }

        /*
                protected void SaveCreative()
                {
                    if (_flag != true) return;
                    ValidateDirectory();
                    if (AsyncFileUpload1.FileName == null) return;
                    string adPath = GetAdvertiserDirectory() + "/" + AsyncFileUpload1.FileName.ToString(CultureInfo.InvariantCulture);
                    AsyncFileUpload1.SaveAs(adPath);
                }
        */

        /*
                protected void AsyncFileUploadCustomValidatorServerValidate(object source, ServerValidateEventArgs args)
                {
                    if (AsyncFileUpload1.HasFile == false)
                    {
                        _flag = false;
                    }

                    args.IsValid = _flag;
                }
        */
    }
}