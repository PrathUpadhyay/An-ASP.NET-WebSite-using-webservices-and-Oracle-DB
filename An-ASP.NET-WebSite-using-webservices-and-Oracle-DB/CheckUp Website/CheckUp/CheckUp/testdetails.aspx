<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="testdetails.aspx.cs" Inherits="CheckUp.testdetails" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


      <meta name="viewport" content="width=device-width, initial-scale=1"/>
   
 
    <script src="Scripts/jquery.mini.js"></script>
  
      <style type="text/css">
.col-md-9{
  padding:5px;
}
.col-md-3{
  padding:5px ;
}
.innerarea{
border-radius: 5px;
padding: 5px;

}
.same{
  font-family: Pacifico;
  color: Orange;
}
.ch-grid {
  margin: 20px 0 0 0;
  padding: 0;
  list-style: none;
  display: block;
  text-align: center;
  width: 100%;
  margin-left: 0px
}

.ch-grid:after,
.ch-item:before {
  content: '';
    display: table;
}

.ch-grid:after {
  clear: both;
}

.ch-grid li {
  width: 180px;
  height: 180px;
  display: inline-block;
  margin: 0px;
}
.ch-item {
  width: 100%;
  height: 100%;
  border-radius: 50%;
  overflow: hidden;
  position: relative;
  cursor: default;
  box-shadow: 
    inset 0 0 0 16px rgba(255,255,255,0.6),
    0 1px 2px rgba(0,0,0,0.1);
  transition: all 0.4s ease-in-out;
}
.ch-img-1 { 
  background-image: url('1.png');
  margin-left: 20px
  
}
.ch-img-2{
background-image: url('2.png');
margin-left: 20px;
}
.ch-img-3{
background-image: url('3.png');
margin-left: 20px;
}
.ch-info {
  position: absolute;
  background: rgba(63,147,147, 0.8);
  width: inherit;
  height: inherit;
  border-radius: 100%;
  overflow: hidden;
  opacity: 0;
  transition: all 0.4s ease-in-out;
  transform: scale(0);
}
.ch-info h3 {
  color: #fff;
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: 22px;
  margin: 0 30px;
  padding: 45px 0 0 0;
  height: 140px;
  font-family: 'Open Sans', Arial, sans-serif;
  text-shadow: 
    0 0 1px #fff, 
    0 1px 2px rgba(0,0,0,0.3);
}
.ch-info p {
  color: #fff;
  padding: 10px 5px;
  font-style: italic;
  margin: 0 30px;
  font-size: 12px;
  border-top: 1px solid rgba(255,255,255,0.5);
  opacity: 0;
  transition: all 1s ease-in-out 0.4s;
}
.ch-item:hover {
  box-shadow: 
    inset 0 0 0 1px rgba(255,255,255,0.1),
    0 1px 2px rgba(0,0,0,0.1);
}
.ch-item:hover .ch-info {
  transform: scale(1);
  opacity: 1;
}
.ch-item:hover .ch-info p {
  opacity: 1;
}
.grid {
  padding: 20px 20px 100px 20px;
  max-width: 1300px;
  margin: 0 auto;
  list-style: none;
  text-align: center;
}

.grid li {
  display: inline-block;
  width: 440px;
  margin: 0;
  padding: 20px;
  text-align: left;
  position: relative;
}
.grid figure {
  margin: 0;
  position: relative;
}
.grid figure img {
  max-width: 100%;
  display: block;
  position: relative;
}
.grid figcaption {
  position: absolute;
  top: 0;
  left: 0;
  padding: 20px;
  background: #2c3f52;
  color: #ed4e6e;
}
.grid figcaption h3 {
  margin: 0;
  padding: 0;
  color: #fff;
}

.grid figcaption span:before {
  content: 'by ';
}

.grid figcaption a {
  text-align: center;
  padding: 5px 10px;
  border-radius: 2px;
  display: inline-block;
  background: #ed4e6e;
  color: #fff;
}
@media screen and (max-width: 31.5em) {
  .grid {
    padding: 10px 10px 100px 10px;
  }
  .grid li {
    width: 100%;
    min-width: 300px;
  }
}
.cs-style-1 figcaption {
  height: 100%;
  width: 100%;
  opacity: 0;
  text-align: center;
  backface-visibility: hidden;
  transition: transform 0.3s, opacity 0.3s;
}
.no-touch .cs-style-1 figure:hover figcaption,
.cs-style-1 figure.cs-hover figcaption {
  opacity: 1;
  transform: translate(15px, 15px);
}
.cs-style-1 figcaption h3 {
  margin-top: 70px;
}

.cs-style-1 figcaption span {
  display: block;
}

.cs-style-1 figcaption a {
  margin-top: 30px;

}
.icon_result{ text-transform: uppercase;
      float: left;
      width: 308px;
      text-align: left;
      margin: 0px 10px 10px 0px;
      padding: 10px; font-size:14px;
      border: 1px dashed #CCCCCC;font-family: 'open_sansregular';
      background-color: #eee;
     min-height: 118px;}
      .icon_result img{ float:left; border:1px solid #CCCCCC; padding:2px; margin:5px 5px 5px 0px;} 

      .icon_result:hover{
        background-color: #FFF; 
      }

     .demo
{
    margin: 0px;
    background-color: #FFFFFF;
    border-radius: 5px;
    width: 260px;
    height: 170px;
    padding: 0px;
    position: relative;
    overflow: hidden;
    -webkit-transition: all 1000ms cubic-bezier(0.005, 1, 1.000, 0); /* older webkit */
    -webkit-transition: all 1000ms cubic-bezier(0.005, 1.650, 1.000, -0.600);
    -moz-transition: all 1000ms cubic-bezier(0.005, 1.650, 1.000, -0.600);
    -ms-transition: all 1000ms cubic-bezier(0.005, 1.650, 1.000, -0.600);
    -o-transition: all 1000ms cubic-bezier(0.005, 1.650, 1.000, -0.600);
    transition: all 1000ms cubic-bezier(0.005, 1.650, 1.000, -0.600); /* custom */
    -webkit-transition-timing-function: cubic-bezier(0.005, 1, 1.000, 0); /* older webkit */
    -webkit-transition-timing-function: cubic-bezier(0.005, 1.650, 1.000, -0.600);
    -moz-transition-timing-function: cubic-bezier(0.005, 1.650, 1.000, -0.600);
    -ms-transition-timing-function: cubic-bezier(0.005, 1.650, 1.000, -0.600);
    -o-transition-timing-function: cubic-bezier(0.005, 1.650, 1.000, -0.600);
    transition-timing-function: cubic-bezier(0.005, 1.650, 1.000, -0.600); /* custom */
}

.show-off
{
    width: 500px;
    height: 500px;
    position: absolute;
    top: -180px;
    left: -600px;
    -moz-transition: 1s;
    -webkit-transition: 1s;
    -o-transition: 1s;
    transition: 1s;
    -moz-transform: rotate(30deg);
    -webkit-transform: rotate(30deg);
    -o-transform: rotate(30deg);
    transform: rotate(30deg);
    background: linear-gradient(0deg, rgba(255, 255, 255, 0)50%, rgba(255, 255, 255, 0.7)100%);
    background: -moz-linear-gradient(0deg, rgba(255, 255, 255, 0)50%, rgba(255, 255, 255, 0.7)100%);
    background: -webkit-linear-gradient(0deg, rgba(255, 255, 255, 0)50%, rgba(255, 255, 255, 0.7)100%);
    background: -o-linear-gradient(0deg, rgba(255, 255, 255, 0)50%, rgba(255, 255, 255, 0.7)100%);
}
.demo:hover .show-off
{
    top: 0px;
    left: 0px;
    -moz-transform: rotate(0deg);
    -webkit-transform: rotate(0deg);
    -o-transform: rotate(0deg);
    transform: rotate(0deg);
}
.demo:hover
{
    box-shadow: 0px 0px 20px 5px #FFFFFF;
    -webkit-box-shadow: 0px 0px 20px 5px #FFFFFF;
    -moz-box-shadow: 0px 0px 20px 5px #FFFFFF;
    -o-box-shadow: 0px 0px 20px 5px #FFFFFF;
}
   </style>



</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">


    <div class="container" style="width:83%;padding:5px;background-color:#FFF;margin-top:-85px;">

      
    <div class="row-1">
    <div class="col-sm-12 col-md-9" style="border:1px solid #E6E6E6;border-radius:6px;padding:5px;margin-top:115px;height:300px">
      <div class="innerarea" style="margin-top:10px">
          <span style="font-family:Calibri;white-space:nowrap;font-size:29px;">
            <asp:label ID="Label3" runat="server"> </asp:label></span><br />
        <asp:Label ID="labelname1" runat="server"></asp:Label>
<br />
          <p style="font-size:15px;margin-left:2px"><asp:label ID="Label4" runat="server"> </asp:label></p>
      </div>
      <hr/>
      <div id="content-division" style="padding:7px;">
              <div id="hospital-image">
                  <img src="C:\Users\Lenovo\Desktop\healthian_files\ExpressClinicsPrivateLimited1208457226-express-clinic.jpg" alt="Diagnostic Lab Image" Title="Diagnostic Lab" class="img-thumbnail"/>
                </div>
                <div id="features" style="margin-left:90px;margin-top:-40px">
                    <ul style="list-style-type: none;">
                       <li><img src="img/Check_mark.png" alt="sorry" style="height:30px;width:30px"/><span class="glyphicon glyphicon-pushpin" style="color:orange"></span> &nbsp Home Sample Collection Available   &nbsp &nbsp &nbsp&nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp &nbsp &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp<img src="img/brief.png" alt="sorry" style="height:30px;width:30px" /></li>
                        
             
            <li><img src="img/Check_mark.png" alt="sorry" style="height:30px;width:30px"/> <%--<span class="glyphicon glyphicon-pushpin" style="color:orange"></span>--%>&nbsp Female Staff Available</li>
             
            <li><img src="img/Check_mark.png" alt="sorry" style="height:30px;width:30px"/><span class="glyphicon glyphicon-pushpin" style="color:orange"></span>&nbsp You will get your Reports within 48 hours</li>
                    </ul>
                </div>
               

                       </div>

         
           <%-- <div class="row2">
           

            <ul class="ch-grid" s>
             <li>  
           <div class="ch-item ch-img-1" style="margin-left:-410px">
            <div class="ch-info">
             <h3>Location</h3>
             </div>
            </div>
            </li>
            </ul>


       

            <ul class="ch-grid">
             <li>  
           <div class="ch-item ch-img-2">
            <div class="ch-info">
             <h3>Use what you have</h3>
                 
             </div>
            </div>
            </li>
            </ul>
          

          

            <ul class="ch-grid">
             <li>  
           <div class="ch-item ch-img-3">
            <div class="ch-info">
             <h3>Use what you have</h3>
             </div>
            </div>
            </li>
            </ul>
         
        </div>--%>

    </div>
    
  
       <div class="col-xs-12 col-md-3" style="border-left: 0px none;margin-left:800px;margin-top:-300px;">
       <div class="rightcart-area" style="font-family:calibri;padding:10px;background-color:#F8F8F8;border:1px solid #C0C0C0 ;border-radius:5px;height: 280px ">
        
      <div class="clear"></div>
      <div class="price-display">
        <div class="wrongprice" style="color:red;font-size:20px" >MRP : <asp:Label ID="originalprice" runat="server" Text="Label" style="text-decoration:line-through;"></asp:Label><br /><br /></div>
        <div class="main-price" style="font-size:30px;font-family:Times New Roman">&nbsp &nbsp<b>Rs. <asp:label ID="newprice" runat="server"> </asp:label>/-</b><br /><br /></div>
        
        <div class="saving"style="font-size:20px;font-family:Times New Roman;font-weight:bolder;color:green;">SAVE &nbsp;&nbsp;&nbsp;Rs.<asp:label ID="Label2" runat="server" style="font-size:20px;font-family:Times New Roman;color:green;"> </asp:label>/-<br/>
          </div>

           <%-- <label class="checkbox-inline">
                    <asp:CheckBox ID="family" runat="server" OnCheckedChanged="family_CheckedChanged" AutoPostBack="true"/><b style="color:darkgreen;">Book Test For Family</b></label><a href="FamilyAccount.aspx"><br /><asp:Label ID="Label7" runat="server" Text="No family member added.Add some." Visible="false"></asp:Label></a>
          --%>
         <!--  <div class="addto-wish"><a href="#">Add to wish</a></div>
       </div> -->
       <div class="clear"></div>
         
       <div class="payment" >
                  <div class="payat"><a id="four" class="deal-custom-tooltip" title="Confirm your booking &amp; Pay at the time of Sample Collection">&nbsp &nbsp &nbsp &nbsp<%--<img src="/img/untitled.png" style="float:right;margin-top:-150px"/>--%></a></div>

      
           <style>

       .btn {
  background: #3498db;
  background-image: -webkit-linear-gradient(top, #3498db, #2980b9);
  background-image: -moz-linear-gradient(top, #3498db, #2980b9);
  background-image: -ms-linear-gradient(top, #3498db, #2980b9);
  background-image: -o-linear-gradient(top, #3498db, #2980b9);
  background-image: linear-gradient(to bottom, #3498db, #2980b9);
  -webkit-border-radius: 7;
  -moz-border-radius: 7;
  border-radius: 7px;
  font-family: Arial;
  color: #ffffff;
  font-size: 20px;
  padding: 11px 20px 10px 20px;
  text-decoration: none;
  margin-top:-30px
}

.btn:hover {
  background: #3cb0fd;
  text-decoration: none;
}        </style>
           <br />
           <br />
     &nbsp  &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp <asp:Button ID="Button1" CssClass="btn" runat="server" OnClick="booktest"  Text="Book Now"/>
            <%--<button type="button" class="btn btn-success" style="width:170px;font-size:25px"> Book Now</button>--%>
                </div>
    </div>

    <div class="clear"></div>
  </div>
 <%-- <div class="demo" style="height:170px">
    <a href="#"><img src="C:\Users\Lenovo\Desktop\map.png" style="width:245px;height:159px;border-radius:5px;margin-top:10px;white-space:nowrap;float:left;margin-left:-10px"></a>
    <div class="show-off"></div>
  </div>--%>
    </div>
  </div>


<br>
<br>
      <br />
      <br />
      <br />

    <div class="data-test-detail" style="width:80%;padding:10px;margin-top:-90px;width:50%">
  <h2 ><span style="color:#3385FF;font-family:Pacifico;text-shadow: 2px 2px 5px Orange;">Why should you take this test</span></h2>
  <canvas id="myCanvas" width="598" height="160" style="white-space:nowrap"></canvas>
    <script>
      var canvas = document.getElementById('myCanvas');
      var context = canvas.getContext('2d');

      context.beginPath();
      context.moveTo(10, 0);
      context.lineTo(355, 0);
      context.lineWidth = 7;

      // set line color
      context.strokeStyle = '#FF704D';
      context.stroke();
    </script>
    <script type="text/javascript">
  $(function() {
    $( "#accordion" ).accordion({
      autoHeight: false,
      navigation: true, collapsible: true,active:false
    });
  });
  </script>
  

  <div style="margin-top:-140px;">
  <table class="table table-striped" style=" border: 1px dotted #DBDBDB;width:89%">
    <thead>
      <tr style=" border: 1px solid #DBDBDB;">
        <th width="50%" style=" border: 1px dotted #DBDBDB;text-align:center">Men</th>
        <th width="50%" style=" border: 1px dotted #DBDBDB;text-align:center">Women</th>
      </tr>
    </thead>
    <tbody>
      <tr style=" border: 1px dotted #DBDBDB;text-align:center">
         <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png"> &nbsp;0 to 18 years</td>
        <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png">&nbsp;0 to 18 years</td>
      </tr>
      <tr style=" border: 1px dotted #DBDBDB;text-align:center">
         <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png"> &nbsp;18 to 25 years</td>
        <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png">&nbsp;18 to 25 years</td>
      </tr>
      <tr style=" border: 1px dotted #DBDBDB;text-align:center">
         <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png"> &nbsp;25 to 35 years</td>
        <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png">&nbsp;25 to 35 years</td>
      </tr>

      <tr style=" border: 1px dotted #DBDBDB;text-align:center">
        <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png"> &nbsp;35 to 45 years</td>
        <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png">&nbsp;35 to 45 years</td>
      </tr>
        
      <tr style=" border: 1px dotted #DBDBDB;text-align:center">
        <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png"> &nbsp;45 and above</td>
        <td style=" border: 1px dotted #DBDBDB;"><img width="16" height="13" src="./img/test-tick.png">&nbsp;45 and above</td>
      </tr>
    </tbody>
  </table>
  </div>
  </div>

 <div class="data-test-detail" style="padding:15px;float:right;width:50%;margin-top:-360px">
    <h2><span style="color:#3385FF;font-family:Pacifico;text-shadow: 2px 2px 5px Orange;">Precautions</span></h2>
    <canvas id="myCanvas1" width="598" height="160" style="white-space:nowrap"></canvas>
    <script>
      var canvas = document.getElementById('myCanvas1');
      var context = canvas.getContext('2d');

      context.beginPath();
      context.moveTo(10, 0);
      context.lineTo(140, 0);
      context.lineWidth = 7;

      // set line color
      context.strokeStyle = '#FF704D';
      context.stroke();
    </script>
    <script type="text/javascript">
  $(function() {
    $( "#accordion" ).accordion({
      autoHeight: false,
      navigation: true, collapsible: true,active:false
    });
  });
  </script>
    <table width="100%" class="table_data" border="0" cellpadding="10" style=" border: 1px dotted #DBDBDB;margin-top:-140px" >
      <tbody><tr>
        <td width="20%" valign="top" bgcolor="#fafafa" style="color:#317ab2;border:1px solid #DBDBDB;padding:5px";>Precaution</td>
        <td width="80%" valign="top" bgcolor="#fafafa" style="border:1px solid #DBDBDB;padding:5px " >Avoid Consumption of Alcohol, before the test.</td>
      </tr>
      <tr>
       <td valign="top" bgcolor="#fafafa" style="color:#317ab2;border:1px solid #DBDBDB;padding:5px">Before the Test</td>
       <td valign="top" bgcolor="#fafafa" style="border:1px solid #DBDBDB;padding:5px ">Do not consume Alcohol or any drugs (especially if you are taking any iron tablets) before the test. Share your Medical records, history or concerns if any.</td>
     </tr>
     <tr>
       <td valign="top" bgcolor="#fafafa" style="color:#317ab2;border:1px solid #DBDBDB;padding:5px">After the Test</td>
       <td valign="top" bgcolor="#fafafa" style="border:1px solid #DBDBDB;padding:5px ">There is no specific advice. You may go to back to your daily routine. We advice you not to remove the cotton swab applied by the Lab Expert on the site of Blood collection for atleast 5 minutes to avoid infection.</td>
     </tr>
   </tbody></table>
 </div>


<div class="data-test-detail" style="width:81%;padding:15px;">
    <h2><span style="color:#3385FF;font-family:Pacifico;text-shadow: 2px 2px 2px Orange">Merchant Details</span></h2>
    <canvas id="myCanvas2" width="598" height="160" style="white-space:nowrap"></canvas>
    <script>
      var canvas = document.getElementById('myCanvas2');
      var context = canvas.getContext('2d');

      context.beginPath();
      context.moveTo(10, 0);
      context.lineTo(190, 0);
      context.lineWidth = 7;

      // set line color
      context.strokeStyle = '#FF704D';
      context.stroke();
    </script>
    <script type="text/javascript">
  $(function() {
    $( "#accordion" ).accordion({
      autoHeight: false,
      navigation: true, collapsible: true,active:false
    });
  });
  </script>
    <table width="100%" class="table_data" border="0" cellpadding="10" style=" border: 1px dotted #DBDBDB;margin-top:-140px" >
      <tbody><tr>
        <td width="20%" valign="top" bgcolor="#fafafa" style="color:#317ab2;border:1px solid #DBDBDB;padding:5px";>Center Name</td>
        <td width="80%" valign="top" bgcolor="#fafafa" style="border:1px solid #DBDBDB;padding:5px " > <asp:Label ID="label1" runat="server" ></asp:Label></td>
      </tr>
      <tr>
       <td valign="top" bgcolor="#fafafa" style="color:#317ab2;border:1px solid #DBDBDB;padding:5px">About Merchant</td>
       <td valign="top" bgcolor="#fafafa" style="border:1px solid #DBDBDB;padding:5px "><asp:label ID="Label5" runat="server"> </asp:label></td>
     </tr>
     <tr>
       <td valign="top" bgcolor="#fafafa" style="color:#317ab2;border:1px solid #DBDBDB;padding:5px">Main Address</td>
       <td valign="top" bgcolor="#fafafa" style="border:1px solid #DBDBDB;padding:5px "><asp:label ID="Label6" runat="server"> </asp:label></td>
     </tr>
   </tbody></table>
 </div>
<!--  <ul class="grid cs-style-1">
  <li>
    <figure>
      <img src="C:\Users\Lenovo\Desktop\Consulting.jpg" alt="img01">
      <figcaption>
        <h3>Camera</h3>
        <span>Jacob Cummings</span>
        <a href="http://dribbble.com/shots/1115632-Camera">Take a look</a>
      </figcaption>
    </figure>
  </li>
</ul -->



<div class="data-test-detail" style="width:100%;padding:20px;">
    <h2><span style="color:#3385FF;font-family:Pacifico;text-shadow: 2px 2px 2px Orange;">Results</span></h2>
    <canvas id="myCanvas3" width="598" height="160" style="white-space:nowrap"></canvas>
    <script>
      var canvas = document.getElementById('myCanvas3');
      var context = canvas.getContext('2d');

      context.beginPath();
      context.moveTo(10, 0);
      context.lineTo(90, 0);
      context.lineWidth = 7;

      // set line color
      context.strokeStyle = '#FF704D';
      context.stroke();
    </script>
    

<div class="row3" style="margin-top:-140px; ">
<div class="col-md-4">
<a href="faq.aspx"><div class="icon_result"><b>Time taken to generate reports ?</b><br/>
              <img src="./img/day2.jpg" title="2"/> 
            </div></a> 
</div>
<a href="faq.aspx"><div class="col-md-4">
 <div class="icon_result"><b>How is the Test report shared with patients ?</b> 
                <img src="./img/gmail-icon.jpg" title="Email"> 
              </div>
</div> </a>
<div class="col-md-4">
        <a href="faq.aspx">     <div class="icon_result"><b>When to repeat test ?</b> <br> 
              <p style="text-transform:none; margin:0px;font-size: 14px;font-family:calibri;  line-height: 19px;"><img src="./img/2months.jpg" title="2 Monthly"> Please consult your Doctor, however according to our Medical Experts it is advised to repeat this Test.</p>
            </div> </a>
 </div>



</div>


<!--Code for Making a shine in the image-->
 <!-- <div class="demo">
    
            <img src="C:\Users\Lenovo\Desktop\Consulting.jpg" alt="" />
    <div class="show-off">
    </div>        
 </div> -->
</div><br>


   

</div>   <!--End of the main Div-->


</asp:Content>
