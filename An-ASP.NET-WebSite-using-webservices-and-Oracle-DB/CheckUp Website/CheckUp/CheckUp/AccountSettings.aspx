<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="AccountSettings.aspx.cs" Inherits="CheckUp.AccountSettings" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <link href="CSS/flexsliderece8.css" rel="stylesheet" />
    <link href="CSS/spectrumece8.css" rel="stylesheet" />

    <script src="Scripts/swfobjectece8.js"></script>
    <script src="Scripts/browserdetectece8.js"></script>
    <script src="Scripts/iframeSizer.minece8.js"></script>
    <script src="Scripts/nyt0ser.js"></script>

<%--    <script type="text/javascript">try { Typekit.load(); } catch (e) { }</script>
    <script>
        dataLayer = [{
            "article title": "How do I provide a Charles log or a Charles Proxy log?",
            "User Status": "anonymous"
        }];
    </script>--%>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


<%--    <br />
    <br />
    <br />
--%>




    <script src="Scripts/jquery-1.9.1.min.js"></script>
    <script src="Scripts/jquery.easing.1.3.js"></script>
    <script src="Scripts/jquery.cookie.js"></script>
    <script src="Scripts/bootstrap.minece8.js"></script>
    <script src="Scripts/jquery.validate.minece8.js"></script>
    <script src="Scripts/jquery.transit.minece8.js"></script>
    <script src="Scripts/jquery.flexslider-minece8.js"></script>
    <script src="Scripts/sisyphus.minece8.js"></script>
    <script src="Scripts/jquery.ajaxfileuploadece8.js"></script>
    <script src="Scripts/spectrumece8.js"></script>
    <script src="Scripts/script7ead.js"></script>










    <div class="section support-background">
        <div class="container">
            <div class="row kb-content">
                <div class="span10 offset1 static230-height">
                    <br />
                    <br />
                    <br />


                    <div class="kb-categories kb-list slidenav-main kb-cat-direct permalinks ">
                       <ul>
                           
                            <li><a data-part='subcategories' data-id='20035478' href='AccountDetails.aspx'>
                                <img src="img/img_account_details.png" />
                               <h4 style="margin-top:0.5px;color:#f4f4f4">Account Details</h4>
                            </a></li>
                            <li><a  data-part='subcategories' data-id='20035478' href='MyOrders.aspx'>
                                <img src="img/img_my_orders.png" />
                               <h4 style="margin-top:0.5px;color:#f4f4f4">My Orders</h4>
                            </a></li>
                            <li><a  class="active" data-part='subcategories' data-id='20035478' href='AccountSettings.aspx'>
                                <img src="img/img_account_settings.png" />
                               <h4 style="margin-top:0.5px;color:#f4f4f4">Account Settings</h4>
                            </a></li>
                            <li><a data-part='subcategories' data-id='20035478' href='FamilyAccount.aspx'>
                                <img src="img/img_family_account.png" />
                               <h4 style="margin-top:0.5px;color:#f4f4f4">Family Account</h4>
                            </a></li>
                         
                        </ul>
                    </div>


                    <h2 class="centered" style="margin-top: -20px; color: black; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
                        Account Settings</h2>
                 
                </div>
                <div class="span1 kb-line"></div>
            </div>



        </div>
    </div>



















    <script src="Accordion/jquery-1.10.2.js"></script>
    <link href="Accordion/jquery-ui.css" rel="stylesheet" />
    <script src="Accordion/jquery-ui.js"></script>





    <script>
        $(function () {
            $("#accordion").accordion({
                collapsible: true,
                active: true
            });
        });

         </script>


    <style>
        #accordion .ui-accordion-content {
            background-color: #fff;
            width: 78.5%;
            color: #777;
            font-size: 10pt;
            line-height: 16pt;
            margin-left:100px;
        }

        #accordion .ui-accordion-header {
            background-color: #f7fdfe;
            margin: 0px;
            width:80%;
            margin-left:100px;
           
        }



    

        .button {
  margin: 0 41%;
  font-size:small;
  padding: 0.75rem 2.1rem;
  display: block;
  background-color: #fff;
  border: 1px solid #28AADC;
  color: #28AADC;
    width:200px;
  height:50px;
  -webkit-border-radius: 3px;
  border-radius: 3px;
  -webkit-transition: all 0.3s ease-in-out;
  -moz-transition: all 0.3s ease-in-out;
  transition: all 0.3s ease-in-out;
}

            .button:hover {
                /*color: #28AADC;*/
                background-color: #28AADC;
                color:white;
                border-color: #28AADC;
            }



    </style>

    
    <div id="accordion" style="margin-left:50px;margin-right:50px">
        <asp:Repeater ID="rptAccordian" runat="server">
            <ItemTemplate>
               
      <h3>
                    Change Name
                </h3>

                <div>
                    <p>
                        <div style="margin-left:375px"> 
                        <asp:TextBox ID="TextBox5" runat="server"  placeholder="Full Name" style="border: 2px solid;border-color:#28AADC;" TextMode="SingleLine" OnTextChanged="Update_Name" Height="35px">
                            

                        </asp:TextBox>
                            </div>



                        

                        <asp:LinkButton ID="Button1" runat="server" OnClick="Update_Name" CssClass="button" style="text-decoration:none;">Change Name</asp:LinkButton>

                         <%--CommandName="HelloCommand" CommandArgument="5"--%>



                     <%--  <center>
                     
                            <button id="btn1" type="button" onclick="Update_Name" runat="server">Update Name</button>
                        </center>--%>
                    </p>
                </div>
             
                
                 <h3>
                    Change Password</h3>
                <div>
                    <p>
                   <div style="margin-left:160px">
                       <asp:TextBox ID="TextBox1" runat="server"  placeholder="Old Password" style="border: 2px solid;border-color:#28AADC;" TextMode="Password" Height="35px"></asp:TextBox>

                        <asp:TextBox ID="TextBox2" runat="server"  placeholder="New Password"  style="border: 2px solid;border-color:#28AADC;" TextMode="Password" Height="35px"></asp:TextBox>

                       <asp:TextBox ID="TextBox3" runat="server"  placeholder="Confirm New Password" style="border: 2px solid;border-color:#28AADC;" TextMode="Password" Height="35px"></asp:TextBox>
                       </div>
                        <br />
                        <asp:LinkButton ID="btn2" runat="server" OnClick="Update_Password" CssClass="button" style="text-decoration:none;">Change Password</asp:LinkButton>
                       
                    
                    </p>
                </div>





                <h3>
                    Subscribed Number
                </h3>

                <div>
                    <p>
                        <div style="margin-left:375px"> 
                        <asp:TextBox ID="TextBox4" runat="server"  placeholder="Contact No." style="border: 2px solid;border-color:#28AADC;" TextMode="Phone" MaxLength="10" Height="35px"></asp:TextBox>
                            </div>
                        <asp:LinkButton ID="btn3" runat="server" OnClick="Update_Mobile" CssClass="button" style="text-decoration:none;">Alert Me on this!!</asp:LinkButton>
                       
                    </p>
                </div>

            </ItemTemplate>
        </asp:Repeater>
        
                      
    </div>
    




</asp:Content>
