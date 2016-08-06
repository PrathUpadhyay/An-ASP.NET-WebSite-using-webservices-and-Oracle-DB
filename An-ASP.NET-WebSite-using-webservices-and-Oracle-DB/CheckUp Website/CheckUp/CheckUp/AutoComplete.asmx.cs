using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DALC4NET;
using System.Data;
using System.Diagnostics;
using System.Text;
using System.Web.UI;
using System.Windows.Input;
using System.Windows.Markup;
using System.Web.UI.WebControls;
using System.Data.OracleClient;
using System.Data.Sql;
using System.Data.SqlClient;

namespace CheckUp
{
    /// <summary>
    /// Summary description for AutoComplete
    /// </summary>
    

    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
     [System.Web.Script.Services.ScriptService]
    public class AutoComplete : System.Web.Services.WebService
    {
       
        public AutoComplete()
        {

            //Uncomment the following line if using designed components
            //  InitializeComponent();
        }

        [WebMethod]
        public string[] GetCompletionList(string prefixText)
        {
            //Oracle Client

            //OracleConnection con = new OracleConnection("Data Source=ORCL;User Id=checkup;Password=checkup; Integrated Security=NO");

           // con.Open();
           // string queryString = "";

            //queryString = "select username from register where username like @prefixText";

            //con.Close();

          //  System.Data.OracleClient.OracleCommand sqlCmd = new System.Data.OracleClient.OracleCommand(queryString, con);

            //{

            //    sqlCmd.Parameters.Add("prefixText", System.Data.OracleClient.OracleType.VarChar).Value = prefixText + "%";
            //}

            //System.Data.OracleClient.OracleDataAdapter dataAdapter = new System.Data.OracleClient.OracleDataAdapter(sqlCmd);

            //System.Data.DataSet dataSet = new System.Data.DataSet();
            //System.Data.DataTable dataTable = new System.Data.DataTable();

            //dataAdapter.Fill(dataSet,"username");
            //dataTable = dataSet.Tables[0];

            //List<string> txtItems = new List<string>();
            //String dbValues;

            //foreach (DataRow row in dataTable.Rows)
            //{
            //    dbValues = row["username"].ToString();
            //    dbValues = dbValues.ToUpper();
            //    txtItems.Add(dbValues);
            //}

            //return txtItems.ToArray();



            SqlConnection con = new SqlConnection("Data Source=HIMANSHU28;Initial Catalog=db2;Integrated Security=True");
            con.Open();
            string s = @prefixText + "%";
            string mysql = "select Products from products where Products like @s";
            SqlDataAdapter da = new SqlDataAdapter(mysql, con);
            // SqlDataAdapter da = new SqlDataAdapter(mysql, con);
            //System.Data.OracleClient.OracleCommand da = new System.Data.OracleClient.OracleCommand(mysql, con);
            //da.Parameters.Add("s",System.Data.OracleClient.OracleType.VarChar,50).Value = s + "%";
            // da.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar,50).Value = s + "%";
            da.SelectCommand.Parameters.Add("s", System.Data.SqlDbType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {

                members.SetValue(dr["Products"].ToString(), i);
                i++;
                // nombres.SetValue(dr["type"].ToString(), i);
                //i++;
                //nombres.SetValue(dr["city"].ToString(), i);
                //i++;

            }
            return members;

            //SqlConnection cn = new SqlConnection();
            //DataSet ds = new DataSet();
            //DataTable dt = new DataTable();
            //String strCn = "Data Source=HIMANSHU28;Initial Catalog=db2;Integrated Security=True";
            //cn.ConnectionString = strCn;
            //SqlCommand cmd = new SqlCommand();
            //cmd.Connection = cn;
            //cmd.CommandType = CommandType.Text;
            ////Compare String From Textbox(prefixText) AND String From Column in DataBase(CompanyName)
            ////If String from DataBase is equal to String from TextBox(prefixText) then add it to return ItemList
            ////-----I Defined a parameter instead of passing value directly to prevent sql injection--------//
            //cmd.CommandText = "select Products from products where Products like @s";
            //cmd.Parameters.AddWithValue("@s", prefixText + "%");
            //try
            //{
            //    cn.Open();
            //    cmd.ExecuteNonQuery();
            //    SqlDataAdapter da = new SqlDataAdapter(cmd);
            //    da.Fill(ds);
            //}
            //catch
            //{
            //}
            //finally
            //{
            //    cn.Close();
            //}
            //dt = ds.Tables[0];

            ////Then return List of string(txtItems) as result
            //List<string> txtItems = new List<string>();
            //String dbValues;

            //foreach (DataRow row in dt.Rows)
            //{
            //    //String From DataBase(dbValues)
            //    dbValues = row["Products"].ToString();
            //    dbValues = dbValues.ToLower();
            //    txtItems.Add(dbValues);

            //}

            //return txtItems.ToArray();
        }
    }
}
