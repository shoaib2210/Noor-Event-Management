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

public partial class CaterBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string caterBooking(String caterName, String northIndia, String southIndia, String chaatFood, String seaFood, String licenceImg, String caterImagesList, String caterAddress, String selectedDistrict,
                          String city, String pinCode, String totalcharges, String aboutCater, String phoneNumber)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("insertCater", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MemberID", HttpContext.Current.Request.Cookies["EventCustomerCookie"]["EVENTCUSTOMERID"].ToString());
            if (caterName == string.Empty)
                cmd.Parameters.AddWithValue("@caterName", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@caterName", caterName);
            if (northIndia == string.Empty)
                cmd.Parameters.AddWithValue("@northIndia", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@northIndia", northIndia);
            if (southIndia == string.Empty)
                cmd.Parameters.AddWithValue("@southIndia", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@southIndia", southIndia);
            if (chaatFood == string.Empty)
                cmd.Parameters.AddWithValue("@chaatFood", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@chaatFood", chaatFood);
            if (seaFood == string.Empty)
                cmd.Parameters.AddWithValue("@seaFood", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@seaFood", seaFood);
            if (licenceImg == string.Empty)
                cmd.Parameters.AddWithValue("@licenceImg", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@licenceImg", licenceImg);
            if (caterImagesList == string.Empty)
                cmd.Parameters.AddWithValue("@caterImagesList", DBNull.Value);
            else
            {
                var imageList = JsonConvert.DeserializeObject<DataTable>(caterImagesList);
                cmd.Parameters.AddWithValue("@caterImagesList", imageList).SqlDbType = SqlDbType.Structured;
            }

            if (caterAddress == string.Empty)
                cmd.Parameters.AddWithValue("@caterAddress", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@caterAddress", caterAddress);
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
            if (totalcharges == string.Empty)
                cmd.Parameters.AddWithValue("@totalcharges", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@totalcharges", totalcharges);
            if (aboutCater == string.Empty)
                cmd.Parameters.AddWithValue("@aboutCater", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@aboutCater", aboutCater);
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