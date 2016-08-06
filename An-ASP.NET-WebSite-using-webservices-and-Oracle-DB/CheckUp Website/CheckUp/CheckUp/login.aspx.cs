using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DALC4NET;
using System.Data;
using System.Diagnostics;
using System.Configuration;

namespace CheckUp
{
    public partial class login : System.Web.UI.Page
    {
        protected DBHelper _dbHelper = DBHelper.GetInstance();
        public int temp = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            Label1.Visible = false;
            Label3.Visible = false;
            if (Session["user"] != null)
                Response.Redirect("Default.aspx");
           
            //if (!IsPostBack)
            //{

            //    Response.Redirect("login.aspx#toregister");
               
            //}

           
           
        }

      
        public void check()
        {
            try
            {


                string query = "select * from users";

              DataTable dt= _dbHelper.ExecuteDataTable(query);


              string query2 = "select count(*) from users";
              int i = Int32.Parse(_dbHelper.ExecuteScalar(query2).ToString());

              for (int j = 0; j < i;j++ )
              {

                  if (usignup.Text == dt.Rows[j][2].ToString())
                  {
                      temp = 1;
                  }
                  if (psignup.Text != psignup_confirm.Text)
                  {
                      temp = 2;
                      break;
                  }
                  if (usignup.Text == "" || psignup.Text == "" || esignup.Text == "")
                  {
                      temp = 3;
                      break;
                  }
                  if(psignup.Text.Length<6)
                  {
                      temp = 4;
                      break;
                  }
                  if(esignup.Text == dt.Rows[j][4].ToString())
                  {
                      temp = 5;
                  }

              }
             



              //  con.Close();
            }
            catch (Exception ww)
            {

            }
        }




        protected void create_Click(object sender, EventArgs e)
        {
            try
            {
                check();


                if (temp == 0)
                {
                    Label3.Text = "Registration Successful! Please Login";
                    Label3.Visible = true;
                    Label3.BackColor = System.Drawing.Color.Green;
                    string query = "insert into users values(auto_in.nextval,'" + TextBox1.Text + "','" + usignup.Text + "','" + psignup.Text + "','" + esignup.Text + "','','~//img//user_default.png')";
                    _dbHelper.ExecuteScalar(query).ToString();
                    //Response.Redirect("Default.aspx");
                   
                    //Response.Write("<script>alert('Successfully usersed!')</script>");
                 

                }
                else if (temp == 1)
                {
                    Label3.Text = "User already Exists!";
                    Label3.Visible = true;

                }
                else if (temp == 2)
                {
                    Label3.Text = "Passwords Don't Match";
                    Label3.Visible = true;
                }
                else if (temp == 3)
                {
                    Label3.Text = "Enter info correctly!";
                    Label3.Visible = true;
                }
                else if (temp == 4)
                {
                    Label3.Text = "Password too small, must be minimum of length 6 or more!";
                    Label3.Visible = true;
                }
                else if (temp == 5)
                {
                    Label3.Text = "Email id already registered!";
                    Label3.Visible = true;
                }

            }
            catch (Exception ww)
            {
                Response.Write(ww.Message.ToString());
            }
        }

        protected void signin_Click(object sender, EventArgs e)
        {
            try
            {
                
                string query = "select username from users where password='"+pword.Text+"' and username='"+uname.Text+"'";

                int user_id = 0;
                            string query1 = "Select USER_ID from USERS where USERNAME = '" + uname.Text + "' AND PASSWORD = '" + pword.Text + "'";
                            if (_dbHelper.ExecuteScalar(query1) != null)
                            {
                                user_id = Int32.Parse(_dbHelper.ExecuteScalar(query1).ToString());
                                ConfigurationManager.AppSettings["userid"] = user_id.ToString();
                            }


               if(_dbHelper.ExecuteScalar(query) != null)
                   Session["user"] = _dbHelper.ExecuteScalar(query).ToString();



               if (Session["user"] != null && Session["filter"] == null && Session["details"] == null)
                   Response.Redirect("Default.aspx");
               if (Session["user"] != null && Session["filter"] != null && Session["details"] == null)
                   Response.Redirect("FilterPage.aspx");
               if (Session["user"] != null && Session["details"] != null)
                   Response.Redirect("testdetails.aspx");
                else
                {
                    Label1.Text = "Invalid Username or Password!";
                    Label1.Visible = true;                 
                }

            }
            catch (Exception ww)
            {
                Response.Write(ww.Message.ToString());
            }
        }
      
    }
}