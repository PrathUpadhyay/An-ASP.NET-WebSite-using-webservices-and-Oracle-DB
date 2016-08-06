<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="FilterPage.aspx.cs" Inherits="CheckUp.FilterPage" %>
<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">



    <title>RESULTS</title>

    <%--  <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>--%>
    <%--  meta charset not needed in VS--%>

    <meta name="description" content="Looking for recommended Medical tests and check-ups at best costs online in India? CheckUp offers discounted Preventive Health Check-ups " />
    <meta name="keywords" content="Health Check-Ups, Medical Check-Ups , recommended Health Check-Ups, recommended Medical Check-Ups" />




    <link href="FilterPage/new-ui-home-style.css" rel="stylesheet" type="text/css" />
    <link href="FilterPage/jquery-ui.css" rel="stylesheet" type="text/css" />
    <link href="FilterPage/style.css" rel="stylesheet" type="text/css" />
    <link href="FilterPage/hcd_stylesheet.css" rel="stylesheet" type="text/css" />


    <link href="FilterPage/fwslider.css" rel="stylesheet" media="all" />

    <link href="FilterPage/jquery-ui-1.9.1.custom.css" rel="stylesheet" type="text/css" />

    <link href="FilterPage/menu.css" rel="stylesheet" type="text/css" />
    <link href="FilterPage/stylesheet_healthians.css" rel="stylesheet" type="text/css" />
    <script src="FilterPage/jquery.js" type="text/javascript"></script>

    <script src="FilterPage/custom.js" type="text/javascript"></script>

    <script src="FilterPage/jquery-1.8.2.min.js" type="text/javascript"></script>

    <script src="FilterPage/jquery-ui-1.9.1.custom.min.js" type="text/javascript"></script>

    <script src="FilterPage/admin-validation.js" type="text/javascript"></script>

    <script src="FilterPage/jquery.validate.js" type="text/javascript"></script>

    <script src="FilterPage/css3-mediaqueries.js" type="text/javascript"></script>
    <script src="FilterPage/fwslider.js" type="text/javascript"></script>


    <%--  <script src="assets/healthdeals_jquery/used-bundle/jquery-ui.js" type="text/javascript"></script>
    --%>
    <script src="FilterPage/jquery-ui2.js" type="text/javascript"></script>

    <script src="FilterPage/jquery.carouFredSel-6.1.0-packed.js" type="text/javascript"></script>



    <script src="FilterPage/html5.js" type="text/javascript"></script>



    <script src="FilterPage/css3-mediaqueries2.js" type="text/javascript"></script>



</asp:Content>



<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <br />
    <br />
    <br />
    <br />
   <%-- <br />
    <br />
    <br />--%>


    <section class="content1">


     
        <link href="FilterPage/styles_filter.css" rel="stylesheet" type="text/css" />
        <link href="FilterPage/styles_filter_js.css" rel="stylesheet" />
        <link href="FilterPage/jquery.mCustomScrollbar.css" rel="stylesheet" />
        <script src="FilterPage/main.js" type="text/javascript"></script>
        <script src="FilterPage/jquery.mCustomScrollbar.concat.min.js"></script>
          <link rel="stylesheet" type="text/css" href="StyleSheet.css" />
        <style>
            .latest_deals .view-deal {
                background: url("assets/front/images/view-deal.jpg") repeat-x scroll center top rgba(0, 0, 0, 0);
                margin: 216px 0 0 159px;
                position: absolute;
                text-align: center;
            }

            .rsp11 {
                color: #8fa248;
                font-family: "rps",Trebuchet MS,Arial,Helvetica,sans-serif;
                font-size: 11pt;
                font-weight: bold;
                margin-right: 5px;
                text-align: center;
            }

            .rsp1 {
                color: #258EC9;
                font-family: "rps",Trebuchet MS,Arial,Helvetica,sans-serif;
                font-size: 11pt;
                font-weight: bold;
                margin-right: 5px;
                text-align: center;
            }

            .pointer {
                background: url(assets/new_design/pointer-img.jpg) top left no-repeat;
                width: 150px;
                /*position:absolute;
	top:509px;*/
                padding-left: 15px;
                font-size: 11px;
            }

            .pointerr {
                background: url(assets/new_design/pointer-img.jpg) top left no-repeat;
                float: left;
                clear: both;
                padding-left: 15px;
            }

            .main-heading {
                color: #1683AC;
                float: left;
                font-family: 'Segoe UI',Arial,Helvetica,sans-serif;
                font-size: 15pt;
                font-weight: bold;
                padding-bottom: 0px;
            }

            .loading-bar {
                padding: 10px 20px;
                display: block;
                text-align: center;
                box-shadow: inset 0px -45px 30px -40px rgba(0, 0, 0, 0.05);
                border-radius: 5px;
                margin: 20px 0;
                font-size: 1em;
                font-family: "museo-sans", sans-serif;
                border: 1px solid #ddd;
                margin-right: 1px;
                font-weight: bold;
                cursor: pointer;
                position: relative;
            }

                .loading-bar:hover {
                    box-shadow: inset 0px 45px 30px -40px rgba(0, 0, 0, 0.05);
                }

            .brief {
                color: #666;
                font-size: 11px;
                text-align: left;
                display: block;
                margin-right: 5px;
            }

            .location a {
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                color: #666666;
                background: #f4f4f4;
                display: block;
                height: 20px;
                width: 179px;
                padding: 6px;
                text-decoration: none;
            }

                .location a:hover {
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 12px;
                    color: #fff;
                    background: #8fa248;
                    display: block;
                    height: 20px;
                    width: 179px;
                    padding: 6px;
                    text-decoration: none;
                }

                .location a.act {
                    font-family: Arial, Helvetica, sans-serif;
                    font-size: 12px;
                    color: #fff;
                    background: #8fa248;
                    display: block;
                    width: 179px;
                    padding: 6px;
                    text-decoration: none;
                    height: 20px;
                }

            .clear-filter {
                color: #999;
                font: 11px/14px arial;
                padding: 1px 4px;
                text-decoration: underline;
                text-transform: none;
            }

            section.content1 {
                width: 1010px;
            }

            .latest_deals .deal-description {
                height: 75px;
            }

            .box-cross {
                width: auto;
                border-bottom: 1px dotted #999;
                border-top: 1px dotted #999;
            }

                .box-cross ul {
                    padding: 0px;
                    margin: 0px;
                    list-style: none;
                }

                    .box-cross ul li {
                        background: none repeat scroll 0 0 #efefef;
                        display: block;
                        float: left;
                        text-indent: 10px;
                        font-family: Arial, Helvetica, sans-serif;
                        font-size: 12px;
                        line-height: 32px;
                        text-transform: capitalize;
                        margin-right: 22px;
                    }

                        .box-cross ul li span {
                            background: url("assets/front/css/menu_images/filter-selector.png") no-repeat scroll right center rgba(0, 0, 0, 0);
                            display: block;
                            float: right;
                            height: 32px;
                            position: relative;
                            right: -42px;
                            width: 19px;
                        }

                        .box-cross ul li a {
                            background: url("assets/front/css/menu_images/cross-icon.png") no-repeat scroll right 3px rgba(0, 0, 0, 0);
                            display: block;
                            float: right;
                            height: 18px;
                            margin: 0 0 0 8px;
                            position: relative;
                            right: 6px;
                            text-decoration: none;
                            top: 7px;
                            width: 16px;
                        }

                            .box-cross ul li a:hover {
                                display: block;
                                background: url(assets/front/css/menu_images/cross-icon-hover.png) no-repeat right 3px;
                            }

            .clear {
                clear: both;
            }

            .clear-all {
                float: right;
                font-family: Arial, Helvetica, sans-serif;
                font-size: 12px;
                color: #666666;
                line-height: 18px;
                padding: 7px 10px;
            }

                .clear-all a {
                    color: #666666;
                }

            .new {
                color: #474545;
                display: block;
                font-family: Arial,Helvetica,sans-serif;
                font-size: 12pt;
                font-weight: bold;
                padding: 16px 9px 12px;
                text-transform: capitalize;
            }
        </style>

        <!--  FILTER START -->


        <script src="Scripts/jquery-latest.js"></script>
       


        <div class='ft_main'>
            <div class='ft_sub1' style='float: left; width: 20%; margin-bottom: 10px; margin-left: 6px;'>


                <!--  filter start -->

                <div id='cssmenu'>
                    <ul style="background-color:beige;">
                        <li><a href="#">MODIFY SELECTION</a> </li>
                        <!--  risk area dropdown  start-->
                        <li class="has-sub open"><a href="#"><span>Location</span></a>
                            <ul style="width: 172px;background-color:beige;height:250px;">
                                <div data-mcs-theme="inset-2-dark" style="background-color:beige;height:250px;">
                                   
                                    <li>
                                        <asp:TextBox ID="TextBox1" runat="server" placeholder="Change Location" Height="35px" Width="150px" style="border-top:thin solid  #e5e5e5;
            border-right:thin solid #e5e5e5;
            border-bottom:0;
            border-left:thin solid  #e5e5e5;
            box-shadow:0px 1px 1px 1px #e5e5e5;                     
            outline:0;" OnTextChanged="TextBox1_TextChanged" AutoPostBack="True"></asp:TextBox>
         <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>
     <%-- <asp:ImageButton ID="ImageButton2" runat="server" ImageUrl="img/magnifying_glass.png" style="margin-top:10px;
            width:15px;" OnClick="ImageButton2_Click"/>--%>
      <cc1:AutoCompleteExtender ID="AutoCompleteExtender1" runat="server" 
                    TargetControlID="TextBox1" UseContextKey="True" CompletionInterval="500" 
            MinimumPrefixLength="0" ServiceMethod="GetCompletionList" CompletionListCssClass="autocomplete_completionListElement2" CompletionListItemCssClass="autocomplete_listItem2" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem2"><%-- <%--CompletionListCssClass="autocomplete_completionListElement" 
                CompletionListItemCssClass="autocomplete_listItem" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem" BehaviorID="AutoCompleteEx"--%>
               
            </cc1:AutoCompleteExtender>
        </li>
                                        </div>
                               
                            </ul>
                        </li>
                        <!--  risk area dropdown  end-->


                       <li class="has-sub open"><a href="#"><span>Risk Area</span></a>
                            <ul style="width: 172px;background-color:beige;height:250px;">
                                <div data-mcs-theme="inset-2-dark" style="background-color:beige;height:250px;">
                                    
                                    <li>
                                         <asp:TextBox ID="TextBox2" runat="server" placeholder="Change Category" Height="35px" Width="150px" style="border-top:thin solid  #e5e5e5;
            border-right:thin solid #e5e5e5;
            border-bottom:0;
            border-left:thin solid  #e5e5e5;
            box-shadow:0px 1px 1px 1px #e5e5e5;                     
            outline:0;" OnTextChanged="TextBox2_TextChanged" AutoPostBack="True"></asp:TextBox>
       
   <%--   <asp:ImageButton ID="ImageButton1" runat="server" ImageUrl="img/magnifying_glass.png" style="margin-top:10px;
            width:15px;" OnClick="ImageButton2_Click"/>--%>
     
         <cc1:AutoCompleteExtender ID="AutoCompleteExtender2" runat="server" Enabled="True" 
                    TargetControlID="TextBox2" UseContextKey="True" CompletionInterval="500" 
            MinimumPrefixLength="0" ServiceMethod="GetCompletionList1" CompletionListCssClass="autocomplete_completionListElement2" 
                CompletionListItemCssClass="autocomplete_listItem2" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem2"></cc1:AutoCompleteExtender></li>
                                        </div>
                               
                            </ul>
                        </li>
                        <!--  location end -->
                       
                      <li class="has-sub open"><a href="#"><span>Test</span></a>
                            <ul style="width: 172px;background-color:beige;height:250px;">
                                <div data-mcs-theme="inset-2-dark" style="background-color:beige;height:250px;">
                                    
                                    <li>
                                         <asp:TextBox ID="TextBox3" runat="server" placeholder="Change Test Name" Height="35px" Width="150px" style="border-top:thin solid  #e5e5e5;
            border-right:thin solid #e5e5e5;
            border-bottom:0;
            border-left:thin solid  #e5e5e5;
            box-shadow:0px 1px 1px 1px #e5e5e5;                     
            outline:0;" OnTextChanged="TextBox3_TextChanged" AutoPostBack="True"></asp:TextBox>
       
      <%--<asp:ImageButton ID="ImageButton3" runat="server" ImageUrl="img/magnifying_glass.png" style="margin-top:10px;
            width:15px;" OnClick="ImageButton2_Click"/>--%>
     
       <cc1:AutoCompleteExtender ID="AutoCompleteExtender3" runat="server" Enabled="True" 
                    TargetControlID="TextBox3" UseContextKey="True" CompletionInterval="500" 
            MinimumPrefixLength="0" ServiceMethod="GetCompletionList2" CompletionListCssClass="autocomplete_completionListElement2" 
                CompletionListItemCssClass="autocomplete_listItem2" 
                CompletionListHighlightedItemCssClass="autocomplete_highlightedListItem2"></cc1:AutoCompleteExtender></li>
                                        </div>
                               
                            </ul>
                        </li>
                        <!--  brand end -->

                      
                      
                    </ul>
                    </div>
                
                </div>

                <!--  filter end -->
            </div>

            <div class="main-heading new ">
                <h1>Search By allcheckups</h1>
            </div>


        <asp:DropDownList ID="DropDownList1" runat="server" style='float: right; margin: 23px 3px 0 0;' OnSelectedIndexChanged="DropDownList1_SelectedIndexChanged" AutoPostBack="true">
             <asp:ListItem Text="--Sort By--" Value="0" />
             <asp:ListItem Text="Price (LOW to HIGH)" Value="1" />
             <asp:ListItem Text="Price (HIGH TO LOW)" Value="2" />

        </asp:DropDownList>
           <%-- <select style='float: right; margin: 23px 3px 0 0;' id='select_sort' runat="server" name="select_sort" onchange="sort()" onselect="sort()">
                <option value="#">--Sort By--</option>
                <option value="ascen" id='price_low_to_high'>Price (LOW to HIGH)</option>
                <option value="descen" id='price_high_to_low'>Price (HIGH TO LOW)</option>
              


            </select>--%>
            <div class='ft_sub2' style='float: right; width: 80%; margin-right: -9px;'>
                <div>
                    <div class="box-cross">

                        <ul id='remove_links' class='justList'>
                        </ul>


                        <div class="clear"></div>

                        <div class="clear"></div>

                    </div>
                    <div class="box-cross">
                    </div>
                </div>


                <style type="text/css">
                    #divEmployees {
                        font-family: Arial, Verdana, Sans-Serif;
                        font-size: 12px;
                        padding: 10px;
                        border: solid 1px #0066CC;
                    }

                        #divEmployees .detail {
                            border-bottom: dashed 1px #0066CC;
                            margin-bottom: 10px;
                            padding: 10px;
                        }
                </style>



                <asp:Repeater ID="rptEmployees" runat="server" OnItemCommand="Repeater1_ItemCommand" OnItemCreated="Repeater1_ItemCreated">
                    <HeaderTemplate>
                        <div id="divEmployees">
                    </HeaderTemplate>
                    <ItemTemplate>
                        <div class="detail">
                            <table>
                                <tr>
                                    <td nowrap="nowrap" style="width:100%">
                                        <div>
                                            <asp:Label ID="Label1" runat="server" Text='<%# Eval("LAB_NAME") %>' style="font-family:DengXian;font-size:30px;text-shadow:3px"></asp:Label></div>
                                    </td>
                                    
                                </tr>
                     
                                <tr>
                                    <td style="width:40%">
                                        <div style="font-family:Aharoni;font-size:20px;text-shadow:3px">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("ADDRESS")%>' style="font-family:Aharoni;font-size:20px;text-shadow:3px"></asp:Label>,&nbsp;
                                      <asp:Label ID="Label3" runat="server" Text='<%# Eval("LOCATION_NAME")%>' style="font-family:Aharoni;font-size:20px;text-shadow:3px"></asp:Label>
                                            </div>
                                    </td>

                                    <td style="width:20%"></td>








                                     <style>

                                         .butn
                                         {
                                             margin: 0 auto;
                                                font-size: 1.0rem;
                                                padding: 0.75rem 1.5rem;
                                                display: block;
                                                width:10em;
                                                background-color: #edb42f;
                                                border: 1px solid transparent;
                                                color: #ffffff;
                                                font-weight: 300;
                                                -webkit-border-radius: 3px;
                                                border-radius: 3px;
                                                -webkit-transition: all 0.3s ease-in-out;
                                                -moz-transition: all 0.3s ease-in-out;
                                                transition: all 0.3s ease-in-out;
                                         }

                                         .butn:hover
                                         {
                                              background-color: #ffffff;
                                                    color: #edb42f;
                                                    border-color: /*#009ac9;*/ #edb42f;
                                         }
                                            

                                               
                                                </style>





                                   <td  style="width:40%">  <asp:Button ID="btn0" runat="server" CssClass="butn" Text="  Full View" OnClick="btn0_Click" CommandName="link"/></td>
                                  <%--  padding-left:20px;--%>
                                </tr>
                                 <tr>
                                    <td style="width:40%">
                                         <div>
                                           Rs.  <asp:Label ID="Label4" runat="server" Text='<%# Eval("AMOUNT") %>' style="font-family:'Lucida Calligraphy';font-size:20px;text-shadow:3px"></asp:Label> /-</td>
                                    <td style="width:20%">
                                        
                                    </td>

                                       <style>

                                           .butn1
                                           {
                                                 margin: 0 auto;
                                                font-size: 1.0rem;
                                                padding: 0.75rem 1.5rem;
                                                display: block;
                                                background-color: #f64f18;
                                                border: 1px solid transparent;
                                                color: #ffffff;
                                                width:10em;
                                                font-weight: 300;
                                                -webkit-border-radius: 3px;
                                                border-radius: 3px;
                                                -webkit-transition: all 0.3s ease-in-out;
                                                -moz-transition: all 0.3s ease-in-out;
                                                transition: all 0.3s ease-in-out;
                                           }

                                           .butn1:hover
                                           {
                                               background-color: #ffffff;
                                                    color: #f64f18;
                                                    border-color: /*#009ac9;*/ #f64f18;
                                           }

                                               
                                        </style>



                                      
                                    
                                    <td style="width:40%">
                                        <asp:Button ID="btn1" runat="server" CssClass="butn1" Text="Book Now" OnClick="btn1_Click" CommandName="link2"/></td>

                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                  
                    <FooterTemplate>
                        </div>
                    </FooterTemplate>
                </asp:Repeater>




            </>

            
            </div>


         
    </section>


    <div class="clr"></div>


    <div style="width: 1000px; margin: 0px auto; font-size: 11px; word-spacing: 2px; padding-bottom: 10px;">
    </div>


    <div class="clear"></div>

</asp:Content>


