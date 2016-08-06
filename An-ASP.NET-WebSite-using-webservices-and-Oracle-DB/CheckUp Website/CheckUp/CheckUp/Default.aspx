<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="CheckUp.first" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
  














    <link rel="apple-touch-icon" href="img/apple-touch-icon.png" />
    <link rel="apple-touch-icon-precomposed" href="img/apple-touch-icon.png" />
    <link rel="stylesheet" href="CSS/hover.css" /> 
   <link rel="stylesheet" media="screen" href="CSS/bootstrap.minece8.css" />  
    <link rel="stylesheet" media="screen" href="CSS/flexsliderece8.css" />
    <link rel="stylesheet" media="screen" href="CSS/spectrumece8.css" /> 
    <link rel="stylesheet" media="screen" href="CSS/style7afe.css" />
    <link rel="stylesheet" media="print" href="CSS/printece8.css" /> 
    <link rel="stylesheet" type="text/css" href="CSS/style.css" /> 
  <%--  <link rel="stylesheet" type="text/css" href="CSS/user.css" />--%> 
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />



  

    
    <script type="text/javascript" src="Scripts/swfobjectece8.js"></script>
    <script type="text/javascript" src="Scripts/browserdetectece8.js"></script>
    <script type="text/javascript" src="Scripts/iframeSizer.minece8.js"></script>
    <script type="text/javascript" src="Scripts/nyt0ser.js"></script>

    <script type="text/javascript">try { Typekit.load(); } catch (e) { }</script>
    <script type="text/javascript">
        dataLayer = [{
            "User Status": "anonymous"
        }];
    </script>
     



























</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server" class="switch-navbar-sub">
   <script type="text/javascript">(function (w, d, s, l, i) {
w[l] = w[l] || []; w[l].push({
'gtm.start':
new Date().getTime(), event: 'gtm.js'
}); var f = d.getElementsByTagName(s)[0],
j = d.createElement(s), dl = l != 'dataLayer' ? '&l=' + l : ''; j.async = true; j.src =
'Google_Tag_Manager/gtm5445.html?id=' + i + dl; f.parentNode.insertBefore(j, f);
})(window, document, 'script', 'dataLayer', 'GTM-N68R9L');</script>
 
    <div style="margin-left:2%;margin-right:2%;">
       <div class="section slideshow-container" style="width:100%;height:320px;margin-top:80px;">
            <div class="circle-wrap" style="width:33%;height:200px;">
                <div class="c">
 
  <div class="pic">
      <asp:Image ID="xyz" runat="server" ImageUrl="img/location.jpg"/>  
  </div>
  <div class="des">  
    <p>
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter Location" Height="35px" autocomplete="off" style="margin:.8em 0 0 .5em; 
            padding:.4em 0 .4em .6em;" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
        
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
         <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="TextBox1" UseContextKey="True" CompletionInterval="500" 
            MinimumPrefixLength="0" ServiceMethod="GetCompletionList" CompletionListCssClass="autocomplete_completionListElement" CompletionListItemCssClass="autocomplete_listItem" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"><%-- <%--CompletionListCssClass="autocomplete_completionListElement" 
                CompletionListItemCssClass="autocomplete_listItem" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" BehaviorID="AutoCompleteEx"--%>
               
            </cc1:AutoCompleteExtender>
       

    </p>
  </div>
</div>

            </div>
             <div class="circle-wrap" style="width:33%;height:200px;">
<div class="c">
 
  <div class="pic">
       <asp:Image ID="Image2" runat="server" ImageUrl="img/categories.jpg"/>
   
  </div>
  <div class="des">
   
    <p><asp:TextBox ID="TextBox2" runat="server" placeholder="Choose Category" Height="35px" style="margin:.8em 0 0 .5em; 
            padding:.4em 0 .4em .6em;" Enabled="False" OnTextChanged="TextBox2_TextChanged" AutoPostBack="true"></asp:TextBox>
       
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" Enabled="True" 
                    TargetControlID="TextBox2" UseContextKey="True" CompletionInterval="500" 
            MinimumPrefixLength="0" ServiceMethod="GetCompletionList1" CompletionListCssClass="autocomplete_completionListElement" 
                CompletionListItemCssClass="autocomplete_listItem" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"></cc1:AutoCompleteExtender>
    </p>
  </div>
</div>

            </div>
             <div class="circle-wrap" style="width:33%;height:200px;">
                 <div class="c">
 
  <div class="pic">
       <asp:Image ID="Image3" runat="server" ImageUrl="img/tests.jpg"/>
   
  </div>
  <div class="des">
   <p>
      
   
        <asp:TextBox ID="TextBox3" runat="server" placeholder="Pick a Test" Height="35px" style="border-top:thin solid  #e5e5e5;
            border-right:thin solid #e5e5e5;
            border-bottom:0;
            border-left:thin solid  #e5e5e5;
            box-shadow:0px 1px 1px 1px #e5e5e5;
            float:left;
            margin:.8em 0 0 .5em; 
            outline:0;
            padding:.4em 0 .4em .6em;" Enabled="False" OnTextChanged="TextBox3_TextChanged" AutoPostBack="True"></asp:TextBox>
       
<%--<p id='button-holder'>
      <%--<asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="img/magnifying_glass.png" style="margin-bottom:3px;--%>
            <%--width:20px;" OnClick="ImageButton2_Click" Enabled="false"/>
    </p>--%>
     
        <cc1:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" Enabled="True" 
                    TargetControlID="TextBox3" UseContextKey="True" CompletionInterval="500" 
            MinimumPrefixLength="0" ServiceMethod="GetCompletionList2" CompletionListCssClass="autocomplete_completionListElement" 
                CompletionListItemCssClass="autocomplete_listItem" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem"></cc1:AutoCompleteExtender>
    
</p>    
  </div>
</div>

            </div>





        </div>
        
        <div>
            <br />
            <br />
            <br />

            <style>
                .shaandar{
                    color:#28AADC;
                }

                .shaandar:hover{
                    background-color:#28AADC;
                    color:#fff;
                }
                

                

            </style>

           <p id="a" class="shaandar" runat="server" style="float:left;display:inline-block;margin-left:150px;outline:1px solid #28AADC;padding:13px;">Select Location</p>
           <p id="b" class="shaandar" runat="server" style="float:left;display:inline-block;margin-left:360px;outline:1px solid #28AADC;padding:13px;">Select Category</p>
          <p id="c" class="shaandar" runat="server" style="float:left;display:inline-block;margin-left:290px;outline:1px solid #28AADC;padding:13px;">Pick A Test</p>
        </div>

      <!--  <div class="section">
            <div class="container">
                <div class="row">
                    <div class="span12">
                        <h2 class="home-customers-heading align-center"><p style="color:darkslateblue;">Popular Tests</p></h2>

                        <div class="popular-tests">
                            <ul class="vhid">
                                <li>Google</li>
						        <li style="float:left;margin-left:20px;">Comcast</li>
						        <li style="float:left;margin-left:20px;">Microsoft</li>
						        <li style="float:left;margin-left:20px;">Cisco</li>
                                            
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div> -->

                 
                  <h2 class="home-customers-heading align-center" style="color:darkslateblue;margin-top:150px;position:relative;">Popular Tests</h2>
 
                 <div class="container abc xyz" style="width:100%;height:270px;">
			<div id="ca-container" class="ca-container">
				<div class="ca-wrapper" style="margin-top:60px;">
					<div class="ca-item ca-item-1">
						<div class="ca-item-main">
                          <asp:Label ID="Label1" runat="server" Text="Hypothyroid Test" style="font-size:1.1rem;font-weight:bold;"></asp:Label>
                            <br /><br /><asp:Label ID="Label9" runat="server" Text="Artemis Hospital" style="font-size:1.1rem;font-weight:bold;color:orange;"></asp:Label>
                            <asp:Button ID="Button1" runat="server" Text="Rs 350/-"  class="popularbutton" OnClick="Button1_Click" Width="100px" style="position:absolute;bottom:5px;left:70px;right:5px;"/>
							</div>
						</div>
						<div class="ca-item ca-item-1">
						<div class="ca-item-main">
							 <asp:Label ID="Label2" runat="server" Text="Pre Operative Test" style="font-size:1.1rem;font-weight:bold;"></asp:Label>
                             <br /><br /><asp:Label ID="Label10" runat="server" Text="Janta X-Ray Clinical Lab" style="font-size:1.1rem;font-weight:bold;color:orange;"></asp:Label>
                             <asp:Button ID="Button2" runat="server" class="popularbutton" OnClick="Button2_Click" Width="100px" Text="Rs 550/-" style="position:absolute;bottom:5px;left:70px;right:5px;"/>
							</div>
						</div>
						<div class="ca-item ca-item-1">
						<div class="ca-item-main">
							
							 <asp:Label ID="Label3" runat="server" Text="Thalassemia Test" style="font-size:1.1rem;font-weight:bold;"></asp:Label>
                             <br /><br /> <asp:Label ID="Label11" runat="server" Text="Metro Heart Institute" style="font-size:1.1rem;font-weight:bold;color:orange;"></asp:Label>
                            <asp:Button ID="Button3" runat="server" Text="Rs 600/-"  class="popularbutton" OnClick="Button3_Click" Width="100px" style="position:absolute;bottom:5px;left:70px;right:5px;"/>
							</div>
						</div>
						<div class="ca-item ca-item-1">
						<div class="ca-item-main">
							 <asp:Label ID="Label4" runat="server" Text="MRI Scan Test" style="font-size:1.1rem;font-weight:bold;"></asp:Label>
                            <br /> <br /><asp:Label ID="Label12" runat="server" Text="Thyrocare" style="font-size:1.1rem;font-weight:bold;color:orange;"></asp:Label>
                            <asp:Button ID="Button4" runat="server" Text="Rs 1250/-"  class="popularbutton" OnClick="Button4_Click" Width="100px" style="position:absolute;bottom:5px;left:70px;right:5px;"/>
							
							</div>
						</div>
						<div class="ca-item ca-item-1">
						<div class="ca-item-main">
							
							 <asp:Label ID="Label5" runat="server" Text="Breast Cancer Test" style="font-size:1.1rem;font-weight:bold;"></asp:Label>
                           <br /><br />  <asp:Label ID="Label13" runat="server" Text="Arch Pathology" style="font-size:1.1rem;font-weight:bold;color:orange;"></asp:Label>
                            <asp:Button ID="Button5" runat="server" Text="Rs 770/-"  class="popularbutton" OnClick="Button5_Click" Width="100px" style="position:absolute;bottom:5px;left:70px;right:5px;"/>
							</div>
						</div>
						<div class="ca-item ca-item-1">
						<div class="ca-item-main">
							 <asp:Label ID="Label6" runat="server" Text="Hypertension Test" style="font-size:1.1rem;font-weight:bold;"></asp:Label>
                            <br /> <br /> <asp:Label ID="Label14" runat="server" Text="Diagno Labs" style="font-size:1.1rem;font-weight:bold;color:orange;"></asp:Label>
                            <asp:Button ID="Button6" runat="server" Text="Rs 700/-"  class="popularbutton" OnClick="Button6_Click" Width="100px" style="position:absolute;bottom:5px;left:70px;right:5px;"/>
							
							</div>
						</div>
						<div class="ca-item ca-item-1">
						<div class="ca-item-main">
						 <asp:Label ID="Label7" runat="server" Text="Executive Health Test" style="font-size:1.1rem;font-weight:bold;"></asp:Label>
                           <br /> <br /> <asp:Label ID="Label15" runat="server" Text="Quest Diagnostics" style="font-size:1.1rem;font-weight:bold;color:orange;"></asp:Label>
                             <asp:Button ID="Button7" runat="server" Text="Rs 450/-"  class="popularbutton" OnClick="Button7_Click" Width="100px" style="position:absolute;bottom:5px;left:70px;right:5px;"/>
							
							</div>
						</div>
						<div class="ca-item ca-item-1">
						<div class="ca-item-main">
							 <asp:Label ID="Label8" runat="server" Text="Hypertension Test" style="font-size:1.1rem;font-weight:bold;"></asp:Label>
                           <br /><br />  <asp:Label ID="Label16" runat="server" Text="Medanta" style="font-size:1.1rem;font-weight:bold;color:orange;"></asp:Label>
                             <asp:Button ID="Button8" runat="server" Text="Rs 1200/-"  class="popularbutton" OnClick="Button8_Click" Width="100px" style="position:absolute;bottom:5px;left:70px;right:5px;"/>
							
							</div>
						</div>
						
						</div>
						</div>


</div>
                  










			
</div>


</div>
  
















     <script class="cssdeck" src="Scripts/jquery.mini.js"></script>
      <script type="text/javascript" src="Scripts/jquery.mini.js"></script>
 
    <script type="text/javascript" src="Scripts/jquery.easing.1.3.js"></script>
    <script type="text/javascript" src="Scripts/jquery.cookie.js"></script>
    <script type="text/javascript" src="Scripts/bootstrap.minece8.js?v=20130924"></script>
    <script type="text/javascript" src="Scripts/jquery.validate.minece8.js?v=20130924"></script>
    <script type="text/javascript" src="Scripts/jquery.transit.minece8.js?v=20130924"></script>
    <script type="text/javascript" src="Scripts/jquery.flexslider-minece8.js?v=20130924"></script>
    <script type="text/javascript" src="Scripts/sisyphus.minece8.js?v=20130924"></script>
    <script type="text/javascript" src="Scripts/jquery.ajaxfileuploadece8.js?v=20130924"></script>
    <script type="text/javascript" src="Scripts/spectrumece8.js?v=20130924"></script>
    <script type="text/javascript" src="Scripts/script7ead.js"></script>
 

    <script type="text/javascript" src="Scripts/jquery.contentcarousel.js"></script>
		<script type="text/javascript">
		    $('#ca-container').contentcarousel();
		</script>
    <script>
        $(function () {
            var shrinkHeader = 250;
            $(window).scroll(function () {
                var scroll = getCurrentScroll();
                if (scroll >= shrinkHeader) {
                    $('.header').addClass('shrink');
                }
                else {
                    $('.header').removeClass('shrink');
                }
            });
            function getCurrentScroll() {
                return window.pageYOffset || document.documentElement.scrollTop;
            }
        });
</script>
   
    
</asp:Content>
