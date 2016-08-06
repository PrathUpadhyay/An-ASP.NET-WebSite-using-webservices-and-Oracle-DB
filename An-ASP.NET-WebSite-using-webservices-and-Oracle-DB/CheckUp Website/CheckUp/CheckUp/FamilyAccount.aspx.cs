using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DALC4NET;
using System.Data;
using System.Data.OracleClient;
using System.Configuration;

namespace CheckUp
{
    public partial class FamilyAccount : System.Web.UI.Page
    {
        int id = 0;
     
        DBHelper _dbHelper = DBHelper.GetInstance();
        public static String farzi = "fz";
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindRepeater();

                // databinding code here
            }
           
        }


        private void BindRepeater()
        {
            try
            {
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);

            }
            catch (System.ArgumentNullException)
            {

            }



            if (id != 0)
            {

                try
                {
                    string constr = "SELECT USERS.NAME,USERS.PHOTO,FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2 FROM FAMILY_ACCOUNT_USERS_ADDED, USERS WHERE (FAMILY_ACCOUNT_USERS_ADDED.USER_ID_1 = " + id + " AND USERS.USER_ID=FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2) UNION SELECT USERS.NAME,USERS.PHOTO,FAMILY_ACCOUNT_USERS_ADDED.USER_ID_1 FROM FAMILY_ACCOUNT_USERS_ADDED, USERS WHERE (FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2 = " + id + " AND USERS.USER_ID=FAMILY_ACCOUNT_USERS_ADDED.USER_ID_1)";
                    Repeater1.DataSource = _dbHelper.ExecuteDataTable(constr);
                    Repeater1.DataBind();

                    string constr1 = "SELECT U.PHOTO,U.NAME FROM USERS U,FAMILY_ACCOUNT_USERS_PENDING FAM WHERE FAM.USER_ID_1 = "+id+" AND U.USER_ID=FAM.USER_ID_2";
                    Repeater2.DataSource = _dbHelper.ExecuteDataTable(constr1);
                    Repeater2.DataBind();

                    string constr2 = "SELECT U.PHOTO,U.NAME FROM USERS U,FAMILY_ACCOUNT_USERS_PENDING FAM WHERE FAM.USER_ID_2 = " + id + " AND U.USER_ID=FAM.USER_ID_1";
                    Repeater3.DataSource = _dbHelper.ExecuteDataTable(constr2);
                    Repeater3.DataBind();
                }

                catch (Exception e)
                {

                }
            }
            else
            {

                string constr = "SELECT USERS.NAME,USERS.PHOTO,FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2 FROM FAMILY_ACCOUNT_USERS_ADDED, USERS WHERE (FAMILY_ACCOUNT_USERS_ADDED.USER_ID_1 = " + id + " AND USERS.USER_ID=FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2) UNION SELECT USERS.NAME,USERS.PHOTO,FAMILY_ACCOUNT_USERS_ADDED.USER_ID_1 FROM FAMILY_ACCOUNT_USERS_ADDED, USERS WHERE (FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2 = " + id + " AND USERS.USER_ID=FAMILY_ACCOUNT_USERS_ADDED.USER_ID_1)";
                Repeater1.DataSource = _dbHelper.ExecuteDataTable(constr);
                Repeater1.DataBind();

                string constr1 = "SELECT U.PHOTO,U.NAME FROM USERS U,FAMILY_ACCOUNT_USERS_PENDING FAM WHERE FAM.USER_ID_1 = " + id + " AND U.USER_ID=FAM.USER_ID_2";
                Repeater2.DataSource = _dbHelper.ExecuteDataTable(constr1);
                Repeater2.DataBind();

                string constr2 = "SELECT U.PHOTO,U.NAME FROM USERS U,FAMILY_ACCOUNT_USERS_PENDING FAM WHERE FAM.USER_ID_2 = " + id + " AND U.USER_ID=FAM.USER_ID_1";
                Repeater3.DataSource = _dbHelper.ExecuteDataTable(constr2);
                Repeater3.DataBind();
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
               // Button btn1 = (Button)e.Item.FindControl("Button1");
                ImageButton img = (ImageButton)e.Item.FindControl("ImageButton1");
                //Image img = (Image)e.Item.FindControl("ImageButton1");
               // Label lbl1 = (Label)e.Item.FindControl("Label1");
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
               
                farzi = img.ImageUrl.ToString();
                string query = "select user_id from users where photo = '"+farzi+"'";
                DataTable dt = _dbHelper.ExecuteDataTable(query);
                int i = int.Parse(dt.Rows[0][0].ToString());
                string constr = "DELETE FROM FAMILY_ACCOUNT_USERS_ADDED FAM WHERE FAM.USER_ID_2="+i+" AND FAM.USER_ID_1="+id+"";
                _dbHelper.ExecuteScalar(constr);
                string constr1 = "DELETE FROM FAMILY_ACCOUNT_USERS_ADDED FAM WHERE FAM.USER_ID_2=" + id + " AND FAM.USER_ID_1=" + i + "";
                _dbHelper.ExecuteScalar(constr1);
                Response.Redirect("FamilyAccount.aspx#members");
            }

        }



        protected void Repeater2_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            farzi = "dsf";
            // farz1 = "dsf";
        }

        protected void Repeater2_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "link")
            {
                // Button btn1 = (Button)e.Item.FindControl("Button1");
                ImageButton img = (ImageButton)e.Item.FindControl("ImageButton2");
                //Image img = (Image)e.Item.FindControl("ImageButton1");
                // Label lbl1 = (Label)e.Item.FindControl("Label1");
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);

                farzi = img.ImageUrl.ToString();
                string query = "select user_id from users where photo = '" + farzi + "'";
                DataTable dt = _dbHelper.ExecuteDataTable(query);
                int i = int.Parse(dt.Rows[0][0].ToString());
                string constr = "DELETE FROM FAMILY_ACCOUNT_USERS_PENDING FAM WHERE FAM.USER_ID_2=" + i + " AND FAM.USER_ID_1=" + id + "";
                _dbHelper.ExecuteScalar(constr);
                Response.Redirect("FamilyAccount.aspx#pending");
            }

        }


        protected void Repeater3_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            farzi = "dsf";
            // farz1 = "dsf";
        }

        protected void Repeater3_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "decline")
            {
                // Button btn1 = (Button)e.Item.FindControl("Button1");
                ImageButton img = (ImageButton)e.Item.FindControl("ImageButton3");
                //Image img = (Image)e.Item.FindControl("ImageButton1");
                // Label lbl1 = (Label)e.Item.FindControl("Label1");
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);

                farzi = img.ImageUrl.ToString();
                string query = "select user_id from users where photo = '" + farzi + "'";
                DataTable dt = _dbHelper.ExecuteDataTable(query);
                int i = int.Parse(dt.Rows[0][0].ToString());
                string constr = "DELETE FROM FAMILY_ACCOUNT_USERS_PENDING FAM WHERE FAM.USER_ID_1=" + i + " AND FAM.USER_ID_2=" + id + "";
                _dbHelper.ExecuteScalar(constr);
                Response.Redirect("FamilyAccount.aspx#members");
            }

            if (e.CommandName == "accept")
            {
                // Button btn1 = (Button)e.Item.FindControl("Button1");
                ImageButton img = (ImageButton)e.Item.FindControl("ImageButton3");
                //Image img = (Image)e.Item.FindControl("ImageButton1");
                // Label lbl1 = (Label)e.Item.FindControl("Label1");
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);

                farzi = img.ImageUrl.ToString();
                string query = "select user_id from users where photo = '" + farzi + "'";
                DataTable dt = _dbHelper.ExecuteDataTable(query);
                int i = int.Parse(dt.Rows[0][0].ToString());
                string constr = "INSERT INTO FAMILY_ACCOUNT_USERS_ADDED VALUES(FAM_ADDED_IN.NEXTVAL,"+i+","+id+")";
                _dbHelper.ExecuteScalar(constr);
                string constr1 = "DELETE FROM FAMILY_ACCOUNT_USERS_PENDING FAM WHERE FAM.USER_ID_1=" + i + " AND FAM.USER_ID_2=" + id + "";
                _dbHelper.ExecuteScalar(constr1);
                Response.Redirect("FamilyAccount.aspx#members");
            }


        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            String farzi2 = farzi;
            String farzi3 = farzi2;
        }







        //private void BindGridView()
        //{

        //    try
        //    {
        //        id = 1;

        //    }
        //    catch (System.ArgumentNullException)
        //    {

        //    }



           
            //if (_dbHelper.ExecuteScalar("select username from users").ToString() == "1")
            //{ 
            //id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
            //    SqlDataSource1.SelectCommand = "SELECT USERS.NAME,USERS.PHOTO,FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2 FROM FAMILY_ACCOUNT_USERS_ADDED, USERS WHERE FAMILY_ACCOUNT_USERS_ADDED.USER_ID_1 = " + id + " AND USERS.USER_ID=FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2";

            //}
            //else
            //{

            //    id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
            //    SqlDataSource1.SelectCommand = "SELECT USERS.NAME,USERS.PHOTO,FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2 FROM FAMILY_ACCOUNT_USERS_ADDED, USERS WHERE FAMILY_ACCOUNT_USERS_ADDED.USER_ID_1 = " + id + " AND USERS.USER_ID=FAMILY_ACCOUNT_USERS_ADDED.USER_ID_2";
         
            //}
        //}




        [System.Web.Services.WebMethodAttribute(), System.Web.Script.Services.ScriptMethodAttribute()]
        public static string[] GetCompletionList(string prefixText, int count, string contextKey)
        {
            OracleConnection con = new OracleConnection("Data Source=ORCL;User Id=checkup;Password=checkup; Integrated Security=NO");
            con.Open();
            string s = @prefixText + "%";
            //string mysql = "select dname from d where dname like :s";

            string mysql = "select username from users where username like :s";
            OracleDataAdapter da = new OracleDataAdapter(mysql, con);

            da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                members.SetValue(dr["username"].ToString(), i);
                //members.SetValue(dr["dname"].ToString(), i);
                i++;
            }
            return members;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            String farzi2 = farzi;
            String farzi3 = farzi2;
        }

        protected void Button3_Click(object sender, EventArgs e)
        {
           
            string query = "select user_id from users where username = '"+TextBox1.Text+"'";
            if (_dbHelper.ExecuteScalar(query) == null)
            {
                TextBox1.Text = "";
                TextBox1.Attributes["placeholder"] = "User not exist!";

           
                //TextBox1.Text = "User not exist!";
                
            }
            else
            {
                DataTable dt = _dbHelper.ExecuteDataTable(query);
                int to_add = int.Parse(dt.Rows[0][0].ToString());
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                
                string query2 = "select user_id_1,user_id_2 from family_account_users_added where user_id_1 = " + to_add + " and user_id_2 = " + id + "";
                if (to_add == id)
                {
                    int c = 1;
                }
                else if (_dbHelper.ExecuteScalar(query2) == null)
                {
                    string query3 = "select user_id_1,user_id_2 from family_account_users_added where user_id_2 = " + to_add + " and user_id_1 = " + id + "";
                    if (_dbHelper.ExecuteScalar(query3) == null)
                    {
                         string query5 = "select user_id_1,user_id_2 from family_account_users_pending where user_id_2 = " + to_add + " and user_id_1 = " + id + "";
                         if(_dbHelper.ExecuteScalar(query5) == null)
                         {
                              string query6 = "select user_id_1,user_id_2 from family_account_users_pending where user_id_1 = " + to_add + " and user_id_2 = " + id + "";
                         if(_dbHelper.ExecuteScalar(query6) == null)
                         {
                             string query4 = "insert into family_account_users_pending values(fam_pending_in.nextval," + id + "," + to_add + ")";
                             _dbHelper.ExecuteScalar(query4);
                             BindRepeater();
                             Response.Redirect("FamilyAccount.aspx#pending");
                         }
                         }
                       
                    }
                    else
                    {
                        TextBox1.Text = "";
                        TextBox1.Attributes["placeholder"] = "Members already!";
                        
                        //TextBox1.Text = "Members already!";
                       

                    }
                }
                else
                {
                    TextBox1.Text = "";
                    TextBox1.Attributes["placeholder"] = "Members already!";
                   // TextBox1.Text = "Members already!";
                   
                }
            }
           
            
        }

     
    }
}