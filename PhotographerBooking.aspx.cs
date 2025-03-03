using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class PhotographerBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string photographerBooking(String photographerName, String PreWedding, String wholeWedding, String traditional, String candid, String licenceImg, String photographyImagesList, String photographerAddress, String selectedDistrict,
                           String city, String pinCode, String phoneNumber)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("insertPhotographer", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MemberID", HttpContext.Current.Request.Cookies["EventCustomerCookie"]["EVENTCUSTOMERID"].ToString());
            if (photographerName == string.Empty)
                cmd.Parameters.AddWithValue("@photographerName", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@photographerName", photographerName);
            if (PreWedding == string.Empty)
                cmd.Parameters.AddWithValue("@PreWedding", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@PreWedding", PreWedding);
            if (wholeWedding == string.Empty)
                cmd.Parameters.AddWithValue("@wholeWedding", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@wholeWedding", wholeWedding);
            if (traditional == string.Empty)
                cmd.Parameters.AddWithValue("@traditional", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@traditional", traditional);
            if (candid == string.Empty)
                cmd.Parameters.AddWithValue("@candid", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@candid", candid);
            if (licenceImg == string.Empty)
                cmd.Parameters.AddWithValue("@licenceImg", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@licenceImg", licenceImg);
            if (photographyImagesList == string.Empty)
                cmd.Parameters.AddWithValue("@photographyImagesList", DBNull.Value);
            else
            {
                var imageList = JsonConvert.DeserializeObject<DataTable>(photographyImagesList);
                cmd.Parameters.AddWithValue("@photographyImagesList", imageList).SqlDbType = SqlDbType.Structured;
            }

            if (photographerAddress == string.Empty)
                cmd.Parameters.AddWithValue("@photographerAddress", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@photographerAddress", photographerAddress);
            if (selectedDistrict == string.Empty)
                cmd.Parameters.AddWithValue("@selectedDistrict", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@selectedDistrict", selectedDistrict);
            if (city == string.Empty)
                cmd.Parameters.AddWithValue("@city", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@city", city);
            if (pinCode == string.Empty)
                cmd.Parameters.AddWithValue("@pinCode", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@pinCode", pinCode);
            if (phoneNumber == string.Empty)
                cmd.Parameters.AddWithValue("@phoneNumber", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@phoneNumber", phoneNumber);


            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }
    }
}