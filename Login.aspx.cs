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

public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    [WebMethod]
    public static string checkLogin(String eMail, String password)
    {
        using (SqlConnection con = new SqlConnection(ConnectionFactory.getConnectionString()))
        {
            try
            {
                SqlCommand cmd = new SqlCommand("getCustomerDetail", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.AddWithValue("@eMail", eMail);

                SqlDataAdapter sda = new SqlDataAdapter(cmd);
                DataTable dt = new DataTable();

                con.Open();
                sda.Fill(dt);
                con.Close();

                if (dt.Rows.Count > 0)
                {

                    string stname = eMail;
                    string stpass = dt.Rows[0]["MEMBER_PASSWORD"].ToString();

                    string mypass = password;

                    if ((mypass == stpass) && (stname == dt.Rows[0]["MEMBER_EMAIL_ID"].ToString()))
                    {
                        // Create and set cookie
                        HttpCookie customerCookie = new HttpCookie("EventCustomerCookie");
                        customerCookie.Expires = DateTime.Now.AddDays(1);
                        customerCookie["EVENTCUSTOMERID"] = dt.Rows[0]["MEMBER_ID"].ToString();
                        customerCookie["EVENTCUSTOMERCODE"] = dt.Rows[0]["MEMBER_CODE"].ToString();
                        customerCookie["EVENTCUSTOMERUSERNAME"] = dt.Rows[0]["MEMBER_NAME"].ToString();
                        //customerCookie["EVENTCUSTOMERUSERGENDER"] = dt.Rows[0]["CUSTOMER_GENDER"].ToString();
                        customerCookie["EVENTCUSTOMEREMAIL"] = dt.Rows[0]["MEMBER_EMAIL_ID"].ToString();
                        customerCookie["EVENTCUSTOMERCONTACTNO"] = dt.Rows[0]["MEMBER_CONTACT_NUMBER"].ToString();
                        //customerCookie["EVENTCUSTOMERAGE"] = dt.Rows[0]["CUSTOMER_AGE"].ToString();
                        //customerCookie["EVENTCUSTOMERSTATE"] = dt.Rows[0]["CUSTOMER_STATE_ID"].ToString();
                        //customerCookie["EVENTCUSTOMERDISTRICT"] = dt.Rows[0]["CUSTOMER_DISTRICT_ID"].ToString();
                        //customerCookie["EVENTCUSTOMERCITY"] = dt.Rows[0]["CUSTOMER_CITY_ID"].ToString();
                        //customerCookie["EVENTCUSTOMERPROFESSION"] = dt.Rows[0]["CUSTOMER_PROFESSION"].ToString();
                        HttpContext.Current.Response.Cookies.Add(customerCookie);
                      
                        return "{\"status\": \"success\", \"customer\": { \"MEMBER_ID\": \"" +
                        dt.Rows[0]["MEMBER_ID"] + "\", \"MEMBER_NAME\": \"" +
                        dt.Rows[0]["MEMBER_NAME"] + "\" } }";
                    }
                    else
                    {
                        return "{\"status\": \"wrong\"}";
                    }
                }
                else
                {
                    return "{\"status\": \"error\", \"message\": \"\"}";
                }
            }
            catch (Exception ex)
            {
                // Log exception (use proper logging mechanism)
                return "error: " + ex.Message;
            }
        }
    }
}