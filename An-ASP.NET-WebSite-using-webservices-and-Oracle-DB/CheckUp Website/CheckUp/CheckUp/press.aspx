<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="press.aspx.cs" Inherits="CheckUp.press" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

     <meta charset="UTF-8" />
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"/> 
      
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
      
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <body>

              <h1 style="font-family:Pacifico;color:#0094ff;text-shadow: 2px 2px #f3d20b;margin-top:50px;margin-left:300px">&nbsp Press</h1>
      <style>
          .box{
              border-radius: 41px 41px 41px 41px;
-moz-border-radius: 41px 41px 41px 41px;
-webkit-border-radius: 41px 41px 41px 41px;
border: 2px dashed rgba(198,255,117,1);
padding:10px;
background: rgba(219,255,168,0.97);
background: -moz-linear-gradient(left, rgba(219,255,168,0.97) 0%, rgba(255,255,255,0.99) 51%, rgba(219,255,168,1) 100%);
background: -webkit-gradient(left top, right top, color-stop(0%, rgba(219,255,168,0.97)), color-stop(51%, rgba(255,255,255,0.99)), color-stop(100%, rgba(219,255,168,1)));
background: -webkit-linear-gradient(left, rgba(219,255,168,0.97) 0%, rgba(255,255,255,0.99) 51%, rgba(219,255,168,1) 100%);
background: -o-linear-gradient(left, rgba(219,255,168,0.97) 0%, rgba(255,255,255,0.99) 51%, rgba(219,255,168,1) 100%);
background: -ms-linear-gradient(left, rgba(219,255,168,0.97) 0%, rgba(255,255,255,0.99) 51%, rgba(219,255,168,1) 100%);
background: linear-gradient(to right, rgba(219,255,168,0.97) 0%, rgba(255,255,255,0.99) 51%, rgba(219,255,168,1) 100%);
filter: progid:DXImageTransform.Microsoft.gradient( startColorstr='#dbffa8', endColorstr='#dbffa8', GradientType=1 );
          }
      </style>
      <div class="box" style="margin-top:50px;float:left;margin-left:50px;width:300px;height:590px">
            
          <img src="img/health.png"  style="height:80px;width:100px;margin-left:-10px"/>
          <h4 style="margin-left:90px;margin-top:-50px;font-family:Georgia, 'Times New Roman', Times, serif;font-size:20px;color:#ff6a00">FEATURED MEDIA</h4>
          
          <br /> <ul>
              <li><p id="order" runat="server"></p></li>                 

           </ul>

      </div>
      <div style="margin-left:400px;margin-top:10px;height:900px;width:850px;padding:10px;background-color:#FFF ">

          <div style="width:830px;height:100px;border-radius:5px">
              <div style="float:left;width:100px;height:200px">
                  
                  <img src="img/jobs.png" />
                 

              </div>
              <h6><a id="headin" style="color:red" runat="server" href="http://www.metropolisindia.com/news/testing-high-on-profit-levels"></a></h6>
               <span style="font-family:Georgia, 'Times New Roman', Times, serif"> With rapid commercialization in the healthcare and diagnostics industry, the demand for path labs has led to massive boom in India. This is the right time to set up a diagnostic lab but are you being sceptical whether this venture of yours will be a hit or miss?   </span>
             
          </div>
          <br />
          <br />
           <div style="width:830px;height:100px;border-radius:5px">
              <div style="float:left;width:100px;height:200px;margin-left:-100px">
                  
                  <img src="img/diabetes.jpg" style="float:left" />
                 

              </div>
              <h6><a id="headin1" runat="server" href="http://www.metropolisindia.com/news/sugar-disease-growing-at-alarming-rate-in-india-metropolis-study"></a></h6>
               <span style="font-family:Georgia, 'Times New Roman', Times, serif"> The in depth analysis revealed that over 60% of all samples from; male and 51% of samples from female were diabetic. In addition over 28% of the samples analyses from children between the age group 0-12 was found to be diabetic.  </span>

          </div>
          <br />
          <br />
             <div style="width:830px;height:100px;border-radius:5px">
              <div style="float:left;width:100px;height:300px;margin-left:-100px">
                  
                  <img src="img/dia.jpg" style="height:80px" />
                 

              </div>
              <h6><a id="headin2" runat="server" href="http://www.metropolisindia.com/news/fiftyseven-women-fiftynine-men-between-thirty-fifty-years-as-diabetic"></a></h6>
               <span style="font-family:Georgia, 'Times New Roman', Times, serif"> A comprehensive analysis of over 41,083 samples in Bengaluru that were processed for fasting blood sugar for over the last three years has revealed that 13213 men and 10356 women are diabetic.   </span>

          </div>
          <br />
          <br />
           <div style="width:830px;height:100px;border-radius:5px">
              <div style="float:left;width:100px;height:200px;margin-left:-100px">
                  
                  <img src="img/vitamin1.png" />
                 

              </div>
              <h6><a id="headin3" runat="server" href="http://www.metropolisindia.com/news/seven-out-of-ten-indians-deficient-in-vitamins"></a></h6>
               <span style="font-family:Georgia, 'Times New Roman', Times, serif"> A recent study shows that seven out of every 10 Indians are deficient in vitamins. In an analysis of over 14,96,683 patients who underwent vitamins tests, it was found that 81.28 per cent of all samples tested were deficient in Vitamin D, 21.02 per cent of all sam­ples tested were deficient in Vitamin B12.  </span>

          </div>
          <br />
          <br />
           <div style="width:830px;height:100px;border-radius:5px">
              <div style="float:left;width:100px;height:200px;margin-left:-100px">
                  
                  <img src="img/heart.jpg" />
                 

              </div>
              <h6><a id="headin4" runat="server"  href="http://www.metropolisindia.com/news/one-of-india-s-biggest-killers-is-heart-disease"> </a></h6>
               <span style="font-family:Georgia, 'Times New Roman', Times, serif"> According to a recent World Health Organization (WHO) data, one in three Indians suc­cumb to cardiovascular diseases and an increasing number of individuals less than 40 years of age are developing cardiac dis­ease or risk factors associated with such disease.</span>

          </div>
          <br />
          <br />
           <div style="width:830px;height:100px;border-radius:5px">
              <div style="float:left;width:100px;height:200px;margin-left:-100px">
                  
                  <img src="img/women.jpg" />
                 

              </div>
              <h6><a id="headin5" runat="server" href="http://www.metropolisindia.com/news/about-eighteen-per-cent-women-in-india-affected-by-pcos"></a></h6>
               <span style="font-family:Georgia, 'Times New Roman', Times, serif"> A recent study revealed that about 18 per cent of women in India, mostly from the East, suffer from Polycystic Ovarian Syndrome (PCOS), a disorder which causes infertility among women.
                   Polycystic Ovarian Syndrome is a prevalent endocrine disorder in women and the leading cause of infertility now days.
               </span>

          </div>
          <br />
          <br />
           <div style="width:830px;height:100px;border-radius:5px">
              <div style="float:left;width:100px;height:200px;margin-left:-100px">
                  
                  <img src="img/flood.jpg" />
                 

              </div>
              <h6><a id="headin6" runat="server" href="http://www.metropolisindia.com/news/health-activists-survey-flood-areas-identify-five-hotspots"></a></h6>
               <span style="font-family:Georgia, 'Times New Roman', Times, serif">Floods are always associ­ated with an increased risk of infection. To spread awareness about vec­tor-borne and water borne diseases and to prevent their outbreaks, a team of health activists from Indian Public Health Association conduct­ed ..
               </span>

          </div>
          <br />
           <div id="hea" runat="server" style="text-decoration:none">
               <div id="para" runat="server">

               </div>

              </div>



      </div>

    
</body>

</asp:Content>
