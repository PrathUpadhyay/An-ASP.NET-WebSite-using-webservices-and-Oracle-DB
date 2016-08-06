<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="feedback.aspx.cs" Inherits="CheckUp.feedback" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <link href='http://fonts.googleapis.com/css?family=Montserrat' rel='stylesheet' type='text/css'/>
  <link rel="stylesheet" href="http://sscol.jebal.comuv.com/css/font.css"/>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <body>
     <div style="margin-top:50px;margin-left:200px;width:900px;height:750px;border:1px dashed #23e3e9;border-radius:4px;box-shadow: 5px 5px 5px #2b90f1;background-color:#E9E9E9">
     <h1 style="font-family:Pacifico;color:#0094ff;text-shadow: 2px 2px #f3d20b;">&nbsp Feedback</h1><hr />
         <p style="font-family:Hero;margin-left:10px;font-size:15px"> We at <strong>"<u>CheckUp</u>"</strong> take each and every Feedback form seriously so Use the form below to send us your comments. We read all feedback carefully, but please note that we cannot respond to the comments you submit.</p>
         
          <div class="field name-box" style="margin-top:-5px;margin-left:60px">
		      <label for="name" style="font-family:Quicksand;font-size:20px;color:#1fa2ee">Name</label>  
              <%--<input type="text" id="name" placeholder="Who Are You?" style="width:400px;" />--%>
              <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
	      </div>
          <div class="field name-box" style="margin-top:-5px;margin-left:60px">
		      <label for="name" style="font-family:Quicksand;font-size:20px;color:#1fa2ee">E-mail</label>  
              <%--<input type="text" id="name" placeholder="Who Are You?" style="width:400px;" />--%>
              <asp:TextBox ID="TextBox2" runat="server" ></asp:TextBox>
           
 
              
	      </div>
          <div class="field msg-box" style="margin-left:60px">
		      <label for="msg" style="font-family:Quicksand;font-size:20px;color:#1fa2ee">Message</label>  
              <textarea id="msg" rows="4"  style="width:400px"/></textarea>
		        
		        
	      </div>
         <asp:Label ID="lblmsg" runat="server" Visible="false" style="margin-left:60px"></asp:Label>
         <br />
       <style>
           .myButton {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #44c767), color-stop(1, #5cbf2a));
	background:-moz-linear-gradient(top, #44c767 5%, #5cbf2a 100%);
	background:-webkit-linear-gradient(top, #44c767 5%, #5cbf2a 100%);
	background:-o-linear-gradient(top, #44c767 5%, #5cbf2a 100%);
	background:-ms-linear-gradient(top, #44c767 5%, #5cbf2a 100%);
	background:linear-gradient(to bottom, #44c767 5%, #5cbf2a 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#44c767', endColorstr='#5cbf2a',GradientType=0);
	background-color:#44c767;
	-moz-border-radius:26px;
	-webkit-border-radius:26px;
	border-radius:26px;
	border:2px solid #18ab29;
	display:inline-block;
	cursor:pointer;
	color:#f5edf5;
	font-family:Arial;
	font-size:17px;
	padding:12px 40px;
	text-decoration:none;
	text-shadow:0px -1px 5px #2f6627;
}
.myButton:hover {
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #5cbf2a), color-stop(1, #44c767));
	background:-moz-linear-gradient(top, #5cbf2a 5%, #44c767 100%);
	background:-webkit-linear-gradient(top, #5cbf2a 5%, #44c767 100%);
	background:-o-linear-gradient(top, #5cbf2a 5%, #44c767 100%);
	background:-ms-linear-gradient(top, #5cbf2a 5%, #44c767 100%);
	background:linear-gradient(to bottom, #5cbf2a 5%, #44c767 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5cbf2a', endColorstr='#44c767',GradientType=0);
	background-color:#5cbf2a;
}
.myButton:active {
	position:relative;
	top:1px;
}
       </style>
         <asp:Button ID="Button1" runat="server" Text="Send" class="myButton" style="margin-left:60px;margin-top:30px" OnClick="Button1_Click"/>
           

         <img src="img/health.png" style="float:right;margin-top:-260px"/>
         <%--<img src="/img/people-banner-2.png" style="margin-bottom:-80px;margin-left:100px"/>--%>    
     </div>
 </body>
</asp:Content>
