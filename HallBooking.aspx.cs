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

public partial class HallBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string HallBook(String hallName, String capacity, String hallType, String catering, String licenceImg, String hallImagesList, String rent, String selectedDistrict,
                             String city, String pinCode, String hallAddress, String aboutHall, String mobileNumber)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("insertHall", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MemberID", HttpContext.Current.Request.Cookies["EventCustomerCookie"]["EVENTCUSTOMERID"].ToString());
            if (hallName == string.Empty)
                cmd.Parameters.AddWithValue("@hallName", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@hallName", hallName);
            if (capacity == string.Empty)
                cmd.Parameters.AddWithValue("@capacity", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@capacity", capacity);
            if (hallType == string.Empty)
                cmd.Parameters.AddWithValue("@hallType", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@hallType", hallType);
            if (catering == string.Empty)
                cmd.Parameters.AddWithValue("@catering", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@catering", catering);
            if (licenceImg == string.Empty)
                cmd.Parameters.AddWithValue("@licenceImg", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@licenceImg", licenceImg);
            if (hallImagesList == string.Empty)
                cmd.Parameters.AddWithValue("@hallImagesList", DBNull.Value);
            else
            {
                var imageList = JsonConvert.DeserializeObject<DataTable>(hallImagesList);
                cmd.Parameters.AddWithValue("@hallImagesList", imageList).SqlDbType = SqlDbType.Structured;
            }
                
            if (rent == string.Empty)
                cmd.Parameters.AddWithValue("@rent", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@rent", rent);
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
            if (hallAddress == string.Empty)
                cmd.Parameters.AddWithValue("@hallAddress", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@hallAddress", hallAddress);
            if (aboutHall == string.Empty)
                cmd.Parameters.AddWithValue("@aboutHall", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@aboutHall", aboutHall);
            if (mobileNumber == string.Empty)
                cmd.Parameters.AddWithValue("@mobileNumber", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@mobileNumber", mobileNumber);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }
    }
}