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

using System.Configuration;


namespace CheckUp
{
    public partial class FilterPage : System.Web.UI.Page
    {
        public static string x;
        public static string y;
        public static string z;
        public int k = 0;

        protected DBHelper _dbHelper = DBHelper.GetInstance();
        int id = 0;
        public static String farzi = "fz";
        public static string test;

        protected void Page_Load(object sender, EventArgs e)
        {
            Session["filter"] = "scsc";


            x = TextBox1.Text;
            y = TextBox2.Text;
            z = TextBox3.Text;




            if (!IsPostBack)
            {
                //test = Session["test"].ToString();
                this.BindRepeater();

                // databinding code here
            }





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
            string mysql = "select unique test_name from tests t,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,locations l where test_name like :s and ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + x + "' and r.risk_area_name='" + y + "'";
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







        protected void TextBox1_TextChanged(object sender, EventArgs e)
        {
            k = 1;
            // locationid = Int32.Parse(ConfigurationManager.AppSettings["locationid"]);
            TextBox1.Text = x;
            TextBox2.Text = "";
            Response.Write("<script>alert('Choose Risk Area');</script>");
        }

        protected void TextBox2_TextChanged(object sender, EventArgs e)
        {
            k = 1;
            TextBox3.Text = "";
            Response.Write("<script>alert('Pick A Test');</script>");
            // categoryid = Int32.Parse(ConfigurationManager.AppSettings["categoryid"]);
            TextBox2.Text = y;

        }

        protected void TextBox3_TextChanged(object sender, EventArgs e)
        {
            k = 1;
            TextBox3.Text = z;


            Session["locname"] = TextBox1.Text;
            Session["area"] = TextBox2.Text;

            Session["test"] = TextBox3.Text + " Test";

            Response.Redirect("FilterPage.aspx");
            BindRepeater();
            // testid = Int32.Parse(ConfigurationManager.AppSettings["testid"]);

        }



        private void BindRepeater()
        {
            try
            {
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                string location = Session["locname"].ToString();
                string category = Session["area"].ToString();
                test = Session["test"].ToString();
                test = test.TrimEnd('t');
                test = test.TrimEnd('s');
                test = test.TrimEnd('e');
                test = test.TrimEnd('T');
                test = test.TrimEnd(' ');
                Session["filter"] = 1;


            }
            catch (System.ArgumentNullException)
            {

            }



            if (id != 0)
            {

                try
                {




                    string constr = "select unique l.lab_name,lt.amount,loca.location_name,loc.address from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca,risk_areas ra,test_risk tr where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and t.test_id=tr.test_id and tr.risk_area_id=ra.risk_area_id and ra.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + test + "' and loca.location_name = '" + Session["locname"].ToString() + "'";

                    //string constr = "select la.lab_name, lt.amount, ltl.address from labs la,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,tests t,locations l where ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + Session["locname"].ToString() + "' and r.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + Session["test"].ToString() + "' and la.lab_id = lt.lab_id";
                    rptEmployees.DataSource = _dbHelper.ExecuteDataTable(constr);
                    rptEmployees.DataBind();


                }

                catch (Exception e)
                {
                    Response.Write("<script>alert('No Labs Found!!');</script>");
                }
            }
            else
            {
                try
                {
                    string constr = "select unique l.lab_name,lt.amount,loca.location_name,loc.address from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca,risk_areas ra,test_risk tr where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and t.test_id=tr.test_id and tr.risk_area_id=ra.risk_area_id and ra.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + test + "' and loca.location_name = '" + Session["locname"].ToString() + "'";
                    //string constr = "select la.lab_name, lt.amount, ltl.address from labs la,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,tests t,locations l where ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + Session["locname"].ToString() + "' and r.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + Session["test"].ToString() + "' and la.lab_id = lt.lab_id";


                    rptEmployees.DataSource = _dbHelper.ExecuteDataTable(constr);
                    rptEmployees.DataBind();

                }
                catch (Exception e)
                {
                    Response.Write("<script>alert('No Labs Found!!');</script>");
                }

            }
        }


        protected void Repeater1_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            farzi = "dsf";
            // farz1 = "dsf";
        }

        protected void Repeater1_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "link")
            {
                Button btn1 = (Button)e.Item.FindControl("btn0");

                //Image img = (Image)e.Item.FindControl("ImageButton1");
                Label lbl1 = (Label)e.Item.FindControl("Label1");
                Label lbl2 = (Label)e.Item.FindControl("Label4");
                Label lbl3 = (Label)e.Item.FindControl("Label2");
                Label lbl4 = (Label)e.Item.FindControl("Label3");
                



                Session["labname"] = lbl1.Text;
                Session["amnt"] = lbl2.Text;
                Session["loca"] = lbl4.Text;
                Session["address"] = lbl2.Text;
                Response.Redirect("testdetails.aspx");

            }

            if (e.CommandName == "link2")
            {
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                if (id == 0)
                    Response.Write("<script>alert('Please Login To Book Test!');</script>");
                else
                {
                    Button btn1 = (Button)e.Item.FindControl("btn1");

                    //Image img = (Image)e.Item.FindControl("ImageButton1");
                    Label lbl1 = (Label)e.Item.FindControl("Label1");
                    Label lbl2 = (Label)e.Item.FindControl("Label4");
                    Label lbl3 = (Label)e.Item.FindControl("Label2");
                    Label lbl4 = (Label)e.Item.FindControl("Label3");



                    Session["labname"] = lbl1.Text;
                    Session["amnt"] = lbl2.Text;
                    Session["address"] = lbl3.Text;
                    Session["loca"] = lbl4.Text;
                    Response.Redirect("patientbook.aspx");
                }
            }

        }




        protected void btn0_Click(object sender, EventArgs e)
        {

        }

        protected void btn1_Click(object sender, EventArgs e)
        {

        }

        protected void DropDownList1_SelectedIndexChanged(object sender, EventArgs e)
        {
            string dd = DropDownList1.SelectedValue.ToString();
            if (dd == "1")
            {



                try
                {
                    id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                    string location = Session["locname"].ToString();
                    string category = Session["area"].ToString();
                    test = Session["test"].ToString();
                    test = test.TrimEnd('t');
                    test = test.TrimEnd('s');
                    test = test.TrimEnd('e');
                    test = test.TrimEnd('T');
                    test = test.TrimEnd(' ');
                    Session["filter"] = 1;


                }
                catch (System.ArgumentNullException)
                {

                }



                if (id != 0)
                {



                    try
                    {

                        string constr = "select unique l.lab_name,lt.amount,loca.location_name,loc.address from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca,risk_areas ra,test_risk tr where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and t.test_id=tr.test_id and tr.risk_area_id=ra.risk_area_id and ra.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + test + "' and loca.location_name = '" + Session["locname"].ToString() + "' order by lt.amount asc";

                        //string constr = "select la.lab_name, lt.amount, ltl.address from labs la,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,tests t,locations l where ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + Session["locname"].ToString() + "' and r.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + Session["test"].ToString() + "' and la.lab_id = lt.lab_id";
                        rptEmployees.DataSource = _dbHelper.ExecuteDataTable(constr);
                        rptEmployees.DataBind();
                    }

                    catch (Exception ed)
                    {

                    }


                }
                else
                {
                    try
                    {
                        string constr = "select unique l.lab_name,lt.amount,loca.location_name,loc.address from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca,risk_areas ra,test_risk tr where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and t.test_id=tr.test_id and tr.risk_area_id=ra.risk_area_id and ra.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + test + "' and loca.location_name = '" + Session["locname"].ToString() + "' order by lt.amount asc";
                        //string constr = "select la.lab_name, lt.amount, ltl.address from labs la,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,tests t,locations l where ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + Session["locname"].ToString() + "' and r.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + Session["test"].ToString() + "' and la.lab_id = lt.lab_id";


                        rptEmployees.DataSource = _dbHelper.ExecuteDataTable(constr);
                        rptEmployees.DataBind();

                    }
                    catch (Exception ed)
                    {
                        Response.Write("<script>alert('No Labs Found!!');</script>");
                    }

                }



            }
            else if (dd == "2")
            {



                try
                {
                    id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                    string location = Session["locname"].ToString();
                    string category = Session["area"].ToString();
                    test = Session["test"].ToString();
                    test = test.TrimEnd('t');
                    test = test.TrimEnd('s');
                    test = test.TrimEnd('e');
                    test = test.TrimEnd('T');
                    test = test.TrimEnd(' ');
                    Session["filter"] = 1;


                }
                catch (System.ArgumentNullException)
                {

                }



                if (id != 0)
                {

                    try
                    {




                        string constr = "select unique l.lab_name,lt.amount,loca.location_name,loc.address from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca,risk_areas ra,test_risk tr where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and t.test_id=tr.test_id and tr.risk_area_id=ra.risk_area_id and ra.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + test + "' and loca.location_name = '" + Session["locname"].ToString() + "' order by lt.amount desc";

                        //string constr = "select la.lab_name, lt.amount, ltl.address from labs la,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,tests t,locations l where ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + Session["locname"].ToString() + "' and r.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + Session["test"].ToString() + "' and la.lab_id = lt.lab_id";
                        rptEmployees.DataSource = _dbHelper.ExecuteDataTable(constr);
                        rptEmployees.DataBind();


                    }

                    catch (Exception ed)
                    {
                        Response.Write("<script>alert('No Labs Found!!');</script>");
                    }
                }
                else
                {
                    try
                    {
                        string constr = "select unique l.lab_name,lt.amount,loca.location_name,loc.address from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca,risk_areas ra,test_risk tr where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and t.test_id=tr.test_id and tr.risk_area_id=ra.risk_area_id and ra.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + test + "' and loca.location_name = '" + Session["locname"].ToString() + "' order by lt.amount desc";
                        //string constr = "select la.lab_name, lt.amount, ltl.address from labs la,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,tests t,locations l where ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + Session["locname"].ToString() + "' and r.risk_area_name='" + Session["area"].ToString() + "' and t.test_name = '" + Session["test"].ToString() + "' and la.lab_id = lt.lab_id";


                        rptEmployees.DataSource = _dbHelper.ExecuteDataTable(constr);
                        rptEmployees.DataBind();

                    }
                    catch (Exception ed)
                    {
                        Response.Write("<script>alert('No Labs Found!!');</script>");
                    }

                }



            }
        }





    }



}