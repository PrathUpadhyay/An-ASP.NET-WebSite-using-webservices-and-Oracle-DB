using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.OracleClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DALC4NET;

namespace CheckUp
{
    public partial class testdetails : System.Web.UI.Page
    {
        protected DBHelper _dbHelper = DBHelper.GetInstance();
        Random generator = new Random();
        
        int id = 0;
       public int i, s, op, r, c,f,y=0;
        string fam;
         
        public static string t;
       
        protected void Page_Load(object sender, EventArgs e)
        {
          
            Session["details"] = "sdsc";
            OracleConnection con = new OracleConnection("Data Source=ORCL;User Id=checkup;Password=checkup; Integrated Security=NO");
            con.Open();
            DataTable dt = new DataTable();
            r = generator.Next(70, 250);
            if (Session["filter"] == null)
            {


                Label3.Text = Session["test"].ToString();
                t = Session["test"].ToString().TrimEnd('t');
                t = t.TrimEnd('s');
                t = t.TrimEnd('e');
                t = t.TrimEnd('T');
                t = t.TrimEnd(' ');
                Session["filter"] = null;
                string query = "select unique loc.address,t.details from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and l.lab_name='" + Session["labname"].ToString() + "' and t.test_name = '" + t + "' and loca.location_name = 'Noida'";
                OracleDataAdapter da = new OracleDataAdapter(query, con);
               
                da.Fill(dt);
            }

            else
            {
                Label3.Text = Session["test"].ToString();
                t = Session["test"].ToString().TrimEnd('t');
                t = t.TrimEnd('s');
                t = t.TrimEnd('e');
                t = t.TrimEnd('T');
                t = t.TrimEnd(' ');
               
                 string query = "select unique loc.address,t.details from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and l.lab_name='" + Session["labname"].ToString() + "' and t.test_name = '" + t + "' and loca.location_name = '"+Session["loca"].ToString()+"'";
                 OracleDataAdapter da = new OracleDataAdapter(query, con);
               
                 da.Fill(dt);
            }
           

             string[] addres = new string[dt.Rows.Count];
            string[] detail = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {

                addres.SetValue(dr["address"].ToString(), i);
                detail.SetValue(dr["details"].ToString(), i);
                i++;
            }


            labelname1.Text = detail[0];
            newprice.Text = Session["amnt"].ToString();
            r = generator.Next(70, 250);

            newprice.Text = newprice.Text.TrimStart('R');
            newprice.Text = newprice.Text.TrimStart('s');
            newprice.Text = newprice.Text.TrimStart(' ');
            newprice.Text = newprice.Text.TrimEnd('-');
            newprice.Text = newprice.Text.TrimEnd('/');
            op = int.Parse(newprice.Text) + r;
            originalprice.Text = op.ToString();
            s = op - int.Parse(newprice.Text);
            Label2.Text = "" + s;
            label1.Text = Session["labname"].ToString();
            Label5.Text = "Latest Advances in "+ Session["test"].ToString() +" at "+ Session["labname"].ToString() +" & The Power of Personal Genomics in influencing Healthcare";
            Label6.Text = addres[0];
            //Label5.Text = ;
            Session["address"] = addres[0];


            //if (y == 1)
            //    family.Checked = true;

        //    if(!IsPostBack)
        //    {



        //        id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
        //    if (id != 0)
        //    {
        //        if (family.Checked)
        //        {
        //            string q1 = "select count(user_id_2) from family_account_users_added fam where user_id_1 = " + id + "";
        //             i = Int32.Parse(_dbHelper.ExecuteScalar(q1).ToString());
        //            string q2 = "select count(user_id_1) from family_account_users_added fam where user_id_2 = " + id + "";
        //             f = Int32.Parse(_dbHelper.ExecuteScalar(q2).ToString());
        //            if (i == 0 && f == 0)
        //            {
        //                Label3.Visible = true;
        //                Response.Redirect("testdetails.aspx");
        //                y = 1;
        //            }
        //            else
        //            {
        //                y = 1;
        //                 c = i + f;
        //                 Session["amnt"] = Session["amnt"].ToString().TrimStart('R');
        //                 Session["amnt"] = Session["amnt"].ToString().TrimStart('s');
        //                 Session["amnt"] = Session["amnt"].ToString().TrimStart(' ');
        //                 Session["amnt"] = Session["amnt"].ToString().TrimEnd('-');
        //                 Session["amnt"] = Session["amnt"].ToString().TrimEnd('/');
                       
        //                Session["amnt"] = int.Parse(Session["amnt"].ToString()) * c;
        //                Session["amnt"] = "Rs " + Session["amnt"] + "/-";
        //                r = generator.Next(70, 250);
        //                newprice.Text = Session["amnt"].ToString();
        //                newprice.Text = newprice.Text.TrimStart('R');
        //                newprice.Text = newprice.Text.TrimStart('s');
        //                newprice.Text = newprice.Text.TrimStart(' ');
        //                newprice.Text = newprice.Text.TrimEnd('-');
        //                newprice.Text = newprice.Text.TrimEnd('/');
        //                 op = int.Parse(newprice.Text) + r*c;
        //                originalprice.Text = op.ToString();
        //                 s = op - int.Parse(newprice.Text);
        //                Label2.Text = "" + s;
        //                Response.Redirect("testdetails.aspx");
        //            }
        //        }
        //    }

        //}

        }

        protected void booktest(object sender, EventArgs e)
        {
            id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
            if (id != 0)
                Response.Redirect("patientbook.aspx");
            else
                Response.Write("<script>alert('Please Login To Book A Test');</script>");

        }

        //protected void family_CheckedChanged(object sender, EventArgs e)
        //{
        //    id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
        //    if (id != 0)
        //    {
        //        if (family.Checked)
        //        {
        //            string q1 = "select count(user_id_2) from family_account_users_added fam where user_id_1 = " + id + "";
        //            i = Int32.Parse(_dbHelper.ExecuteScalar(q1).ToString());
        //            string q2 = "select count(user_id_1) from family_account_users_added fam where user_id_2 = " + id + "";
        //            f = Int32.Parse(_dbHelper.ExecuteScalar(q2).ToString());
        //            if (i == 0 && f == 0)
        //            {
        //                Label3.Visible = true;
        //                Response.Redirect("testdetails.aspx");
        //                y = 1;
        //            }
        //            else
        //            {
        //                y = 1;
        //                c = i + f;
        //                Session["amnt"] = Session["amnt"].ToString().TrimStart('R');
        //                Session["amnt"] = Session["amnt"].ToString().TrimStart('s');
        //                Session["amnt"] = Session["amnt"].ToString().TrimStart(' ');
        //                Session["amnt"] = Session["amnt"].ToString().TrimEnd('-');
        //                Session["amnt"] = Session["amnt"].ToString().TrimEnd('/');

        //                Session["amnt"] = int.Parse(Session["amnt"].ToString()) * c;
        //                Session["amnt"] = "Rs " + Session["amnt"] + "/-";
        //                //r = generator.Next(70, 250);
        //                newprice.Text = Session["amnt"].ToString();
        //                newprice.Text = newprice.Text.TrimStart('R');
        //                newprice.Text = newprice.Text.TrimStart('s');
        //                newprice.Text = newprice.Text.TrimStart(' ');
        //                newprice.Text = newprice.Text.TrimEnd('-');
        //                newprice.Text = newprice.Text.TrimEnd('/');
        //                op = int.Parse(newprice.Text) + r*c;
                        
        //                originalprice.Text = op.ToString();
        //                s = op - int.Parse(newprice.Text);
        //                Label2.Text = "" + s;
        //                Response.Redirect("testdetails.aspx");
        //            }
        //        }
        //    }
        //}



       
    }
}