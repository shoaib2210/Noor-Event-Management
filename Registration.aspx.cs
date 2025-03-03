using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Registration : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string MemberRegistration(String memberName, String eMail, String mobileNumber, String password, String address, String city, String district)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("insertMember", con);
            cmd.CommandType = CommandType.StoredProcedure;
            if (memberName == string.Empty)
                cmd.Parameters.AddWithValue("@memberName", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@memberName", memberName);
            if (eMail == string.Empty)
                cmd.Parameters.AddWithValue("@eMail", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@eMail", eMail);
            if (mobileNumber == string.Empty)
                cmd.Parameters.AddWithValue("@mobileNumber", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@mobileNumber", mobileNumber);
            if (password == string.Empty)
                cmd.Parameters.AddWithValue("@password", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@password", password);
            if (address == string.Empty)
                cmd.Parameters.AddWithValue("@address", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@address", address);
            if (city == string.Empty)
                cmd.Parameters.AddWithValue("@city", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@city", city);
            if (district == string.Empty)
                cmd.Parameters.AddWithValue("@district", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@district", district);

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }
    }
}
