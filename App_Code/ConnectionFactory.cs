using System.Configuration;
using System.Collections.Generic;


/// <summary>
/// Summary description for ConnectionFactory
/// </summary>
public class ConnectionFactory
{
    
    public static string getConnectionString()
    {
       return ConfigurationManager.ConnectionStrings["ConnectionString"].ConnectionString;
    }

    public static string ConvertDataTabletoString(System.Data.DataTable dt)
    {
        System.Web.Script.Serialization.JavaScriptSerializer serializer = new System.Web.Script.Serialization.JavaScriptSerializer();
        serializer.MaxJsonLength = int.MaxValue;
        List<Dictionary<string, object>> rows = new List<Dictionary<string, object>>();
        Dictionary<string, object> row;
        foreach (System.Data.DataRow dr in dt.Rows)
        {
            row = new Dictionary<string, object>();
            foreach (System.Data.DataColumn col in dt.Columns)
            {
                row.Add(col.ColumnName, dr[col]);
            }
            rows.Add(row);
        }
        return serializer.Serialize(rows);
    }

}