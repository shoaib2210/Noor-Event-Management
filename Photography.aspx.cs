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

public partial class Photography : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string getPhotographer()
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("getPhotoGrapher", con);
            cmd.CommandType = CommandType.StoredProcedure;

            SqlDataAdapter sda = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            sda.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }
    }
}