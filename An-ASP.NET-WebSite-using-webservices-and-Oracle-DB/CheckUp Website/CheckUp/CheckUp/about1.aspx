<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="about1.aspx.cs" Inherits="CheckUp.about1" %>









<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>

     <style>
         .intro-body{
             z-index:1000;
             position:absolute;
             background-color:#FCFFE5;
         }
     .video_div
{
    /*z-index: -1000;*/
   width:1366px;
  opacity:0.5;
  background-color:#FCFFE5;
   height:768px;
   z-index:-1000;
}
    </style>
    <script src="About/jquery-2.1.1.min.js"></script>

<link href="About/ohover.css" rel="stylesheet" />
<link href="About/main.css" rel="stylesheet" />

   <style>
       body{
           overflow-x:hidden;
           background-color:#FCFFE5;
       }
   </style>

</head>

<body>
   <form runat="server">
   
    <section class="intro">
        <%--<div class="intro-body">
            <div class="container">
                <div class="row">
                    <div class="col-md-8 col-md-offset-2">
                        <h1 class="brand-heading">THE CRESCENDO</h1>
                        <div class="page-scroll">
                            <a href="#navigate" class="btn btn-circle">
                                <i class="fa fa-angle-double-down animated"></i>
                            </a>
                        </div>
                    </div>
                </div>
            </div>
        </div>--%>
        <%--<div class="video_div">
             <embed src="About/Not Liking One's Looks.webm" autoplay="autoplay" loop="loop" runat="server" width="1400" height="650" muted="muted"/>
        </div>--%>
    <%--</section>--%>

    
 <!-- Right to left-->
        <div class="intro-body">
            <table>
                <tr style="margin-left:562px;margin-top:-25px;font-family:'Comic Sans MS';font-weight:bolder;color:darkblue;font-size:1.6rem;display:inline-block">
  <td><h2>Team</h2></td>
      <td style="padding-top:30px;">  <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="~/img/logoo.png" Width="150px" Height="100px" style="display:inline-block;" OnClick="ImageButton1_Click"/></td>
              </tr>
        </table>
                 
                <div style="margin:-10px 50px 0px 50px;position:absolute;">
                <div style="float:right;margin-left:1000px;">
                  <!-- normal -->
                  <div class="item-hover circle effect3 right_to_left"><a href="about1.aspx">
                      <div class="img"><img src="About/prath.jpg" alt="img"/></div>
                      <div class="info">
                        <h3>Prathamesh Upadhyay</h3>
                        <p>Email: despairdarkness@gmail.com</p>
                      </div></a></div>
                  <!-- end normal -->
                </div>
               

                   <div style="float:left;position:absolute;margin-left:20px;">
                  <!-- normal -->
                  <div class="item-hover circle effect3 right_to_left"><a href="about1.aspx">
                      <div class="img"><img src="About/himan.jpg" alt="img"/></div>
                      <div class="info">
                        <h3>Himanshu Garg</h3>
                        <p>Email: sunnyfunny_23@yahoo.co.in</p>
                      </div></a></div>
                  <!-- end normal -->
                </div>

                  <br /><br /><br /><br /><br />
                 
                  <br /><br /><br /><br /><br /><br />

                   <div style="float:right;margin-right:200px;">
                  <!-- normal -->
                  <div class="item-hover circle effect3 right_to_left"><a href="about1.aspx">
                      <div class="img"><img src="About/pranay.jpg" alt="img"/></div>
                      <div class="info">
                        <h3>Pranay Karnatak</h3>
                        <p>Email: pranaykarnatak@gmail.com</p>
                      </div></a></div>
                  <!-- end normal -->
                </div>

                   <div style="float:left;margin-left:200px;">
                  <!-- normal -->
                  <div class="item-hover circle effect3 right_to_left"><a href="about1.aspx">
                      <div class="img"><img src="About/sid.jpg" alt="img"/></div>
                      <div class="info">
                        <h3>Siddharth Nagaria</h3>
                        <p>Email: siddharthnagaria12@gmail.com</p>
                      </div></a></div>
                  <!-- end normal -->
                </div>
                  <br /><br /><br /><br /><br /><br /><br /><br /><br /><br /><br />
                   <div style="margin-left:520px;position:absolute;">
                  <!-- normal -->
                  <div class="item-hover circle effect3 right_to_left"><a href="about1.aspx">
                      <div class="img"><img src="About/dhairya.jpg" alt="img"/></div>
                      <div class="info">
                        <h3>Dhairya Goyal</h3>
                        <p>Email: gyldhairya@gmail.com</p>
                      </div></a></div>
                  <!-- end normal -->
                </div>
              </div>
         
            </div>
     <div class="video_div">
             <video src="About/Not%20Liking%20One's%20Looks.webm" autoplay="autoplay" loop="loop" runat="server" width="1366" height="668" muted="muted"/>
        </div>
    </section>
    </form>
</body>
</html>

