using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DALC4NET;
using System.Configuration;

namespace CheckUp
{
    public partial class MyOrders : System.Web.UI.Page
    {
        protected DBHelper _dbHelper = DBHelper.GetInstance();
        int id = 0;
        public string hidden = "";
        public string hidden1 = "";
        public string hidden2 = "";
        public string hidden3 = "";
        public string hidden4 = "";

        public static String farzi="fz";
        public static String farz1 = "fz";
       
        public static String farz3 = "fz";
        public static String farz4 = "fz";
        public static String farz5 = "fz";
        public static String farz6 = "fz";

        protected void Page_Load(object sender, EventArgs e)
        {

            ConfigurationManager.AppSettings["hidden"] = "";

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
                    string constr = "select tests.test_name,lab_tests.amount,labs.lab_name,locations.location_name,lab_tests_locations.address,orders.phone,orders.due_date from tests,lab_tests,lab_tests_locations,orders,users,labs,locations where users.user_id=orders.user_id and orders.lab_tests_locations_id=lab_tests_locations.lab_tests_locations_id and lab_tests_locations.lab_test_id=lab_tests.lab_test_id and lab_tests_locations.loc_id=locations.loc_id and lab_tests.lab_id=labs.lab_id and lab_tests.test_id=tests.test_id and orders.due_date>TRUNC(SYSDATE) and users.user_id = " + id;
                    rptAccordian.DataSource = _dbHelper.ExecuteDataTable(constr);
                    rptAccordian.DataBind();
                }

                catch(Exception e)
                {

                }

                string constr1 = "select tests.test_name,lab_tests.amount,labs.lab_name,locations.location_name,lab_tests_locations.address,orders.phone,orders.due_date from tests,lab_tests,lab_tests_locations,orders,users,labs,locations where users.user_id=orders.user_id and orders.lab_tests_locations_id=lab_tests_locations.lab_tests_locations_id and lab_tests_locations.lab_test_id=lab_tests.lab_test_id and lab_tests_locations.loc_id=locations.loc_id and lab_tests.lab_id=labs.lab_id and lab_tests.test_id=tests.test_id and orders.due_date<TRUNC(SYSDATE) and users.user_id = " + id;
                    Repeater1.DataSource = _dbHelper.ExecuteDataTable(constr1);
                    Repeater1.DataBind();
                //}
              

                

            }
            else
            {

                string constr = "select tests.test_name,lab_tests.amount,labs.lab_name,locations.location_name,lab_tests_locations.address,orders.phone,orders.due_date from tests,lab_tests,lab_tests_locations,orders,users,labs,locations where users.user_id=orders.user_id and orders.lab_tests_locations_id=lab_tests_locations.lab_tests_locations_id and lab_tests_locations.lab_test_id=lab_tests.lab_test_id and lab_tests_locations.loc_id=locations.loc_id and lab_tests.lab_id=labs.lab_id and lab_tests.test_id=tests.test_id and orders.due_date>trunc(SYSDATE) and users.user_id = " + id;
                rptAccordian.DataSource = _dbHelper.ExecuteDataTable(constr);
                rptAccordian.DataBind();

                string constr1 = "select tests.test_name,lab_tests.amount,labs.lab_name,locations.location_name,lab_tests_locations.address,orders.phone,orders.due_date from tests,lab_tests,lab_tests_locations,orders,users,labs,locations where users.user_id=orders.user_id and orders.lab_tests_locations_id=lab_tests_locations.lab_tests_locations_id and lab_tests_locations.lab_test_id=lab_tests.lab_test_id and lab_tests_locations.loc_id=locations.loc_id and lab_tests.lab_id=labs.lab_id and lab_tests.test_id=tests.test_id and orders.due_date<trunc(SYSDATE) and users.user_id = " + id;
                Repeater1.DataSource = _dbHelper.ExecuteDataTable(constr1);
                Repeater1.DataBind();
            }
        }


        protected void rptAccordian_ItemCreated(object sender, RepeaterItemEventArgs e)
        {
            farzi = "dsf";
           // farz1 = "dsf";
        }

        protected void rptAccordian_ItemCommand(object source, RepeaterCommandEventArgs e)
        {
            if (e.CommandName == "link")
            {
                Label lbl1 = (Label)e.Item.FindControl("Farzi");
                Label lbl2 = (Label)e.Item.FindControl("Label6");
                Label lbl4 = (Label)e.Item.FindControl("Label2");
                Label lbl5 = (Label)e.Item.FindControl("Label3");
                Label lbl6 = (Label)e.Item.FindControl("Label4");
                Label lbl7 = (Label)e.Item.FindControl("Label5");

                farzi = lbl1.Text;
               farz1 = lbl2.Text;
           
               farz3 = lbl4.Text;
               farz4 = lbl5.Text;
               farz5 = lbl6.Text;
               farz6 = lbl7.Text;
                
                ConfigurationManager.AppSettings["hidden"] = farzi;
                ConfigurationManager.AppSettings["hidden1"] = farz1;
               
                ConfigurationManager.AppSettings["hidden3"] = farz3;
                ConfigurationManager.AppSettings["hidden4"] = farz4;
                ConfigurationManager.AppSettings["hidden5"] = farz5;
                ConfigurationManager.AppSettings["hidden6"] = farz6;

                Response.Write("<script language='javascript'>window.open('print.aspx');</script>");

            }

        }

        protected void Button1_Click(object sender, EventArgs e)
        {

            String farzi2 = farzi;
            String farzi3 = farzi2;
        }


    
    }
}