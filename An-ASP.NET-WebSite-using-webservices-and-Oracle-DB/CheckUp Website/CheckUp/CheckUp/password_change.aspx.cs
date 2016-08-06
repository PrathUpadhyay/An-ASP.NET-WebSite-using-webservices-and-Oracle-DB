using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Web.Security;
using System.Net;
using System.Net.Mail;
using System.Xml.Linq;
using DALC4NET;
using System.Data;

namespace CheckUp
{
    public partial class password_change : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Label2.Visible = false;
            Label3.Visible = false;
        }

        protected void Button2_Click(object sender, EventArgs e)
        {
            Response.Redirect("Forgot.aspx");
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            DBHelper _dbHelper = DBHelper.GetInstance();
            if(TextBox1.Text == Session["code"].ToString())
            {
                if(TextBox2.Text == TextBox3.Text && TextBox2.Text.Length>=6)
                {
                    string query = "UPDATE users SET password = '" + TextBox2.Text + "' WHERE email = '" +Session["email"].ToString()+"'";
                    _dbHelper.ExecuteScalar(query);
                    Label3.Text = "Password updated successfully!";
                    Label3.Visible = true;
                    Session["code"] = null;
                    Session["email"] = null;
                }
                else if(TextBox2.Text != TextBox3.Text)
                {
                    Label3.Text = "Passwords don't match!";
                    Label3.Visible = true;
                }
                else if(TextBox2.Text.Length<6)
                {
                    Label3.Text = "Password must be of minimum length 6,Try again!";
                    Label3.Visible = true;
                }
            }
            else
            {
                Label2.Text = "Wrong verification code entered.Please try again!";
                Label2.Visible = true;
            }
        }
    }
}