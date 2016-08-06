using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace CheckUp
{
    public partial class feedback : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lblmsg.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            lblmsg.Text = "Your feedback has come to us!";
            lblmsg.Visible = true;
        }
    }
}