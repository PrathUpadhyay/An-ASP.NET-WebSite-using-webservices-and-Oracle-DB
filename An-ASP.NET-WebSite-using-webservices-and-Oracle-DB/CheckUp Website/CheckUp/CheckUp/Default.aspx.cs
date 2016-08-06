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
    public partial class first : System.Web.UI.Page
    {
        public static string x;
        public static string y;
        public static string z;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["filter"] = null;
            Session["details"] = null;
            x = TextBox1.Text;
            y = TextBox2.Text;
            z = TextBox3.Text;

            //if (IsPostBack && TextBox3.Text != "")
            //{
            //    ImageButton2.Enabled = true;

            //}

            if(TextBox1.Text == "")
                a.Attributes.Add("style", "float:left;display:inline-block;margin-left:150px;outline:1px solid #28AADC;padding:13px;");
            if(TextBox2.Text == "")
                b.Attributes.Add("style", "float:left;display:inline-block;margin-left:360px;outline:1px solid #28AADC;padding:13px;");
            if(TextBox3.Text == "")
                c.Attributes.Add("style", "float:left;display:inline-block;margin-left:290px;outline:1px solid #28AADC;padding:13px;");
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]

        public static string[] GetCompletionList(string prefixText, int count, string contextKey)
        {
            DBHelper _dbHelper = DBHelper.GetInstance();
            //SqlConnection con = new SqlConnection("Data Source=HIMANSHU28;Initial Catalog=db3;Integrated Security=True");
            OracleConnection con = new OracleConnection("Data Source=ORCL;User Id=checkup;Password=checkup; Integrated Security=NO");
            con.Open();
            string s = @prefixText + "%";
            string mysql = "select location_name from locations where location_name like :s";
            OracleDataAdapter da = new OracleDataAdapter(mysql, con);

            da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                members.SetValue(dr["location_name"].ToString(), i);
                i++;
            }
            return members;

        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string[] GetCompletionList1(string prefixText, int count, string contextKey)
        {

            DBHelper _dbHelper = DBHelper.GetInstance();
            //SqlConnection con = new SqlConnection("Data Source=HIMANSHU28;Initial Catalog=db3;Integrated Security=True");
            OracleConnection con = new OracleConnection("Data Source=ORCL;User Id=checkup;Password=checkup; Integrated Security=NO");
            con.Open();
            string s = @prefixText + "%";
            string mysql = "select unique risk_area_name from risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,tests t,locations l where risk_area_name like :s and ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and  l.location_name='" + x + "'";
            OracleDataAdapter da = new OracleDataAdapter(mysql, con);

            da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                members.SetValue(dr["risk_area_name"].ToString(), i);
                i++;
            }
            return members;
        }

        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string[] GetCompletionList2(string prefixText, int count, string contextKey)
        {
            DBHelper _dbHelper = DBHelper.GetInstance();
            //SqlConnection con = new SqlConnection("Data Source=HIMANSHU28;Initial Catalog=db3;Integrated Security=True");
            OracleConnection con = new OracleConnection("Data Source=ORCL;User Id=checkup;Password=checkup; Integrated Security=NO");
            con.Open();
            string s = @prefixText + "%";
           // string aa = y;
            string mysql = "select unique test_name from tests t,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,locations l where test_name like :s and ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='"+x+"' and r.risk_area_name='"+y+"'";
           // string mysql = "select unique test_name from tests t,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,locations l where test_name like :s and ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + x + "' and r.risk_area_name='" + y + "'";
            OracleDataAdapter da = new OracleDataAdapter(mysql, con);

            da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                members.SetValue(dr["test_name"].ToString(), i);
                i++;
            }
            return members;
        }


        protected void log_out(object sender, EventArgs e)
        {

            Session["user"] = null;
           
            Response.Redirect("default.aspx");

        }


        //protected void ImageButton2_Click(object sender, ImageClickEventArgs e)
        //{
        //    if (TextBox1.Text == "" || TextBox2.Text == "" || TextBox3.Text == "")
        //    {
        //        Response.Redirect("Default.aspx");
        //    }
        //    else
        //    {

        //        Session["locname"] = TextBox1.Text;
        //        Session["area"] = TextBox2.Text;
        //        Session["test"] = TextBox3.Text + " Test";
        //        Response.Redirect("FilterPage.aspx");
        //    }
                
        //}

        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            TextBox2.Enabled = true;
            //loc.Attributes.Add("style", "float:left;display:inline-block;margin-left:150px;outline:5px solid green;padding:10px;");
            a.Attributes.Add("style", "background-color:#28AADC;float:left;display:inline-block;margin-left:150px;outline:2px solid #28AADC;padding:13px;color:white;font-weight:bold;");
            // locationid = Int32.Parse(ConfigurationManager.AppSettings["locationid"]);
          
            string t1 = TextBox1.Text;
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            TextBox3.Enabled = true;
            // categoryid = Int32.Parse(ConfigurationManager.AppSettings["categoryid"]);
            b.Attributes.Add("style", "background-color:#28AADC;float:left;display:inline-block;margin-left:360px;outline:2px solid #28AADC;padding:13px;color:white;font-weight:bold;");
           
            string t2 = TextBox2.Text;

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            string t3 = TextBox3.Text;
            // testid = Int32.Parse(ConfigurationManager.AppSettings["testid"]);
            c.Attributes.Add("style", "background-color:#28AADC;float:left;display:inline-block;margin-left:290px;outline:2px solid #28AADC;padding:13px;color:white;font-weight:bold;");
            Session["locname"] = TextBox1.Text;
            Session["area"] = TextBox2.Text;
            Session["test"] = TextBox3.Text + " Test";
            Response.Redirect("FilterPage.aspx");
           // ImageButton2.Enabled = true;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            
            Session["test"] = Label1.Text;
            Session["labname"] = Label9.Text;
            Session["amnt"] = Button1.Text;
            Response.Redirect("testdetails.aspx");
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
           
            Session["test"] = Label2.Text;
            Session["labname"] = Label10.Text;
            Session["amnt"] = Button2.Text;
            Response.Redirect("testdetails.aspx");
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
            
            Session["test"] = Label3.Text;
            Session["labname"] = Label11.Text;
            Session["amnt"] = Button3.Text;
            Response.Redirect("testdetails.aspx");
        }

        protected void Button4_Click(object sender, EventArgs e)
        {
            
            Session["test"] = Label4.Text;
            Session["labname"] = Label12.Text;
            Session["amnt"] = Button4.Text;
            Response.Redirect("testdetails.aspx");
        }

        protected void Button5_Click(object sender, EventArgs e)
        {
        
            Session["test"] = Label5.Text;
            Session["labname"] = Label13.Text;
            Session["amnt"] = Button5.Text;
            Response.Redirect("testdetails.aspx");
        }

        protected void Button6_Click(object sender, EventArgs e)
        {
            
            Session["test"] = Label6.Text;
            Session["labname"] = Label14.Text;
            Session["amnt"] = Button6.Text;
            Response.Redirect("testdetails.aspx");
        }

        protected void Button7_Click(object sender, EventArgs e)
        {
           
            Session["test"] = Label7.Text;
            Session["labname"] = Label15.Text;
            Session["amnt"] = Button7.Text;
            Response.Redirect("testdetails.aspx");
        }

        protected void Button8_Click(object sender, EventArgs e)
        {
           
            Session["test"] = Label8.Text;
            Session["labname"] = Label16.Text;
            Session["amnt"] = Button8.Text;
            Response.Redirect("testdetails.aspx");
        }
    }
}