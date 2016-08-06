using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DALC4NET;
using System.Configuration;
using System.Data;

namespace CheckUp
{
    public partial class AccountSettings : System.Web.UI.Page
    {
        protected DBHelper _dbHelper = DBHelper.GetInstance();
        int id = 0;






        //protected void UserNames_OnItemDataBound(object sender, RepeaterItemEventArgs e)
        //{
        //    TextBox textbox1 = e.Item.FindControl("TextBox1") as TextBox;
        //    TextBox textbox2 = e.Item.FindControl("TextBox2") as TextBox;
        //    TextBox textbox3 = e.Item.FindControl("TextBox3") as TextBox;
        //    TextBox textbox4 = e.Item.FindControl("TextBox4") as TextBox;
        //    TextBox textbox5 = e.Item.FindControl("TextBox5") as TextBox;
        //}
        
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                this.BindRepeater();
                // databinding code here
            }
           
            //rptAccordian.ItemDataBound += new RepeaterItemEventHandler(UserNames_OnItemDataBound);
            //rptAccordian.DataSource = new int[3];
            //rptAccordian.DataBind();

        }

       
       

        //protected void update_mobile(object sender, EventArgs e)
        //{
        //    string query = "UPDATE users SET mobile = '" + Textbox4.Text + "' WHERE username = '" + Session["user"].ToString() + "'";
        //    _dbHelper.ExecuteScalar(query);
        //}

        //protected void update_password(object sender, EventArgs e)
        //{
        //     string query = "select password from users where username = '"+Session["user"].ToString()+"'";
        //    _dbHelper.ExecuteScalar(query);
        //    if(Textbox1.Text == query && Textbox2.Text == Textbox3.Text)
        //    {
        //        string query1 = "UPDATE users SET password = '" + TextBox2.Text + "' WHERE email = '" + Session["email"].ToString() + "'";
        //        _dbHelper.ExecuteScalar(query1);
        //    }
        //}

        //protected void update_name(object sender, EventArgs e)
        //{
        //    string query = "UPDATE users SET name = '" + TextBox5.Text + "' WHERE email = '" + Session["email"].ToString() + "'";
        //    _dbHelper.ExecuteScalar(query);
        //}

       

       
        private void BindRepeater()
        {
            try
            {
                id = 1;

            }
            catch (System.ArgumentNullException)
            {

            }



            if (_dbHelper.ExecuteScalar("select location_name from locations").ToString() == "1")
            {
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                string constr = "select name from users where user_id" + id;

                rptAccordian.DataSource = _dbHelper.ExecuteDataTable(constr);
                rptAccordian.DataBind();

               
            }
            else
            {

                string constr = "select location_name from locations where location_name='Faridabad'";

                rptAccordian.DataSource = _dbHelper.ExecuteDataTable(constr);
                rptAccordian.DataBind();

            }
        }

        
        protected void Update_Name(object sender, EventArgs e)
        {
          
          
            foreach (RepeaterItem item in rptAccordian.Items)
            {
                
                TextBox txtname = item.FindControl("TextBox5") as TextBox;
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                string s = txtname.Text;
                //string ss = Session["email"].ToString();
                int f = id;
                if (txtname != null)
                {
                    string query = "UPDATE users SET name = '" + s + "' WHERE user_id = " + id;
                    _dbHelper.ExecuteScalar(query);
                }

            }
        }


        protected void Update_Password(object sender, EventArgs e)
        {

            foreach (RepeaterItem item in rptAccordian.Items)
            {

                TextBox txtname1 = item.FindControl("TextBox1") as TextBox;
                TextBox txtname2 = item.FindControl("TextBox2") as TextBox;
                TextBox txtname3 = item.FindControl("TextBox3") as TextBox;
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                string query = "select password from users where user_id = " + id;
                DataTable dt = _dbHelper.ExecuteDataTable(query);

                    //_dbHelper.ExecuteScalar(query);

                    if(txtname1.Text == dt.Rows[0][0].ToString() && txtname2.Text == txtname3.Text && txtname2.Text.Length>=6)
                    {
                        string query1 = "UPDATE users SET password = '" + txtname2.Text + "' WHERE user_id = " + id;
                        _dbHelper.ExecuteScalar(query1);
                    }




                //TextBox txtname = item.FindControl("TextBox5") as TextBox;
                //id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
                //string s = txtname.Text;
                //if (txtname != null)
                //{
                //    string query = "UPDATE users SET name = '" + s + "' WHERE user_id = " + id;
                //    _dbHelper.ExecuteScalar(query);
                //}

            }
        }



        protected void Update_Mobile(object sender, EventArgs e)
        {

            foreach (RepeaterItem item in rptAccordian.Items)
            {

                //string query = "UPDATE users SET mobile = '" + Textbox4.Text + "' WHERE username = '" + Session["user"].ToString() + "'";
                ////    _dbHelper.ExecuteScalar(query);



                TextBox txtname = item.FindControl("TextBox4") as TextBox;
                id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
              
                if (txtname != null)
                {
                    string query = "UPDATE users SET mobile = '" + txtname.Text + "' WHERE user_id = " + id;
                    _dbHelper.ExecuteScalar(query);

                }

            }
        }

      
    }
}





//id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);




//            int user_id = 0;
//            string query = "Select USER_ID from USERS where USERNAME = '" + txtUserName.Text + "' AND PASSWORD = '" + txtPassword.Text + "'";
//            if (_dbHelper.ExecuteScalar(query) != null)
//            {
//                user_id = Int32.Parse(_dbHelper.ExecuteScalar(query).ToString());
//                ConfigurationManager.AppSettings["userid"] = user_id.ToString();
//}