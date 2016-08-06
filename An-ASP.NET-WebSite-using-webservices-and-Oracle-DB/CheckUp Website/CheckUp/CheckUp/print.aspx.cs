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
    public partial class print : System.Web.UI.Page
    {
        public int id = 0;
        protected DBHelper _dbHelper = DBHelper.GetInstance();
        protected void Page_Load(object sender, EventArgs e)
        {
            //id = Int32.Parse(ConfigurationManager.AppSettings["userid"]);
            //string query = "select tests.test_name,lab_tests.amount,labs.lab_name,locations.location_name,lab_tests_locations.address,orders.phone,orders.due_date from tests,lab_tests,lab_tests_locations,orders,users,labs,locations where users.user_id=orders.user_id and orders.lab_tests_locations_id=lab_tests_locations.lab_tests_locations_id and lab_tests_locations.lab_test_id=lab_tests.lab_test_id and lab_tests_locations.loc_id=locations.loc_id and lab_tests.lab_id=labs.lab_id and lab_tests.test_id=tests.test_id and orders.due_date>trunc(SYSDATE) and users.user_id = " + id;
            //_dbHelper.ExecuteDataTable(query);
            Label6.Text = ConfigurationManager.AppSettings["hidden"];
            Label1.Text = ConfigurationManager.AppSettings["hidden1"];
            
            Label2.Text = ConfigurationManager.AppSettings["hidden3"];
            Label4.Text = ConfigurationManager.AppSettings["hidden4"];
            Label3.Text = ConfigurationManager.AppSettings["hidden5"];
            Label7.Text = ConfigurationManager.AppSettings["hidden6"];
        }


    }
}