using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckUp
{
    public partial class WebForm2 : System.Web.UI.Page
    {
        protected int flag2;
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void LinkButton1_Click(object sender, EventArgs e)
        {

            ConfigurationManager.AppSettings["flag"] = "2";
            flag2 = Int32.Parse(ConfigurationManager.AppSettings["flag"]);
            Response.Redirect("AccountDetails.aspx");
        }

        protected void LinkButton2_Click(object sender, EventArgs e)
        {
            Response.Redirect("MyOrders.aspx");
        }

        protected void LinkButton3_Click(object sender, EventArgs e)
        {
            Response.Redirect("AccountSettings.aspx");
        }

        protected void LinkButton4_Click(object sender, EventArgs e)
        {
            Response.Redirect("FamilyAccount.aspx");

        }
    }
}