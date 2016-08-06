using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using DALC4NET;
using System.Data;
using System.Data.OracleClient;


namespace CheckUp
{
    /// <summary>
    /// Summary description for WebService1     
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]

    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class WebService1 : System.Web.Services.WebService
    {

        DBHelper _dbHelper = DBHelper.GetInstance();
        OracleConnection con = new OracleConnection("Data Source=ORCL;User Id=checkup;Password=checkup; Integrated Security=NO");



        [WebMethod]
        public string sayHello(String Location, String Category)
        {


            return "uiohello " + Location + Category;
        }



        [WebMethod]
        public string[] sayHolaa(String name)
        {
            string[] name2 = new string[5];
            name2[0] = "udit";
            name2[1] = "udit1";
            name2[2] = "udit2";
            name2[3] = "udit3";
            name2[4] = "udit4";

            return name2;
        }



        [WebMethod]
        public string[] getSearchButton(String Location, String Category, String TestName, int flag)
        {

            con.Open();

            string query = "select la.lab_name, lt.amount, ltl.address from labs la,risk_areas r,test_risk tr,lab_tests_locations ltl,lab_tests lt,tests t,locations l where ltl.LAB_TEST_ID =lt.LAB_TEST_ID and lt.test_id=t.test_id and tr.test_id=t.test_id and tr.risk_area_id=r.risk_area_id and ltl.loc_id=l.loc_id and l.location_name='" + Location + "' and r.risk_area_name='" + Category + "' and t.test_name = '" + TestName + "' and la.lab_id = lt.lab_id";
            OracleDataAdapter da = new OracleDataAdapter(query, con);

            //da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                if (flag == 1)
                    members.SetValue(dr["lab_name"].ToString(), i);

                else if (flag == 2)
                    members.SetValue(dr["amount"].ToString(), i);

                else
                    members.SetValue(dr["address"].ToString(), i);


                i++;
            }
            return members;

        }







        [WebMethod]
        public string[] login(String Username, String Password)
        {
            con.Open();

            string query = "select username from users where password='" + Password + "' and username='" + Username + "'";





            OracleDataAdapter da = new OracleDataAdapter(query, con);

            //da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {

                members.SetValue(dr["username"].ToString(), i);



                i++;
            }
            return members;

        }




        [WebMethod]
        public string[] myaccount(String Username)
        {
            con.Open();

            string query = "select * from users where username='" + Username + "'";
            OracleDataAdapter da = new OracleDataAdapter(query, con);
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[3];

            foreach (DataRow dr in dt.Rows)
            {

                members.SetValue(dr["name"].ToString(), 0);

                members.SetValue(dr["email"].ToString(), 1);

                members.SetValue(dr["mobile"].ToString(), 2);

            }
            return members;

        }








        [WebMethod]
        public string[] signup(String FullName, String Username, String Email, String Password, String ConfirmPass)
        {
            int temp = 0;

            string query = "select * from users";
            DataTable dt = _dbHelper.ExecuteDataTable(query);

            string query2 = "select count(*) from users";
            int i = Int32.Parse(_dbHelper.ExecuteScalar(query2).ToString());

            for (int j = 0; j < i; j++)
            {

                if (Username == dt.Rows[j][2].ToString())
                {
                    temp = 1;
                }
                if (Password != ConfirmPass)
                {
                    temp = 2;
                    break;
                }
                if (Username == "" || Password == "" || Email == "" || FullName == "")
                {
                    temp = 3;
                    break;
                }
                if (Password.Length < 6)
                {
                    temp = 4;
                    break;
                }
                if (Email == dt.Rows[j][4].ToString())
                {
                    temp = 5;
                }

            }








            String[] members = new String[1];

            con.Open();
            if (temp == 0)
            {

                String query3 = "insert into users(USER_ID,NAME,USERNAME,PASSWORD,EMAIL,MOBILE,PHOTO) values(auto_in.nextval,'" + FullName + "','" + Username + "','" + Password + "','" + Email + "','','~//img//user_default.png')";




                _dbHelper.ExecuteScalar(query3);

                //members[0] = "Account Successfully made";
                //return 0;
                members[0] = "0";

            }
            else if (temp == 1)
            {
                //members[0] = "User already Exists!";
                // return 1;
                members[0] = "1";

            }
            else if (temp == 2)
            {
                //members[0] = "Passwords Don't Match";
                //return 2;
                members[0] = "2";
            }
            else if (temp == 3)
            {
                //members[0] = "Enter info correctly!";
                //return 3;
                members[0] = "3";

            }
            else if (temp == 4)
            {
                //members[0] = "Password too small, must be minimum of length 6 or more!";
                //return 4;
                members[0] = "4";

            }
            else if (temp == 5)
            {
                //  members[0] = "Email id already registered!";
                //return 5;
                members[0] = "5";
            }
            else
            {
                // members[0] = "Server Error";
                //return 6;
                members[0] = "6";
            }

            return members;

        }









        [WebMethod]
        public string[] testdetails(String Location, String LabName, String TestName)
        {

            con.Open();

            string query = "select unique t.details from LAB_TESTS_LOCATIONS loc,lab_tests lt,labs l,tests t,locations loca where l.lab_id=lt.lab_id and lt.lab_test_id=loc.lab_test_id and lt.test_id=t.test_id and loca.loc_id=loc.loc_id and l.lab_name='" + LabName + "' and t.test_name = '" + TestName + "' and loca.location_name = '" + Location + "'";



            OracleDataAdapter da = new OracleDataAdapter(query, con);

            //da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {

                members.SetValue(dr["details"].ToString(), i);


                i++;
            }
            return members;

        }



        [WebMethod]
        public string[] booknow(String Username, String LabName, String TestName, String Location, String Date)
        {
            String[] members = new String[1];

            string query3 = "select LTL.LAB_TESTS_LOCATIONS_ID from LAB_TESTS_LOCATIONS LTL, LOCATIONS L, LAB_TESTS LT, LABS LA, TESTS T  where l.loc_id = ltl.loc_id and ltl.LAB_TEST_ID = lt.lab_test_id and lt.lab_id = la.lab_id and lt.test_id = t.test_id and la.lab_name='" + LabName + "' and t.test_name='" + TestName + "' and l.location_name='" + Location + "'";

            int lab_t_loc_id = Int32.Parse(_dbHelper.ExecuteScalar(query3).ToString());


            string query2 = "select user_id from users where username='" + Username + "'";

            int useridd = Int32.Parse(_dbHelper.ExecuteScalar(query2).ToString());

            string query4 = "select MOBILE from users where user_id=" + useridd;

            String PhoneNo = _dbHelper.ExecuteScalar(query4).ToString();



            string query = "insert into orders values(order_in.nextval," + lab_t_loc_id + ",to_date('" + Date + "','dd/mm/yyyy')," + useridd + ",'" + PhoneNo + "')";

            _dbHelper.ExecuteScalar(query);


            members[0] = "1";
            return members;

        }









        [WebMethod]
        public string[] myorders(String Username, int flag)
        {


            con.Open();

            string query2 = "select user_id from users where username='" + Username + "'";

            int useridd = Int32.Parse(_dbHelper.ExecuteScalar(query2).ToString());






            string query = "select tests.test_name,lab_tests.amount,labs.lab_name,locations.location_name,lab_tests_locations.address,orders.due_date from tests,lab_tests,lab_tests_locations,orders,users,labs,locations where users.user_id=orders.user_id and orders.lab_tests_locations_id=lab_tests_locations.lab_tests_locations_id and lab_tests_locations.lab_test_id=lab_tests.lab_test_id and lab_tests_locations.loc_id=locations.loc_id and lab_tests.lab_id=labs.lab_id and lab_tests.test_id=tests.test_id and orders.due_date>TRUNC(SYSDATE) and users.user_id = " + useridd + "order by orders.due_date DESC";





            OracleDataAdapter da = new OracleDataAdapter(query, con);

            //da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {
                if (flag == 1)
                    members.SetValue(dr["test_name"].ToString(), i);

                else if (flag == 2)
                    members.SetValue(dr["amount"].ToString(), i);

                else if (flag == 3)
                    members.SetValue(dr["lab_name"].ToString(), i);

                else if (flag == 4)
                    members.SetValue(dr["location_name"].ToString(), i);

                else if (flag == 5)
                    members.SetValue(dr["address"].ToString(), i);

                else
                    members.SetValue(dr["due_date"].ToString(), i);

                i++;
            }
            return members;
        }














        [WebMethod]
        public string[] testbycategory(String Category)
        {
            con.Open();

            string query = "select t.test_name from tests t, risk_areas r, test_risk tr where r.risk_area_id = tr.risk_area_id and tr.test_id = t.test_id and r.risk_area_name = '" + Category + "'";

            OracleDataAdapter da = new OracleDataAdapter(query, con);

            //da.SelectCommand.Parameters.Add("s", System.Data.OracleClient.OracleType.VarChar, 50).Value = s + "%";
            DataTable dt = new DataTable();
            da.Fill(dt);
            string[] members = new string[dt.Rows.Count];
            int i = 0;
            foreach (DataRow dr in dt.Rows)
            {

                members.SetValue(dr["test_name"].ToString(), i);

                i++;
            }
            return members;
        }









    }
}
