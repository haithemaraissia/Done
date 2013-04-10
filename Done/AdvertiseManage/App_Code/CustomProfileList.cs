using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for CustomProfileList
/// </summary>
public class CustomProfileList
{
    public string Name { get; set; }
    public string Gender { get; set; }
    public string Location { get; set; }
    public string Industry { get; set; }
    public string Age { get; set; }
    public string Email { get; set; }
    public string Language { get; set; }
    public int LCID { get; set; }
    public string Cellphone { get; set; }
    public string Picture1 { get; set; }
    public DateTime Activity { get; set; }
    public string Username { get; set; }

    public CustomProfileList(string name, string gender, string location,
        string industry, string age, string email, string language, int lcid,
        string cellphone, string picture1, DateTime activity, string username)
    {
        Name = name;
        Gender = gender;
        Location = location;
        Industry = industry;
        Age = age;
        Email = email;
        Language = language;
        LCID = lcid;
        Cellphone = cellphone;
        Picture1 = picture1;
        Activity = activity;
        Username = username;
    }
}