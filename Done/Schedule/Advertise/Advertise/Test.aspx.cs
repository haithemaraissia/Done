using System;
using System.IO;

namespace Advertise
{
    public partial class AdvertiseTest : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            string logPathDir = ResolveUrl("Messages");
            string logPath = string.Format("{0}\\{1}.txt", Server.MapPath(logPathDir), DateTime.Now.Ticks);
            File.WriteAllText(logPath, "Hello");

        }
    }
}