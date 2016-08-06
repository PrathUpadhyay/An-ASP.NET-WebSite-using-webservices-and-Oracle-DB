<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="contact.aspx.cs" Inherits="CheckUp.contact" EnableEventValidation="false"%>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <script src='https://maps.googleapis.com/maps/api/js?v=3.exp'>  </script>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <body style="background-color:#F0F0F0">


   <%--<div style="overflow:hidden;height:352px;width:100%;margin-top:160px">
    <div id='gmap_canvas' style='height:352px;width:100%;'></div>
    <style>#gmap_canvas img
{
    max-width:none!important;
    background:none!important;
    width:100%;


}

    </style>

   </div>
   --%>  
        <div style="margin-top:-20px">
        <iframe frameborder="0" scrolling="no" marginheight="1" zoomControl="false"  panControl="false" marginwidth="1" width="100%" height="400" src="https://maps.google.com/maps?hl=en&q=Jaypee Institute of Information Technology,A-10,Sector-62, Noida&ie=UTF8&t=roadmap&z=7&iwloc=B&output=embed"><div><small><a href="http://embedgooglemaps.com">embedgooglemaps.com</a></small></div><div><small>CheckUp</small></div></iframe>
            </div>
    <%--<script type='text/javascript' src='Scripts/script.js'>
</script><script type='text/javascript'>
                 function init_map()
                 {
                     var myOptions = { zoom: 12, center: new google.maps.LatLng(28.53099175828363, 77.45282459570309), mapTypeId: google.maps.MapTypeId.ROADMAP };
                     map = new google.maps.Map(document.getElementById('gmap_canvas'), myOptions);
                     marker = new google.maps.Marker({ map: map, position: new google.maps.LatLng(28.53099175828363, 77.45282459570309) });
                     infowindow = new google.maps.InfoWindow({ content: '<strong>Checkup </strong><br>A-10, Sector-62, Jaypee Institute of Information Technology<br>201301, Noida<br>' });
                     google.maps.event.addListener(marker, 'click', function () { infowindow.open(map, marker); });
                     infowindow.open(map, marker);
                 } google.maps.event.addDomListener(window, 'load', init_map);
    </script>
    --%>
        
        
        
         <div style="float:left;width:970px;height:600px;box-shadow:5px 5px 5px #888888;margin-left:200px;margin-top:20px;background-color:#fff">
        
         <div style="margin-left:600px;margin-top:30px;height:550px;width:290px;background-image:url('/img/back.jpg')">
            &nbsp &nbsp &nbsp &nbsp  &nbsp
              <h4 style="font-family:SeasideResortNF;color:#44c767;margin-left:20px"><b>EMAIL</b></h4>
                <h4 style="font-family:Hero;color:#000000;margin-left:20px">checkup.weforyou@gmail.com</h4>
             <br />
             <br />
             <h4 style="font-family:SeasideResortNF;color:#44c767;margin-left:20px"><b>TELEPHONE</b></h4>
             <h4 style="font-family:Hero;color:#000000;margin-left:20px">+91 - 9811579690</h4>
             <br />
             <br />
              <h4 style="font-family:SeasideResortNF;color:#44c767;margin-left:20px"><b>SKYPE</b></h4>
               <h4 style="font-family:Hero;color:#000000;margin-left:20px">@checkup</h4>
             <br />
             <br />
             <h4 style="font-family:SeasideResortNF;color:#44c767;margin-left:20px"><b>ADDRESS</b></h4>
                            <h4 style="font-family:Hero;color:#000000;margin-left:20px">A-10, Sector-62 <br /> Jaypee Institute of Information Technology
                                <br /> Noida, U.P
                            </h4>

        </div>
         <div>

   <form>
               <div style="margin-top:-550px;width:550px;margin-left:10px">
                   <h2 style="font-family:Pacifico;color:#1fa2ee"> Contact Us</h2>
                    <p style="font-family:Hero"> We are here to answer any questions you may have about our Checkup experiences.<br /> Reach out to us and we'll respond as soon as we can.<br />
                    Even if there is something you have always wanted to experience and can't find it on Checkup, let us know and we promise we'll do our best to find it for you and send you there.
                </p>
                   </div>
	      <div class="field name-box" style="margin-top:35px;margin-left:60px">
		      <label for="name" style="font-family:Quicksand;font-size:20px;color:#1fa2ee">Name</label>  
              <input type="text" id="name" placeholder="Who Are You?" style="width:400px;height:40px;"/>
        		
	      </div>

	      <div class="field email-box" style="margin-left:60px">
		         <label for="email" style="font-family:Quicksand;font-size:20px;color:#1fa2ee">Email</label> 
               <input type="text" id="email" placeholder="name@email.com"  style="width:400px;height:40px;"/>
		       
		        
	      </div>

	      <div class="field msg-box" style="margin-left:60px">
		      <label for="msg" style="font-family:Quicksand;font-size:20px;color:#1fa2ee">Message</label>  
              <textarea id="msg" rows="4" placeholder="Your message goes here..."  style="width:400px"/></textarea>
		        
		        
	      </div>
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
        <asp:Label ID="lblmsg" runat="server" Visible="false" style="margin-left:60px"></asp:Label>
         <br />
       <asp:Button ID="Button1" runat="server" Text="Send" class="myButton" style="margin-left:130px;margin-top:30px" OnClick="Button1_Click"/>
	      
       
  </form>


         </div>

    </div>
        
       
    </body>
</asp:Content>
