using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;
public partial class Quotation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string getQuotationDetails()
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("getQuotation", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MemberID", HttpContext.Current.Request.Cookies["EventCustomerCookie"]["EVENTCUSTOMERID"].ToString());
           
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            da.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }
    }

    [WebMethod]
    public static string deleteEvent(String quotationID)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("deleteQuetetion", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.AddWithValue("@MemberID", HttpContext.Current.Request.Cookies["EventCustomerCookie"]["EVENTCUSTOMERID"].ToString());

            if (quotationID == String.Empty)
                cmd.Parameters.AddWithValue("@quotationID", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@quotationID", quotationID);
            
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            da.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }
    }

    //[WebMethod]
    //public static string getSuggestionDetails(String charges, String quotetionID)
    //{
    //    using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
    //    {
    //        SqlCommand cmd = new SqlCommand("getSuggestionDetails", con);
    //        cmd.CommandType = CommandType.StoredProcedure;
    //        cmd.Parameters.AddWithValue("@MemberID", HttpContext.Current.Request.Cookies["EventCustomerCookie"]["EVENTCUSTOMERID"].ToString());

    //        if (charges == String.Empty)
    //            cmd.Parameters.AddWithValue("@charges", DBNull.Value);
    //        else
    //            cmd.Parameters.AddWithValue("@charges", charges);
    //        if (quotetionID == String.Empty)
    //            cmd.Parameters.AddWithValue("@quotetionID", DBNull.Value);
    //        else
    //            cmd.Parameters.AddWithValue("@quotetionID", quotetionID);
    //        SqlDataAdapter da = new SqlDataAdapter(cmd);
    //        DataTable dt = new DataTable();
    //        con.Open();
    //        da.Fill(dt);
    //        con.Close();
    //        return ConnectionFactory.ConvertDataTabletoString(dt);
    //    }
    //}
}