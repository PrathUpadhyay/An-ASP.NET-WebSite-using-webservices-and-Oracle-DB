using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DALC4NET;

namespace CheckUp
{
    public partial class patientbook : System.Web.UI.Page
    {
        protected DBHelper _dbHelper = DBHelper.GetInstance();
        int id = 0;
        int y;
        public int k;
        static int flag = 0;
        static String farzi_price;
        protected void Page_Load(object sender, EventArgs e)
        {

            if(flag==0)
            {
                farzi_price = Session["amnt"].ToString();
                flag++;
            }

            if (y != 1)
                Label3.Visible = false;

            Page.DataBind(); 
            id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);

            string query = "select * from users where user_id = " + id;

            DataTable dt = _dbHelper.ExecuteDataTable(query);

            TextBox1.Text = dt.Rows[0][1].ToString();
            TextBox2.Text = dt.Rows[0][4].ToString();

            TextBox3.Text = dt.Rows[0][5].ToString();
          
            if(Session["filter"] == null && id != 0)

            {
                testname.Text = Session["test"].ToString();
                price.Text = farzi_price;
                Label2.Text = Session["labname"].ToString();
                address.Text = Session["address"].ToString();
                Label1.Text = "Noida";
            }
            else if(Session["filter"] != null && id!=0)
            {
                testname.Text = Session["test"].ToString();
                price.Text = farzi_price;
                Label2.Text = Session["labname"].ToString();
                address.Text = Session["address"].ToString();
                Label1.Text = Session["loca"].ToString();
            }

            if (k == 1)
                family.Checked = true;

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
   
            string date = TextBox4.Text;
            if(family.Checked)
            {
                string q1 = "select count(user_id_2) from family_account_users_added fam where user_id_1 = " + id + "";
                int i = Int32.Parse(_dbHelper.ExecuteScalar(q1).ToString());
                string q2 = "select count(user_id_1) from family_account_users_added fam where user_id_2 = " + id + "";
                int f = Int32.Parse(_dbHelper.ExecuteScalar(q2).ToString());
                if(i == 0 && f == 0)
                {
                    Label3.Visible = true;
                    y = 1;
                }
                else
                {
                    if (date == "")
                        Response.Write("<script>alert('Please Enter date of booking!');</script>");
                    else
                    { 
                    string query1 = "select ltl.lab_tests_locations_id from lab_tests_locations ltl,lab_tests lt,labs l where l.lab_name = '" + Label2.Text + "' and l.lab_id=lt.lab_id and lt.lab_test_id=ltl.lab_test_id and ltl.address = '" + address.Text + "'";
                    DataTable dt = _dbHelper.ExecuteDataTable(query1);
                    int labid = int.Parse(dt.Rows[0][0].ToString());
                    string query = "insert into orders values(order_in.nextval," + labid + ",to_date('" + date + "','yyyy-mm-dd')," + id + ",'" + TextBox3.Text + "')";
                    _dbHelper.ExecuteScalar(query);
                    string query2 = "select user_id_2 from family_account_users_added fam where user_id_1 = " + id + "";
                    DataTable dt2 = _dbHelper.ExecuteDataTable(query2);
                    string query3 = "select count(user_id_2) from family_account_users_added fam where user_id_1 = " + id + "";
                    int m = Int32.Parse(_dbHelper.ExecuteScalar(query3).ToString());
                    if(m == 0)
                    {
                        Label3.Visible = true;
                        y = 1;
                    }
                    else if(m != 0)
                    { 
                    for (int j = 0; j < m; j++)
                    {
                        int k = int.Parse(dt2.Rows[j][0].ToString());
                        string query4 = "insert into orders values(order_in.nextval," + labid + ",to_date('" + date + "','yyyy-mm-dd')," + k + ",'" + TextBox3.Text + "')";
                        _dbHelper.ExecuteScalar(query4);
                    }
                    }
                    string query5 = "select user_id_1 from family_account_users_added fam where user_id_2 = " + id + "";
                    DataTable dt3 = _dbHelper.ExecuteDataTable(query5);
                    string query6 = "select count(user_id_1) from family_account_users_added fam where user_id_2 = " + id + "";
                    int n = Int32.Parse(_dbHelper.ExecuteScalar(query6).ToString());
                   if(n == 0)
                   {
                       Label3.Visible = true;
                       y = 1;
                   }
                   else if(n != 0)
                   { 
                    for (int j = 0; j < n; j++)
                    {
                        int k = int.Parse(dt3.Rows[j][0].ToString());
                        string query4 = "insert into orders values(order_in.nextval," + labid + ",to_date('" + date + "','yyyy-mm-dd')," + k + ",'" + TextBox3.Text + "')";
                        _dbHelper.ExecuteScalar(query4);
                    }
                   }
                    Response.Redirect("MyOrders.aspx");
                }
                }
            }
            else
            {
                if (date == "")
                    Response.Write("<script>alert('Please Enter date of booking!');</script>");
                else
                {
                    string query1 = "select ltl.lab_tests_locations_id from lab_tests_locations ltl,lab_tests lt,labs l where l.lab_name = '" + Label2.Text + "' and l.lab_id=lt.lab_id and lt.lab_test_id=ltl.lab_test_id and ltl.address = '" + address.Text + "'";
                    DataTable dt = _dbHelper.ExecuteDataTable(query1);
                    int labid = int.Parse(dt.Rows[0][0].ToString());
                    string query = "insert into orders values(order_in.nextval," + labid + ",to_date('" + date + "','yyyy-mm-dd')," + id + ",'" + TextBox3.Text + "')";
                    _dbHelper.ExecuteScalar(query);
                    Response.Redirect("MyOrders.aspx");
                }
            }
        }

        protected void family_CheckedChanged(object sender, EventArgs e)
        {
            if(family.Checked)
            {
                k = 1;
                 string q1 = "select count(user_id_2) from family_account_users_added fam where user_id_1 = " + id + "";
                int i = Int32.Parse(_dbHelper.ExecuteScalar(q1).ToString());
                string q2 = "select count(user_id_1) from family_account_users_added fam where user_id_2 = " + id + "";
                int f = Int32.Parse(_dbHelper.ExecuteScalar(q2).ToString());

if(i==0 && f==0)
{
Label3.Visible=true;
}

else{
                Session["amnt"] = Session["amnt"].ToString().TrimStart('R');
                Session["amnt"] = Session["amnt"].ToString().TrimStart('s');
                Session["amnt"] = Session["amnt"].ToString().TrimStart(' ');
                Session["amnt"] = Session["amnt"].ToString().TrimEnd('-');
                Session["amnt"] = Session["amnt"].ToString().TrimEnd('/');
                Session["amnt"] = int.Parse(Session["amnt"].ToString()) * (i+1 + f);
                Session["amnt"] = "Rs " + Session["amnt"] + "/-";
                Label5.Text = Session["amnt"].ToString();
                Label5.Visible = true;
                Label4.Visible = true;
}
            }
            else
            {
                k = 0;
                string q1 = "select count(user_id_2) from family_account_users_added fam where user_id_1 = " + id + "";
                int i = Int32.Parse(_dbHelper.ExecuteScalar(q1).ToString());
                string q2 = "select count(user_id_1) from family_account_users_added fam where user_id_2 = " + id + "";
                int f = Int32.Parse(_dbHelper.ExecuteScalar(q2).ToString());
                Session["amnt"] = Session["amnt"].ToString().TrimStart('R');
                Session["amnt"] = Session["amnt"].ToString().TrimStart('s');
                Session["amnt"] = Session["amnt"].ToString().TrimStart(' ');
                Session["amnt"] = Session["amnt"].ToString().TrimEnd('-');
                Session["amnt"] = Session["amnt"].ToString().TrimEnd('/');
                Session["amnt"] = int.Parse(Session["amnt"].ToString())/(i+1+f);
                Session["amnt"] = "Rs " + Session["amnt"] + "/-";
                Label5.Text = Session["amnt"].ToString();
                Label4.Visible = false;
                Label5.Visible = false;
            }
        }
      
      
    }
}