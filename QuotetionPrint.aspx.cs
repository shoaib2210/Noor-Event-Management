using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class QuotetionPrint : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string getInvoiceDetails()
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("getInvoiceMemberDetails", con);
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
}