<%@ WebHandler Language="C#" Class="HallLicenceImage" %>

using System;
using System.Web;

public class HallLicenceImage : IHttpHandler {

    string path;
    string fileName;
    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {
            HttpFileCollection files = context.Request.Files;
            for (int i = 0; i < files.Count; i++)
            {
                HttpPostedFile file = files[i];
                fileName = file.FileName;
                path = context.Server.MapPath("LicenceImage/" + file.FileName);
                file.SaveAs(path);
            }
            context.Response.ContentType = "text/plain";
            context.Response.Write("LicenceImage/" + fileName);
        }

    }

    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}