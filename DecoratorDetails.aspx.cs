﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class DecoratorDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string decorateQuotation(string typeID, string name)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("decorateQuotation", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.AddWithValue("@MemberID", HttpContext.Current.Request.Cookies["EventCustomerCookie"]["EVENTCUSTOMERID"].ToString());

            if (typeID == String.Empty)
                cmd.Parameters.AddWithValue("@typeID", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@typeID", typeID);
            if (name == String.Empty)
                cmd.Parameters.AddWithValue("@name", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@name", name);
            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            da.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }
    }

    [WebMethod]
    public static string getDecorateDetails(string typeID)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("getDecoratorDetails", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (typeID == String.Empty)
                cmd.Parameters.AddWithValue("@typeID", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@typeID", typeID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            da.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }
    }

    [WebMethod]
    public static string getDecorateImages(string typeID)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            SqlCommand cmd = new SqlCommand("getDecoratorImages", con);
            cmd.CommandType = CommandType.StoredProcedure;

            if (typeID == String.Empty)
                cmd.Parameters.AddWithValue("@typeID", DBNull.Value);
            else
                cmd.Parameters.AddWithValue("@typeID", typeID);

            SqlDataAdapter da = new SqlDataAdapter(cmd);
            DataTable dt = new DataTable();
            con.Open();
            da.Fill(dt);
            con.Close();
            return ConnectionFactory.ConvertDataTabletoString(dt);
        }

    }
}