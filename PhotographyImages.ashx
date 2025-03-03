<%@ WebHandler Language="C#" Class="PhotographyImages" %>

using System;
using System.Web;
using System.Drawing.Imaging;
using System.Drawing;

public class PhotographyImages : IHttpHandler {

    string path;
    string fileName;

    //public void ProcessRequest(HttpContext context)
    //{
    //    if (context.Request.Files.Count > 0)
    //    {
    //        HttpFileCollection files = context.Request.Files;
    //        for (int i = 0; i < files.Count; i++)
    //        {
    //            HttpPostedFile file = files[i];
    //            fileName = file.FileName;
    //            path = context.Server.MapPath("ProductImage/" + file.FileName);
    //            file.SaveAs(path);
    //        }
    //        context.Response.ContentType = "text/plain";
    //        context.Response.Write("ProductImage/" + fileName);
    //    }
    //}

    public void ProcessRequest(HttpContext context)
    {
        if (context.Request.Files.Count > 0)
        {

            HttpFileCollection files = context.Request.Files;

            HttpPostedFile file = files[0];
            fileName = file.FileName;

            String timeStamp = DateTime.Now.ToString("yyyyMMddHHmmssffff");
            string path1 = context.Server.MapPath("PhotographyImage/" + timeStamp + ".jpg");

            using (Image myImage = Image.FromStream(file.InputStream))
            {
                EncoderParameter qualityParam = new EncoderParameter(Encoder.Quality, 50L);
                // Jpeg image codec
                ImageCodecInfo jpegCodec = GetEncoderInfo("image/jpeg");

                EncoderParameters encoderParams = new EncoderParameters(1);
                encoderParams.Param[0] = qualityParam;

                //myImage.Save(path1, jpegCodec, encoderParams);
                myImage.Save(path1, jpegCodec, encoderParams);
            }

            context.Response.ContentType = "text/plain";
            context.Response.Write("PhotographyImage/" + timeStamp + ".jpg");
        }
    }

    private static ImageCodecInfo GetEncoderInfo(string mimeType)
    {
        // Get image codecs for all image formats
        ImageCodecInfo[] codecs = ImageCodecInfo.GetImageEncoders();

        // Find the correct image codec
        for (int i = 0; i < codecs.Length; i++)
            if (codecs[i].MimeType == mimeType)
                return codecs[i];
        return null;
    }


    public bool IsReusable {
        get {
            return false;
        }
    }

}