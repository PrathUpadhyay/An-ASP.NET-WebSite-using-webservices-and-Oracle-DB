<%@ Page Language="C#" MasterPageFile="~/head_family.Master" AutoEventWireup="true" CodeBehind="FamilyAccount.aspx.cs" Inherits="CheckUp.FamilyAccount" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="ajaxToolkit" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <title>Add a Family Member</title>

    <link href="Family_Account/stylec4ca.css" rel="stylesheet" />
    <script src="Family_Account/jquery-1.11.1.min.js"></script>
    <script src="Family_Account/main.js"></script>
    <script src="Family_Account/plugins.js"></script>

    <link href="CSS/flexsliderece8.css" rel="stylesheet" />
    <link href="CSS/spectrumece8.css" rel="stylesheet" />

    <script src="Scripts/swfobjectece8.js"></script>
    <script src="Scripts/browserdetectece8.js"></script>
    <script src="Scripts/iframeSizer.minece8.js"></script>
    <script src="Scripts/nyt0ser.js"></script>

    <%--<script type="text/javascript">try { Typekit.load(); } catch (e) { }</script>
    <script>
        dataLayer = [{
            "article title": "How do I provide a Charles log or a Charles Proxy log?",
            "User Status": "anonymous"
        }];
    </script>--%>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">




    <div class="ms-left">
        <div class="ms-section" id="left1">


            <div class="fullscreen">




                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />




                <div class="kb-categories kb-list slidenav-main kb-cat-direct permalinks ">
                    <ul>

                        <li><a data-part='subcategories' data-id='20035478' href='AccountDetails.aspx'>
                            <img src="img/img_account_details.png" />
                            <h4 style="margin-top: 0.5px; color: #f4f4f4">Account Details</h4>
                        </a></li>
                        <li><a data-part='subcategories' data-id='20035478' href='MyOrders.aspx'>
                            <img src="img/img_my_orders.png" />
                            <h4 style="margin-top: 0.5px; color: #f4f4f4">My Orders</h4>
                        </a></li>
                        <li><a data-part='subcategories' data-id='20035478' href='AccountSettings.aspx'>
                            <img src="img/img_account_settings.png" />
                            <h4 style="margin-top: 0.5px; color: #f4f4f4">Account Settings</h4>
                        </a></li>
                        <li><a class="active" data-part='subcategories' data-id='20035478' href='FamilyAccount.aspx'>
                            <img src="img/img_family_account.png" />
                            <h4 style="margin-top: 0.5px; color: #f4f4f4">Family Account</h4>
                        </a></li>

                    </ul>
                </div>

                <h2 class="centered" style="margin-top: -20px; color: black; font-size: 35px; font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif">
                    <strong>Family Account</strong></h2>

                <br />
                <br />
                <br />
                <br />
                <div style="margin-left: 50px; margin-right: 50px; font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif; font-size: 20px">
                    <strong>Add Members in your FAMILY, and grab exclusive deals and offers for the whole family.
                        <br />
                        Above all, keep your loved ones safe and checked-up.
                    </strong>
                </div>



                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />
                <br />

                <div id="scrolldown">
                    <div data-menuanchor="second">
                        <a href="#members">scroll down</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="ms-section sub-page clients" id="left3">

            <br />
            <br />
            <br />
           

            <style>
                table {
                    font-family: 'Comic Sans MS';
                    font-size: 1.4em;
                    color: white;
                    margin: auto;
                    width: 420px;
                    border-collapse: collapse;
                    align-items: center;
                    text-align: center;
                    align-content: center;
                }

                td {
                    align-items: center;
                    text-align: center;
                    align-content: center;
                }

                .odd {
                    background-color: #404040;
                }

                .butt {
                    margin: 0 auto;
                    font-size: 0.8rem;
                    padding: 1px;
                    background-color: black;
                    border: 1px solid transparent;
                    color: white;
                    font-weight: 300;
                    -webkit-border-radius: 3px;
                    border-radius: 3px;
                    -webkit-transition: all 0.3s ease-in-out;
                    -moz-transition: all 0.3s ease-in-out;
                    transition: all 0.3s ease-in-out;
                }

                    .butt:hover {
                        background-color: #ff1919;
                        color: white;
                        border-color: /*#009ac9;*/ #28AADC;
                    }

                .butto {
                    margin: 0 auto;
                    font-size: 0.8rem;
                    padding: 1px;
                    background-color: black;
                    border: 1px solid transparent;
                    color: white;
                    font-weight: 300;
                    -webkit-border-radius: 3px;
                    border-radius: 3px;
                    -webkit-transition: all 0.3s ease-in-out;
                    -moz-transition: all 0.3s ease-in-out;
                    transition: all 0.3s ease-in-out;
                }

                    .butto:hover {
                        background-color: green;
                        color: white;
                        border-color: /*#009ac9;*/ #28AADC;
                    }

                ::-webkit-input-placeholder {
                    color: red !important;
                }


                .scrolla {
                    height: 340px;
                    width: 440px;
                    overflow-y: scroll;
                }

                    .scrolla::-webkit-scrollbar {
                        width: 4px;
                    }

                    /* Track */
                    .scrolla::-webkit-scrollbar-track {
                        /*-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);*/
                        -webkit-border-radius: 7px;
                        border-radius: 7px;
                    }

                    /* Handle */
                    .scrolla::-webkit-scrollbar-thumb {
                        -webkit-border-radius: 7px;
                        border-radius: 7px;
                        background-color: #585858;
                        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);
                    }

                        .scrolla::-webkit-scrollbar-thumb:window-inactive {
                            background: rgba(255,0,0,0.4);
                        }

                .scrol {
                    overflow-x: scroll;
                    
                }

                    .scrol::-webkit-scrollbar {
                        height: 5px;
                    }

                    /* Track */
                    .scrol::-webkit-scrollbar-track {
                        /*-webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.3);*/
                        -webkit-border-radius: 7px;
                        border-radius: 7px;
                    }

                    /* Handle */
                    .scrol::-webkit-scrollbar-thumb {
                        -webkit-border-radius: 7px;
                        border-radius: 7px;
                        background-color: orangered;
                        -webkit-box-shadow: inset 0 0 6px rgba(0,0,0,0.5);
                    }

                        .scrol::-webkit-scrollbar-thumb:window-inactive {
                            background: rgba(255,0,0,0.4);
                        }
            </style>

            <script type="text/javascript">
    function LoadDiv(url) {
        var img = new Image();
       
       var bcgDiv = document.getElementById("divBackground");
       var imgDiv = document.getElementById("divImage");
       var imgFull = document.getElementById("imgFull");
       var imgLoader = document.getElementById("imgLoader");
       imgLoader.style.display = "block";
       img.onload = function () {
           imgFull.src = img.src;
           imgFull.style.display = "block";

           imgLoader.style.display = "none";
         
         
       };
       img.src = url;
       var width = document.body.clientWidth;
       if (document.body.clientHeight > document.body.scrollHeight) {
           bcgDiv.style.height = document.body.clientHeight + "px";
       }
       else {
           bcgDiv.style.height = document.body.scrollHeight + "px";
       }
       imgDiv.style.left = (width - 650) / 2 + "px";
       imgDiv.style.top = "20px";
       bcgDiv.style.width = "100%";

       bcgDiv.style.display = "block";
       imgDiv.style.display = "block";
       return false;
   }
                   function HideDiv() {
                       var bcgDiv = document.getElementById("divBackground");
                       var imgDiv = document.getElementById("divImage");
                       var imgFull = document.getElementById("imgFull");
                       if (bcgDiv != null) {
                           bcgDiv.style.display = "none";
                           imgDiv.style.display = "none";
                           imgFull.style.display = "none";
                       }
                   }
                   </script>




            <style>
                body {
                    margin: 0;
                    padding: 0;
                    height: 100%;
                }

                .modal {
                    display: none;
                    position: absolute;
                    top: 0px;
                    left: 0px;
                    background-color: black;
                    z-index: 100;
                    opacity: 0.8;
                    filter: alpha(opacity=60);
                    -moz-opacity: 0.8;
                    min-height: 100%;
                }

                #divImage {
                    display: none;
                    z-index: 1000;
                    position: fixed;
                    top: 0;
                    left: 0;
                    /*background-color: whitesmoke;*/
                    height: 450px;
                    width: 500px;
                    padding: 0px;
                    box-shadow: 5px 5px 197px #333,-5px -5px 97px #333;
                }
            </style>






            <header>
                <h1 class="mobile" style="color: #fff">MY MEMBERS</h1>
                <h1 style="color: whitesmoke; font-family: Georgia, 'Times New Roman', Times, serif;">MY MEMBERS</h1>
                <div class="scrolla" style="margin-top: 20px; position: relative;">
                    <asp:Repeater ID="Repeater1" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemCreated="Repeater1_ItemCreated">

                        <ItemTemplate>



                            <div style="margin-left: 0px;">
                                <table>
                                    <tr>
                                        <td colspan="3" style="width: 80px; padding: 0px 0px; background-color: #404040; border-bottom: 1px solid darkgray;">
                                            <%-- <asp:Image ID="Image1" runat="server" ImageUrl='<%# Eval("PHOTO") %>' Width="50px" Height="54px" style="border-radius:9px;cursor: pointer;" ImageAlign="Middle" OnClientClick="return LoadDiv(this.src);"/>--%>
                                            <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl='<%# Eval("PHOTO") %>' Width="80px" Height="67px" Style="border-radius: 1px; cursor: pointer;" ImageAlign="Middle" OnClientClick="return LoadDiv(this.src);" />
                                        </td>
                                        <td class="odd" style="width: 200px; padding: 24px 5px 0 0px; border-bottom: 1px solid darkgray;">
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("NAME") %>'></asp:Label>
                                        </td>
                                        <td class="odd" style="width: 140px; background-color: #404040; padding: 15px 0px 15px 20px; border-bottom: 1px solid darkgray;">
                                            <asp:Button ID="Button1" runat="server" CssClass="butt" Text="Remove" OnClick="Button1_Click" CommandName="link" Width="80px" Height="37px" Font-Bold="True" style="border-radius:30px;"/>
                                        </td>
                                    </tr>

                                </table>
                            </div>


                        </ItemTemplate>




                    </asp:Repeater>
                    <div id="divBackground" class="modal">
                    </div>


                    <div id="divImage" style="margin-top: 90px;">
                        <table style="height: 100%; width: 100%; align-self: center;">
                            <tr>
                                <td valign="middle" align="center">
                                    <img id="imgLoader" alt="" src="img/3.gif" />
                                    <img id="imgFull" alt="" src="" style="display: none; height: 450px; width: 500px;" />
                                </td>
                            </tr>

                            <tr>
                                <td align="center" valign="bottom">
                                    <input id="btnClose" type="button" value="close" style="width: 100px; height: 30px; border-radius: 2px; background-color: darkblue; color: white; margin-top: 16px;" onclick="HideDiv()" />
                                </td>
                            </tr>
                        </table>
                    </div>

                </div>



            </header>

        </div>



        <div class="ms-section sub-page contacts" id="left6">

            <br />
            <br />
            <br />


            <header>
                <h1 class="mobile">PENDING MEMBERS</h1>
                <h2 style="color:orangered;">PENDING MEMBERS</h2>

                <h3 style="margin-top:-25px;color:darkblue">Requests Sent
                </h3>


                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <table>
                    <tr style="float: left; width: 400px;">
                        <td">
                            <asp:Label runat="server" Width="150px" Style="margin-top: 10px;font-size:medium;font-weight:bold;color:darkblue;">Send Request to:  </asp:Label>
                        </td>
                        <td style="padding: 5px;">
                            <asp:TextBox ID="TextBox1" runat="server" placeholder="Type Username" Height="35px" autocomplete="off" Width="170px"></asp:TextBox>
                        </td>
                        <td style="padding: 5px;">
                            <asp:Button ID="Button3" runat="server" CssClass="butto" Text="Send" Width="80px" Height="33px" Font-Bold="True" OnClick="Button3_Click" Style="float: left;border-radius:30px"/>
                        </td>
                    </tr>
                </table>
                <ajaxToolkit:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server"
                    TargetControlID="TextBox1" UseContextKey="True" CompletionInterval="500"
                    MinimumPrefixLength="1" ServiceMethod="GetCompletionList" />




                <%-- <div class="scrol" style="margin-top:20px;min-width:350px;min-height:170px;width:400px;list-style: none;height:170px;">--%>
                <asp:Repeater ID="Repeater2" runat="server" OnItemCommand="Repeater2_ItemCommand" OnItemCreated="Repeater2_ItemCreated">
                    <HeaderTemplate>
                        <div class="scrol" style="margin-top: 5px; min-width: 350px; min-height: 110px; width: 600px; list-style: none; height: 150px; background-color: #404040;">
                    </HeaderTemplate>
                    <ItemTemplate>



                        <div id="mydiv" style="display: inline-block; float: left; width: 120px;">
                            <table style="margin-top: 10px; margin-left: 10px;">
                                <tr style="width: 130px;">
                                    <td>
                                        <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl='<%# Eval("PHOTO") %>' Width="80px" Height="67px" Style="border-radius: 1px; cursor: pointer; display: inherit;" ImageAlign="Middle" OnClientClick="return LoadDiv(this.src);" />
                                        
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("NAME") %>' Width="90px" Style="display: inherit; font-size: 0.8rem;font-weight:bold"></asp:Label>
                                        
                                        <asp:Button ID="Button2" runat="server" CssClass="butt" Text="Cancel" OnClick="Button2_Click" CommandName="link" Width="80px" Height="27px" Font-Bold="true"  Style="margin-left:-330px;border-radius:10px;"/>
                                    </td>
                                </tr>

                            </table>
                        </div>


                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>


                </asp:Repeater>


                <%--</div>--%>

                <h3 style="color:darkblue">Requests Received
                </h3>

                <asp:Repeater ID="Repeater3" runat="server" OnItemCommand="Repeater3_ItemCommand" OnItemCreated="Repeater3_ItemCreated">
                    <HeaderTemplate>
                        <div class="scrol" style="margin-top: -25px; min-width: 350px; min-height: 110px; width: 600px; list-style: none; height: 132px; background-color: #404040;">
                    </HeaderTemplate>
                    <ItemTemplate>


                        <div id="mydiv" style="display: inline-block; float: left; width: 120px;">
                            <table style="margin-top: 10px; margin-left: 10px;">
                                <tr style="width: 130px">
                                    <td>
                                        <asp:ImageButton ID="ImageButton3" runat="server" ImageUrl='<%# Eval("PHOTO") %>' Width="80px" Height="67px" Style="border-radius: 1px; cursor: pointer; display: inherit;" ImageAlign="Middle" OnClientClick="return LoadDiv(this.src);" />
                                   
                                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("NAME") %>' Width="90px" Style="display: inherit; font-size: 0.8rem;font-weight:bold;"></asp:Label>
                                   
                                        <asp:Button ID="Button3" runat="server" CssClass="butto" Text="Accept" OnClick="Button2_Click" CommandName="accept" Width="40px" Height="27px" Font-Bold="True" style="font-size:0.6rem;margin-left:-330px;border-radius:10px;"/>
                                        <asp:Button ID="Button4" runat="server" CssClass="butt" Text="Decline" OnClick="Button2_Click" CommandName="decline" Width="40px" Height="27px" Font-Bold="True" style="font-size:0.6rem;border-radius:10px;"/>

                                    </td>
                                </tr>

                            </table>
                        </div>


                    </ItemTemplate>

                    <FooterTemplate>
                        </div>
                    </FooterTemplate>


                </asp:Repeater>


            </header>

        </div>
    </div>

    <div class="ms-right">
        <div class="ms-section" id="right1">
        </div>


        <div class="ms-section sub-page clients" id="right3">
            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <img src="Family_Account/clients2.gif" alt="" />
            <p style="margin-left: 90px;">
                A <strong>HERO</strong> can be anyone.....
            </p>
        </div>


        <div class="ms-section sub-page contacts" id="right6">

            <br />
            <br />
            <br />
            <br />
            <br />
            <br />

            <img src="Family_Account/contact.gif" alt="" />
            <p>
                At the end, one must
                    <br />
                pause and reflect
                on one's <span class="text_black">achievements

                </span>
            </p>
        </div>
    </div>

    <script>window.jQuery || document.write("<script src='Family_Account/jquery-1.11.1.min.js'>\x3C/script>")</script>
</asp:Content>
