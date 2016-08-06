<%@ Page Title="" Language="C#" MasterPageFile="~/head_my_order.Master" AutoEventWireup="true" CodeBehind="MyOrders.aspx.cs" Inherits="CheckUp.MyOrders" %>
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
                                <h4 style="margin-top: 0.5px; color: #f4f4f4">Account Details</h4>
                            </a></li>
                            <li><a class="active" data-part='subcategories' data-id='20035478' href='MyOrders.aspx'>
                                <img src="img/img_my_orders.png" />
                                <h4 style="margin-top: 0.5px; color: #f4f4f4">My Orders</h4>
                            </a></li>
                            <li><a data-part='subcategories' data-id='20035478' href='AccountSettings.aspx'>
                                <img src="img/img_account_settings.png" />
                                <h4 style="margin-top: 0.5px; color: #f4f4f4">Account Settings</h4>
                            </a></li>
                            <li><a data-part='subcategories' data-id='20035478' href='FamilyAccount.aspx'>
                                <img src="img/img_family_account.png" />
                                <h4 style="margin-top: 0.5px; color: #f4f4f4">Family Account</h4>
                            </a></li>

                        </ul>
                    </div>


                    <h2 class="centered" style="margin-top: -20px; color: black; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">My Orders</h2>
                  
               <%-- </div>
                <div class="span1 kb-line"></div>
            </div>
--%>


        </div>
    </div>








  <br />
            <br />
            <br />








    <script src="Accordion/jquery-1.10.2.js"></script>
    <link href="Accordion/jquery-ui.css" rel="stylesheet" />
    <script src="Accordion/jquery-ui.js"></script>





    <script>
        $(function () {
            $("#accordion").accordion({
                collapsible: true,
                active: false
            });
        });
    </script>

<script>
    $(function () {
        $("#accordionn").accordion({
            collapsible: true,
            active: false
        });
    });
    </script>






    <%--    <ul class="nav nav-pills nav-justified">
  <li class="active"><a href="#">Home</a></li>
  <li><a href="#">Menu 1</a></li>
  <li><a href="#">Menu 2</a></li>
  <li><a href="#">Menu 3</a></li>
</ul>
    --%>





    <style>
        body {
            padding: 10px;
        }

        /*#exTab1 .tab-content {
            color: white;
            background-color: #428bca;
            padding: 5px 15px;
        }*/

        #exTab2 h4 {
            color: white;
            background-color: #428bca;
            padding: 5px 15px;
        }

        /* remove border radius for the tab */

        #exTab1 .nav-pills > li > a {
            border-radius: 0;
        }

        /* change border radius for the tab , apply corners on top*/

        #exTab3 .nav-pills > li > a {
            border-radius: 4px 4px 0 0;
        }

        /*#exTab3 .tab-content {
            color: white;
            background-color: #428bca;
            padding: 5px 15px;
        }*/
    </style>

    





<div id="exTab3" class="container">	
<ul  class="nav nav-pills">
			<li class="active" style="margin-left:50em">
        <a  href="#1b" data-toggle="tab">Active Orders</a>
			</li>
			<li><a href="#2b" data-toggle="tab">Inactive Orders</a>
			</li>
			
		</ul>

			<div class="tab-content clearfix">
			  <div class="tab-pane active" id="1b">
         

                
                  <style>
        #accordion .ui-accordion-content {
            background-color: #fff;
            width: 88%;
            color: #777;
            font-size: 10pt;
            line-height: 16pt;
            margin-left: 30px;
        }

        #accordion .ui-accordion-header {
            background-color: #f7fdfe;
            margin: 0px;
            width: 90%;
            height:45px;
            margin-left: 30px;
        }

    </style>



                  
    <div id="accordion" style="margin-left: 50px; margin-right: 50px;margin-bottom:50px;">
        <asp:Repeater ID="rptAccordian" runat="server" OnItemCommand="rptAccordian_ItemCommand" OnItemCreated="rptAccordian_ItemCreated"  >
            
            
          <%--  OnItemDataBound="rptAccordian_ItemDataBound"--%>
             <ItemTemplate>
                
                    
                        
                            <h4 style="color:black;font-family:'Comic Sans MS';">

                                <asp:Label ID="Farzi" runat="server" Text='<%# Eval("TEST_NAME") %>'></asp:Label><asp:Label ID="Label7" runat="server" Text=" Test"></asp:Label>

                            <mark>    <asp:Label ID="Label6" runat="server" Text='<%# Eval("AMOUNT") %>' style="float:right;"></asp:Label>
                              <asp:Label ID="Label8" runat="server" Text="Rs. " style="float:right;"></asp:Label> </mark> <%-- &nbsp;Test<mark style="float:right;"></mark>--%>

                            </h4>
                        
                        
                            <%--<h5 style="color:black;float:right;margin-left:500px;">  <mark> Rs <%# Eval("AMOUNT") %>/-</mark></h5>--%>
                      
                  
                
                <div>
                    <p>

<%--                        <asp:LinkButton ID="Link1" runat="server" OnClick="Unnamed_Click" >LinkButton</asp:LinkButton>--%>

                        <%--<asp:LinkButton ID="LinkButton1" runat="server" OnClick="Unnamed_Click">LinButton</asp:LinkButton>--%>

                        <table style="color:black;font-family:'Comic Sans MS';">
                            <tr>
                                <td>
                                     <h4 style="color:darkblue;">Due Date: </h4>                         
                                </td>
                                <td>
                               <h5>     <asp:Label ID="Label1" runat="server" Text='<%# Eval("DUE_DATE") %>' style="margin-left:100px;"></asp:Label></h5>
                                    <%--<h5 style="margin-left:100px;">  <%# Eval("DUE_DATE") %></h5>--%>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                      <h4 style="color:darkblue;">Lab Name: </h4>     
                                </td>
                                <td>
                                  <h5>  <asp:Label ID="Label2" runat="server" Text='<%# Eval("LAB_NAME") %>' style="margin-left:100px;"></asp:Label></h5>
                                     <%--<h5 style="margin-left:100px;">  <%# Eval("LAB_NAME") %></h5>--%>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                       <h4 style="color:darkblue;">Location: </h4>     
                                </td>
                                <td>
                                     <h5>     <asp:Label ID="Label3" runat="server" Text='<%# Eval("LOCATION_NAME") %>' style="margin-left:100px;"></asp:Label></h5>
                                     <%--<h5 style="margin-left:100px;">  <%# Eval("LOCATION_NAME") %></h5>--%>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                      <h4 style="color:darkblue;">Address: </h4>     
                                </td>
                                <td>
                                     <h5>     <asp:Label ID="Label4" runat="server" Text='<%# Eval("ADDRESS") %>' style="margin-left:100px;"></asp:Label></h5>
                                     <%--<h5 style="margin-left:100px;">  <%# Eval("ADDRESS") %></h5>--%>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <h4 style="color:darkblue;">Contact: </h4>     
                                </td>
                                <td>
                                     <h5>     <asp:Label ID="Label5" runat="server" Text='<%# Eval("PHONE") %>' style="margin-left:100px;"></asp:Label></h5>
                                      <%--<h5 style="margin-left:100px;">  <%# Eval("PHONE") %></h5>--%>
                                </td>
                            </tr>

                           
                        </table>
                       
                       <asp:Button ID="Button1" runat="server" Text="Print" OnClick="Button1_Click"  CommandName="link"/>
                       
                      
                    </p>
                </div>
                 
            </ItemTemplate>
        </asp:Repeater>
    </div>













				</div>
				<div class="tab-pane" id="2b">
         
                      <style>
        #accordionn .ui-accordion-content {
            background-color: #fff;
            width: 88%;
            color: #777;
            font-size: 10pt;
            line-height: 16pt;
            margin-left: 30px;
        }

        #accordionn .ui-accordion-header {
            background-color: #f7fdfe;
            margin: 0px;
            width: 90%;
            height:45px;
            margin-left: 30px;
        }
        mark{
            background-color:#f7fdfe;
            color:orangered;
            font-size:large;
        }
       
    </style>



                  
    <div id="accordionn" style="margin-left: 50px; margin-right: 50px;margin-bottom:50px;">
        <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="rptAccordian_ItemCommand" OnItemCreated="rptAccordian_ItemCreated" >
             <ItemTemplate>
                <h4 style="color:black;font-family:'Comic Sans MS';">

                                <asp:Label ID="Farzi" runat="server" Text='<%# Eval("TEST_NAME") %>'></asp:Label><asp:Label ID="Label7" runat="server" Text=" Test"></asp:Label>

                            <mark>    <asp:Label ID="Label6" runat="server" Text='<%# Eval("AMOUNT") %>' style="float:right;"></asp:Label>
                              <asp:Label ID="Label8" runat="server" Text="Rs. " style="float:right;"></asp:Label> </mark> <%-- &nbsp;Test<mark style="float:right;"></mark>--%>

                            </h4>
                
                <div style="min-height:270px;">
                    <p>

                        <table style="color:black;font-family:'Comic Sans MS';">
                            <tr>
                                <td>
                                     <h4 style="color:red;">Expired On: </h4>                         
                                </td>
                                <td>
                                    <h5>     <asp:Label ID="Label1" runat="server" Text='<%# Eval("DUE_DATE") %>' style="margin-left:100px;"></asp:Label></h5>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                      <h4 style="color:darkblue;">Lab Name: </h4>     
                                </td>
                                <td>
                                   <h5>  <asp:Label ID="Label2" runat="server" Text='<%# Eval("LAB_NAME") %>' style="margin-left:100px;"></asp:Label></h5>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                       <h4 style="color:darkblue;">Location: </h4>     
                                </td>
                                <td>
                                      <h5>     <asp:Label ID="Label3" runat="server" Text='<%# Eval("LOCATION_NAME") %>' style="margin-left:100px;"></asp:Label></h5>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                      <h4 style="color:darkblue;">Address: </h4>     
                                </td>
                                <td>
                                     <h5>     <asp:Label ID="Label4" runat="server" Text='<%# Eval("ADDRESS") %>' style="margin-left:100px;"></asp:Label></h5>
                                </td>
                            </tr>

                            <tr>
                                <td>
                                    <h4 style="color:darkblue;">Contact: </h4>     
                                </td>
                                <td>
                                       <h5>     <asp:Label ID="Label5" runat="server" Text='<%# Eval("PHONE") %>' style="margin-left:100px;"></asp:Label></h5>
                                </td>
                            </tr>

                           
                        </table>
                        
                         <asp:Button ID="Button1" runat="server" Text="Print" OnClick="Button1_Click"  CommandName="link"/>
                     
                    </p>
                </div>
                <%-- '<%#Eval("LOCATION_NAME") %>'--%>
            </ItemTemplate>
        </asp:Repeater>
    </div>



				</div>
      		</div>
  </div>

<%--	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
--%>




























<%--
    <style>
        #accordion .ui-accordion-content {
            background-color: #fff;
            width: 78.5%;
            color: #777;
            font-size: 10pt;
            line-height: 16pt;
            margin-left: 100px;
        }

        #accordion .ui-accordion-header {
            background-color: #f7fdfe;
            margin: 0px;
            width: 80%;
            margin-left: 100px;
        }
    </style>
    --%>









    <%--<div id="accordion" style="margin-left: 50px; margin-right: 50px">
        <asp:Repeater ID="rptAccordian" runat="server">
            %> <ItemTemplate>
                <h3>
                    <%# Eval("LOCATION_NAME") %></h3>
                <div>
                    <p>
                        Hello
                    </p>
                </div>

            </ItemTemplate>
        </asp:Repeater>
    </div>--%>





</asp:Content>
