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

public partial class DecorateBooking : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string decorateBooking(String decoratorName, String realFloralCharges, String floralCarCharges, String artificialFloralCharges, String artificialFloralCarCharges,String totalCharges, String licenceImg, String decorateImagesList, String decoratorAddress, String aboutDecoration, String selectedDistrict,
                           String city, String pinCode, String mobileNumber)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("insertDecorator", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MemberID", HttpContext.Current.Request.Cookies["EventCustomerCookie"]["EVENTCUSTOMERID"].ToString());
            if (decoratorName == string.Empty)
                cmd.Parameters.AddWithValue("@decoratorName", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@decoratorName", decoratorName);
            if (realFloralCharges == string.Empty)
                cmd.Parameters.AddWithValue("@realFloralCharges", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@realFloralCharges", realFloralCharges);
            if (floralCarCharges == string.Empty)
                cmd.Parameters.AddWithValue("@floralCarCharges", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@floralCarCharges", floralCarCharges);
            if (artificialFloralCharges == string.Empty)
                cmd.Parameters.AddWithValue("@artificialFloralCharges", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@artificialFloralCharges", artificialFloralCharges);
           
            if (artificialFloralCarCharges == string.Empty)
                cmd.Parameters.AddWithValue("@artificialFloralCarCharges", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@artificialFloralCarCharges", artificialFloralCarCharges);
            if (totalCharges == string.Empty)
                cmd.Parameters.AddWithValue("@totalCharges", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@totalCharges", totalCharges);
            if (licenceImg == string.Empty)
                cmd.Parameters.AddWithValue("@licenceImg", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@licenceImg", licenceImg);
            if (decorateImagesList == string.Empty)
                cmd.Parameters.AddWithValue("@decoratorImagesList", DBNull.Value);
            else
            {
                var imageList = JsonConvert.DeserializeObject<DataTable>(decorateImagesList);
                cmd.Parameters.AddWithValue("@decoratorImagesList", imageList).SqlDbType = SqlDbType.Structured;
            }

            if (decoratorAddress == string.Empty)
                cmd.Parameters.AddWithValue("@decoratorAddress", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@decoratorAddress", decoratorAddress);
            if (aboutDecoration == string.Empty)
                cmd.Parameters.AddWithValue("@aboutDecoration", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@aboutDecoration", aboutDecoration);
            
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