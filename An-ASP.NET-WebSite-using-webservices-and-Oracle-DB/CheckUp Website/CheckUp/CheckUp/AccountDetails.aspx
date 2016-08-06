<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="AccountDetails.aspx.cs" Inherits="CheckUp.AccountDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <link href="CSS/flexsliderece8.css" rel="stylesheet" />
    <link href="CSS/spectrumece8.css" rel="stylesheet" />

    <script src="Scripts/swfobjectece8.js"></script>
    <script src="Scripts/browserdetectece8.js"></script>
    <script src="Scripts/iframeSizer.minece8.js"></script>
    <script src="Scripts/nyt0ser.js"></script>

    <script type="text/javascript">try { Typekit.load(); } catch (e) { }</script>
    <script>
        dataLayer = [{
            "article title": "How do I provide a Charles log or a Charles Proxy log?",
            "User Status": "anonymous"
        }];
    </script>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


<%--    <br />
    <br />
    <br />--%>





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
                           
                            <li><a class="active" data-part='subcategories' data-id='20035478' href='AccountDetails.aspx'>
                                <img src="img/img_account_details.png" />
                               <h4 style="margin-top:0.5px;color:#f4f4f4">Account Details</h4>
                            </a></li>
                            <li><a data-part='subcategories' data-id='20035478' href='MyOrders.aspx'>
                                <img src="img/img_my_orders.png" />
                               <h4 style="margin-top:0.5px;color:#f4f4f4">My Orders</h4>
                            </a></li>
                            <li><a data-part='subcategories' data-id='20035478' href='AccountSettings.aspx'>
                                <img src="img/img_account_settings.png" />
                               <h4 style="margin-top:0.5px;color:#f4f4f4">Account Settings</h4>
                            </a></li>
                            <li><a data-part='subcategories' data-id='20035478' href='FamilyAccount.aspx'>
                                <img src="img/img_family_account.png" />
                               <h4 style="margin-top:0.5px;color:#f4f4f4">Family Account</h4>
                            </a></li>
                   
                        </ul>
                    </div>
                    </div>
                </div>
                </div>
                </div>
    <style>
        table {
  font-family: 'Comic Sans MS';
  font-size: 14px;
  color: #212121;
  margin: 0 auto;
  width: 960px;
  border-collapse: collapse;
}
thead th {
  font-size: 20px;
  color: #212121;
  height: 40px;
  border: 1px solid #e6eaed;
  background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#e7f0fa), to(#dbe8f5));
}

.first {
  padding-right: 40px;
  width: 230px;
  text-align: right;
  border-left: 1px solid #e6eaed;
  border-right:  none;
  font-weight: 200;
}
.odd {
  background-color: #f6f9fb;
}
td {
  height: 40px;
  width: 230px;
  border-bottom: 1px solid #e6eaed;
  border-right: 1px solid #e6eaed;
}
a {
  color: #0088CC;
  text-decoration: none;
}
    </style>
   
    
    
    
    
    
      <table>
  <thead>
    <th colspan="4">Account Details</th>
  </thead>
  <tbody>
    <tr class="odd">
      <td rowspan="5">
     <center>    <asp:Image ID="Image1" runat="server" Height="164px" ImageAlign="Middle" Width="160" style="border-radius:90px;" ImageUrl="~/img/user_default.png" />
          <asp:FileUpload ID="FileUpload1" runat="server" ClientIDMode="Static" onchange="this.form.submit()" style="margin-top:5px;color:transparent;margin-left:180px;"/><br />
          <asp:Button ID="Button1" runat="server" Text="Done" OnClick="Button1_Click" Visible="false" style="margin-top:5px;"/>
    </center>  </td>
        
      <td class="first">Name:</td>
      <td>
          <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> </td>
    </tr>
    <tr class="even">     
      <td class="first">Username:</td>
      <td>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr class="odd">    
      <td class="first">Password:</td>
      <td>
           <asp:Label ID="Label3" runat="server"></asp:Label></td>
    </tr>
    <tr class="even" height="74px">    
     <td class="first">Email:</td>
      <td>
           <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr class="odd">     
      <td class="first">Mobile:</td>
      <td>
          <asp:Label ID="Label5" runat="server" Text="Label"></asp:Label> </td>
    </tr>
  </tbody>
</table>
              
              <%--  <div class="span1 kb-line"></div>--%>









</asp:Content>
