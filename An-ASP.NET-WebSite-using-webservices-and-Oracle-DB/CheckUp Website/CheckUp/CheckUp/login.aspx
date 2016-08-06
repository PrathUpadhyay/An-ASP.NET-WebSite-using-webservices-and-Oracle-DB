<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="login.aspx.cs" Inherits="CheckUp.login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
     <meta name="viewport" content="width=device-width, initial-scale=1.0"/> 
        <link rel="stylesheet" type="text/css" href="CSS/demo.css" />
        <link rel="stylesheet" type="text/css" href="CSS/formstyle.css" />
		<link rel="stylesheet" type="text/css" href="CSS/animate-custom.css" />




<%--


     <link rel="stylesheet" href="CSS/hover.css" /> 
   <link rel="stylesheet" media="screen" href="CSS/bootstrap.minece8.css" />  
    <link rel="stylesheet" media="screen" href="CSS/flexsliderece8.css" />
    <link rel="stylesheet" media="screen" href="CSS/spectrumece8.css" /> 
    
    <link rel="stylesheet" type="text/css" href="CSS/style.css" /> 
 
    <link rel="stylesheet" type="text/css" href="StyleSheet.css" />






    <script type="text/javascript" src="Scripts/swfobjectece8.js"></script>
    <script type="text/javascript" src="Scripts/browserdetectece8.js"></script>
    <script type="text/javascript" src="Scripts/iframeSizer.minece8.js"></script>
    <script type="text/javascript" src="Scripts/nyt0ser.js"></script>

--%>







</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server"></asp:ScriptManager>
       <div class="container">
            <section>				
                <div id="container_demo" >
                    <a class="hiddenanchor" id="toregister"></a>
                    <a class="hiddenanchor" id="tologin"></a>
                    <div id="wrapper">
                         <div style="margin-top:100px;"></div>
                        <div id="login" class="animate form">
                           <div id="lin" runat="server">
                                <h1 style="font-family:Arial, Helvetica, sans-serif;">Log in</h1>                               
                                <p>                             
                                 <label for="username" class="uname" data-icon="u" id="l1" runat="server"> Username: </label>
                                    <asp:TextBox ID="uname" runat="server" name="username" placeholder="myusername"></asp:TextBox>
                                    
                                </p>
                                <p> 
                                    <label for="password" class="youpasswd" data-icon="p"> Password: </label>
                                    <asp:TextBox ID="pword" runat="server" name="password" placeholder="eg. X8df!90EO" TextMode="Password"></asp:TextBox>
                                     
                                </p>
                                <p class="keeplogin"> 
									<input type="checkbox"  runat="server" name="loginkeeping" id="loginkeeping" value="loginkeeping" /> 
									<label for="loginkeeping">Keep me logged in</label>
								</p>
                                <p class="login button">
                                    <asp:Button ID="signin" runat="server" type="button" Text="Login" OnClick="signin_Click"/>                                                                   
								</p>
                            <p> 
                                <a href="Forgot.aspx" runat="server" style="float:right;">Forgot Password??</a>                      
                               <br /> <asp:Label ID="Label1" runat="server" Text="Label" Visible="false" style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-style:italic;font-size:medium;color:red;"></asp:Label>
                                 
                            </p>
                                <p class="change_link">
									Not a member yet ?
									<a href="#toregister" class="to_register">Join us</a>
                                   
								</p>
                              
                           </div>
                        </div>

                        <div id="register" class="animate form">
                          <div id="lout" runat="server">
                                <h1 style="font-family:Arial, Helvetica, sans-serif;"> Sign Up </h1> 
                                <p>
                                <asp:Label ID="Label3" runat="server" Text="Label" Visible="false" style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-style:italic;font-size:medium;color:red;"></asp:Label>
                               
                            </p>
                               <p>                             
                                 <label for="username" class="uname" data-icon="u" id="Label2" runat="server"> Full Name: </label>
                                    <asp:TextBox ID="TextBox1" runat="server" name="username" placeholder="FirstName LastName"></asp:TextBox>
                                    
                                </p>
                                <p> 
                                    <label for="usernamesignup" class="uname" data-icon="u"> Username: </label>
                                    <asp:TextBox ID="usignup" runat="server" name="usernamesignup" placeholder="mysuperusername690"></asp:TextBox>
                                   
                                </p>
                                <p> 
                                    <label for="emailsignup" class="youmail" data-icon="e" > Email: </label>
                                    <asp:TextBox ID="esignup" runat="server" name="emailsignup" placeholder="mysupermail@mail.com" TextMode="Email"></asp:TextBox>
                                  
                                </p>
                                <p> 
                                    <label for="passwordsignup" class="youpasswd" data-icon="p"> Password: </label>
                                    <asp:TextBox ID="psignup" runat="server" name="passwordsignup" placeholder="eg. X8df!90EO" TextMode="Password"></asp:TextBox>
                                   
                                </p>
                                <p> 
                                    <label for="passwordsignup_confirm" class="youpasswd" data-icon="p">Please confirm your password: </label>
                                    <asp:TextBox ID="psignup_confirm" runat="server" name="passwordsignup_confirm" placeholder="eg. X8df!90EO" TextMode="Password"></asp:TextBox>
                                  
                                </p>
                                <p class="signin button">
                                     <asp:Button ID="create" runat="server" Text="Sign up" OnClick="create_Click" PostBackUrl="~/login.aspx#toregister" />									 
                                    
								</p>
                          <%--  <p>
                                <asp:Label ID="Label3" runat="server" Text="Label" Visible="false" style="font-family:'Franklin Gothic Medium', 'Arial Narrow', Arial, sans-serif;font-style:italic;font-size:medium;color:red;"></asp:Label>
                               
                            </p>--%>
                                <p class="change_link">  
									Already a member ?
									<a href="#tologin" class="to_register"> Log in </a>
								</p>
                          </div>
                        </div>
						
                    </div>
                </div>  
            </section>
        </div>
    <div style="margin-top:175px;"></div>









<%--
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
 
    --%>
</asp:Content>
