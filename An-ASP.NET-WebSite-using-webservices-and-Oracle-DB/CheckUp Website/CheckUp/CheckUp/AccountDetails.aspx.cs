using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using DALC4NET;
using System.Data;
using System.Data.OracleClient;
using System.Data.Sql;
using System.Data.SqlClient;

namespace CheckUp
{
    public partial class AccountDetails : System.Web.UI.Page
    {
        protected DBHelper _dbHelper = DBHelper.GetInstance();
        protected void Page_Load(object sender, EventArgs e)
        {
            string s = "~//img//";
            if (IsPostBack && FileUpload1.PostedFile != null)
            {
                if (FileUpload1.PostedFile.FileName.Length > 0)
                {
                    if (FileUpload1.HasFile)
                    {
                       
                        Button1.Visible = true;
                        // Response.Write(FileUpload1.FileName.ToString());
                        //Response.Write("hai");
                        string fileNameWithoutExtension = System.IO.Path.GetFileNameWithoutExtension(FileUpload1.FileName);

                        //==== Get file extension.
                        string fileExtension = System.IO.Path.GetExtension(FileUpload1.FileName);

                        //=== Now we have both file name and its extension seperately we can now eaisly rename file name.

                        //===== Adding some text in begining and end of the file name
                        fileNameWithoutExtension = Session["user"].ToString() + "_photo";

                        //===== Now lets upload the renamed file.

                        FileUpload1.PostedFile.SaveAs(Server.MapPath("img//" + fileNameWithoutExtension + fileExtension));
                        //   FileUpload1.SaveAs(Server.MapPath("img//" + FileUpload1.FileName.ToString()));
                        Image1.ImageUrl = "~//img//" + fileNameWithoutExtension + fileExtension;
                        string query = "UPDATE users SET photo = '"+ s + fileNameWithoutExtension + fileExtension +"' WHERE username = '" + Session["user"].ToString() + "'";
                        _dbHelper.ExecuteScalar(query);
                    }
                    else
                    {
                        string query = "UPDATE users SET photo = '~//img//user_default.png' WHERE username = '" + Session["user"].ToString() + "'";
                        _dbHelper.ExecuteScalar(query);
                    }
                   
                }
               
            }

          

            string query1 = "select * from users where username = '"+ Session["user"].ToString() +"'";

            DataTable dt = _dbHelper.ExecuteDataTable(query1);

            if(query1!=null)
            {
                Label1.Text = dt.Rows[0][1].ToString();
                Label2.Text = dt.Rows[0][2].ToString();
                int n = dt.Rows[0][3].ToString().Length;
                for (int i = 1; i <= n; i++ )
                {
                    Label3.Text = Label3.Text + "*";
                }
                   
                Label4.Text = dt.Rows[0][4].ToString();
                Label5.Text = dt.Rows[0][5].ToString();
               if(dt.Rows[0][6].ToString() == "")
               {
                   Image1.ImageUrl = "~//img//user_default.png";
               }
               else

                Image1.ImageUrl = dt.Rows[0][6].ToString();
               //Image1.ImageUrl = "~//img//" + dt.Rows[0][6].ToString();
            }
        }


        protected void abc(object sender, EventArgs e)
        {
            if(FileUpload1.HasFile)
            {
                Button1.Visible = false;
            }
        }


        protected void Button1_Click(object sender, EventArgs e)
        {

            Button1.Visible = false;         
        }
    }
}