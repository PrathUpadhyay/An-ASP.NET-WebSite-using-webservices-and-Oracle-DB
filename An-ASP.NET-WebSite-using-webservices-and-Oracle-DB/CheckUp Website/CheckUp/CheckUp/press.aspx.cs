using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using HtmlAgilityPack;
using System.Net;
using System.IO;

namespace CheckUp
{
    public partial class press : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                var webget = new HtmlWeb();
                WebClient client = new WebClient();
                String response = client.DownloadString("http://edition.cnn.com/health");
                HtmlDocument doc = new HtmlDocument();
                doc.LoadHtml(response);
                var test = doc.DocumentNode.SelectSingleNode("//*[@id='health-zone-2']/div[5]/div/div[1]/ul/article" + "[1]");
                int i = 1;
                Label l = new Label();
                l.Text = test.InnerHtml;
                headin.Controls.Add(l);

                WebClient client1 = new WebClient();



                //   response = client1.DownloadString("http://edition.cnn.com/2015/12/02/health/false-positive-mammogram-cancer-risk/index.html");
                //  doc = new HtmlDocument();
                //  doc.LoadHtml(response);
                var test1 = doc.DocumentNode.SelectSingleNode("//*[@id='health-zone-2']/div[5]/div/div[1]/ul/article" + "[2]");
                Label l1 = new Label();
                l1.Text = test1.InnerHtml;
                headin1.Controls.Add(l1);

                var test2 = doc.DocumentNode.SelectSingleNode("//*[@id='health-zone-2']/div[5]/div/div[1]/ul/article" + "[3]");
                Label l2 = new Label();
                l2.Text = test2.InnerHtml;
                headin2.Controls.Add(l2);

                var test3 = doc.DocumentNode.SelectSingleNode("//*[@id='health-zone-2']/div[5]/div/div[1]/ul/article" + "[4]");
                Label l3 = new Label();
                l3.Text = test3.InnerHtml;
                headin3.Controls.Add(l3);


                var test4 = doc.DocumentNode.SelectSingleNode("//*[@id='health-zone-2']/div[5]/div/div[1]/ul/article" + "[5]");
                Label l4 = new Label();
                l4.Text = test4.InnerHtml;
                headin4.Controls.Add(l4);


                var test5 = doc.DocumentNode.SelectSingleNode("//*[@id='health-zone-2']/div[5]/div/div[1]/ul/article" + "[6]");
                Label l5 = new Label();
                l5.Text = test5.InnerHtml;
                headin5.Controls.Add(l5);

                var test6 = doc.DocumentNode.SelectSingleNode("//*[@id='health-zone-2']/div[5]/div/div[1]/ul/article" + "[7]");
                Label l6 = new Label();
                l6.Text = test6.InnerHtml;
                headin6.Controls.Add(l6);




                for (i = 7; i < 11; i++)
                {
                    var testing = doc.DocumentNode.SelectSingleNode("//*[@id='health-zone-2']/div[5]/div/div[1]/ul/article" + "[" + i + "]");
                    Label la = new Label();
                    la.Text = testing.InnerHtml;
                    order.Controls.Add(la);


                }
            }
            catch (WebException ex)
            {

            }
        }
    }
}