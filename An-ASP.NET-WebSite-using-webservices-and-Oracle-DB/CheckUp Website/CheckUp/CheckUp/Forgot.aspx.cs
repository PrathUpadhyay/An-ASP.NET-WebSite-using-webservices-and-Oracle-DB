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
    public partial class Forgot : System.Web.UI.Page
    {

       
        protected void Page_Load(object sender, EventArgs e)
        {
            Label3.Visible = false;
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
             DBHelper _dbHelper = DBHelper.GetInstance();
//            Yahoo!	smtp.mail.yahoo.com	587	Yes
//GMail	smtp.gmail.com	587	Yes
//Hotmail	smtp.live.com	587	Yes

            //string query = "select password,username from register where email = '" + TextBox1.Text + "'";

            //DataTable dt = _dbHelper.ExecuteDataTable(query);
            //using (MailMessage mm = new MailMessage("gupta.alka28@gmail.com", "gupta.alka28@gmail.com"))
            //{
            //    mm.Subject = " Password Recovery";
            //    mm.Body = " Your password for the email-id: ";
            //    //mm.Body = " Your password for the email-id: " + TextBox1.Text + Environment.NewLine + "Password: " + "qwerty";
            //    /* if (fuAttachment.HasFile)
            //     {
            //         string FileName = Path.GetFileName(fuAttachment.PostedFile.FileName);
            //         mm.Attachments.Add(new Attachment(fuAttachment.PostedFile.InputStream, FileName));
            //     }*/
            //    mm.IsBodyHtml = true;
            //    SmtpClient smtp = new SmtpClient();
            //    smtp.Host = "smtp.gmail.com";
            //    smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            //    smtp.EnableSsl = true;

            //    NetworkCredential NetworkCred = new NetworkCredential("gupta.alka28@gmail.com", "bubblygupta28");
            //    smtp.UseDefaultCredentials = false;
            //    smtp.Credentials = NetworkCred;
            //    smtp.Port = 587;
                
            //    //try
            //    //{
            //        smtp.Send(mm);
            //        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Check Your Registered Email for Password');", true);
                //}

           
            
            //string smtpAddress = "smtp.live.com";
            //int portNumber = 587;
            //bool enableSSL = true;

            //string emailFrom = "sunnyfunny_23@yahoo.co.in";
            //string password = "Tanmay2811";
            //string emailTo = "sunnyfunny_23@yahoo.co.in";
            //string subject = "Hello";
            //string body = "Hello, I'm just writing this to say Hi!";

           
            
            //using (MailMessage mail = new MailMessage())
            //{
            //    mail.From = new MailAddress(emailFrom);
            //    mail.To.Add(emailTo);
            //    mail.Subject = subject;
            //    mail.Body = body;
            //    mail.IsBodyHtml = true;
            //    // Can set to false, if you are sending pure text.

            //    //mail.Attachments.Add(new Attachment("C:\\SomeFile.txt"));
            //    //mail.Attachments.Add(new Attachment("C:\\SomeZip.zip"));

            //    using (SmtpClient smtp = new SmtpClient(smtpAddress, portNumber))
            //    {
            //        smtp.Credentials = new NetworkCredential(emailFrom, password);
            //        smtp.DeliveryMethod = SmtpDeliveryMethod.Network;
            //        smtp.EnableSsl = enableSSL;
            //        smtp.UseDefaultCredentials = false;
            //        smtp.Send(mail);
            //        ClientScript.RegisterStartupScript(GetType(), "alert", "alert('Please Check Your Registered Email for Password');", true);
            //    }
            //}
            string query = "select email from users where email='" + TextBox1.Text + "'";
            //string email = _dbHelper.ExecuteScalar(query).ToString();
            if (_dbHelper.ExecuteScalar(query) != null)
            {
                try
                {
                    Random generator = new Random();
                    String r = generator.Next(1000, 1000000).ToString("D6");
                    Session["code"] = r;
                    MailMessage mail = new MailMessage();
                    mail.To.Add(TextBox1.Text);
                    Session["email"] = TextBox1.Text;
                    mail.From = new MailAddress("checkup.weforyou@gmail.com");
                    mail.Subject = "Password Recovery";
                    mail.Body = "Your Verification code is " + r;
                    mail.IsBodyHtml = true;

                    //if (FileUpload1.HasFile)
                    //{
                    //    mail.Attachments.Add(new Attachment(FileUpload1.PostedFile.InputStream, FileUpload1.FileName));
                    //}
                    SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
                    //smtp.Host = ; //Or Your SMTP Server Address
                    smtp.Credentials = new System.Net.NetworkCredential
                         ("checkup.weforyou@gmail.com", "pathlabs");
                    //Or your Smtp Email ID and Password
                    smtp.EnableSsl = true;
                    smtp.Send(mail);
                    //  Button1_Click(sender, e);
                    Response.Redirect("password_change.aspx");
                }
                catch (Exception err)
                {
                    Response.Write(err.Message.ToString());
                }
            }
            else
            {
                Label3.Text = "Email-id not registered!";
                Label3.Visible = true;
            }
        }
    }
}
