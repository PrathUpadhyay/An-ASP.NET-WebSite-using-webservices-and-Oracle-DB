using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckUp
{
    public partial class head_family : System.Web.UI.MasterPage
    {
        int id = 0;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["user"] != null)
            {
                lout.Visible = true;

                log.Visible = false;
                userlink.InnerText = "Hi, " + Session["user"].ToString() + "!";
                userlink.Visible = true;

                //uname.Text = "Welcome, " + Session["user"].ToString();
                //uname.Visible = true;
            }
            else if (Session["user"] == null)
            {
                lout.Visible = false;
                log.Visible = true;
            }
        }

        protected void log_out(object sender, EventArgs e)
        {
            ConfigurationManager.AppSettings["userid"] = "0";

            Session["user"] = null;
            Session.Abandon();
            Session.Clear();
            Response.Redirect("Default.aspx");

        }
    }
}