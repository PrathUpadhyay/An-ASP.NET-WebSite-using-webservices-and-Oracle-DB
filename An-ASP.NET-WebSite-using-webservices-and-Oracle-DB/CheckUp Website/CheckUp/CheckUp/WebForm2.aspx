<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebForm2.aspx.cs" Inherits="CheckUp.WebForm2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">




<%--DIPLAY NONE AND DISPLAY BLOCK--%>









<html xmlns="http://www.w3.org/1999/xhtml">

<head runat="server">
    <title>Checkup - Account</title>
    <svg xmlns="http://www.w3.org/2000/svg" />
    <link href="AccountPage/b34e03f1e4059087aa2224ffa04b9ebab30f81a4.1441611128.css" rel="stylesheet" />

    <script type="text/javascript" src="Scripts/jquery-1.7.1.min.js"></script>

<%--    <script type="text/javascript">

        $(document).ready(function () {
            function myFunc() {
                // window.setTimeout(function () {
                app.init("", "");
                // }, 500);
            }; 


            // document.addEventListener('DOMContentLoaded', function () {
            console.log('loaded');
            document.getElementById('mybtn').addEventListener('click', myFunc);
            // });
        });
        

        </script>--%>



    <script>

        $var=<%=flag2%>;

        if($var==2)
            $('haha').css('display','none')
       
    </script>



</head>
<%--<body>--%>
<body class="home first-load">
     <form id="form1" runat="server">
        <div>
            <%--   <div style="display: none">--%>

            <svg xmlns="http://www.w3.org/2000/svg">

                <symbol
                    viewBox="0 0 71 71" id="svg-circle">
                    <title>circle</title>
                    <path
                        d="M35.5,1.6c18.7,0,33.9,15.2,33.9,33.9S54.2,69.4,35.5,69.4S1.6,54.2,1.6,35.5S16.8,1.6,35.5,1.6z" />
                </symbol>
                <symbol
                    viewBox="0 0 15.3 15.3" id="svg-cross">
                    <title>cross</title>
                    <g>
                        <path
                            fill-rule="evenodd" clip-rule="evenodd" d="M9.8,7.7l4.6-4.6C15,2.5,15,1.5,14.4,1c-0.6-0.6-1.5-0.6-2.1,0
L7.7,5.6L3.1,1C2.5,0.4,1.5,0.4,1,1C0.4,1.5,0.4,2.5,1,3.1l4.6,4.6L1,12.3c-0.6,0.6-0.6,1.5,0,2.1c0.6,0.6,1.5,0.6,2.1,0l4.6-4.6
l4.6,4.6c0.6,0.6,1.5,0.6,2.1,0c0.6-0.6,0.6-1.5,0-2.1L9.8,7.7z" />
                    </g>
                </symbol>
                <symbol
                    viewBox="0 0 66 66" id="svg-dot-circle">
                    <title>dot-circle</title>
                    <g
                        opacity="0.3">
                        <path
                            fill="#35251E" d="M31.1 64c0-1.1 0.9-2 2-2l0 0c1.1 0 2 0.9 2 2l0 0c0 1.1-0.9 2-2 2l0 0C32 66 31.1 65.1 31.1 64zM25.7 65.2c-1.1-0.2-1.8-1.3-1.5-2.4l0 0c0.2-1.1 1.3-1.8 2.4-1.5l0 0c1.1 0.2 1.8 1.3 1.5 2.4l0 0c-0.2 0.9-1 1.6-1.9 1.6l0 0C26 65.2 25.9 65.2 25.7 65.2zM38 63.7c-0.2-1.1 0.4-2.1 1.5-2.4l0 0c1.1-0.2 2.1 0.4 2.4 1.5l0 0c0.2 1.1-0.4 2.1-1.5 2.4l0 0c-0.2 0-0.3 0-0.4 0l0 0C39 65.2 38.2 64.6 38 63.7zM18.8 62.8c-1-0.5-1.4-1.7-0.9-2.7l0 0c0.5-1 1.7-1.4 2.7-0.9l0 0c1 0.5 1.4 1.7 0.9 2.7l0 0c-0.4 0.7-1.1 1.1-1.8 1.1l0 0C19.3 63 19 62.9 18.8 62.8zM44.7 61.8c-0.5-1-0.1-2.2 0.9-2.7l0 0c1-0.5 2.2-0.1 2.7 0.9l0 0c0.5 1 0.1 2.2-0.9 2.7l0 0c-0.3 0.1-0.6 0.2-0.9 0.2l0 0C45.8 62.9 45 62.5 44.7 61.8zM12.5 58.8c-0.9-0.7-1-1.9-0.3-2.8l0 0c0.7-0.9 1.9-1 2.8-0.3l0 0c0.9 0.7 1 1.9 0.3 2.8l0 0c-0.4 0.5-1 0.8-1.6 0.8l0 0C13.3 59.3 12.8 59.1 12.5 58.8zM50.8 58.5c-0.7-0.9-0.6-2.1 0.3-2.8l0 0c0.9-0.7 2.1-0.6 2.8 0.3l0 0c0.7 0.9 0.6 2.1-0.3 2.8l0 0c-0.4 0.3-0.8 0.4-1.2 0.4l0 0C51.8 59.2 51.2 58.9 50.8 58.5zM7.2 53.6c-0.7-0.9-0.6-2.1 0.3-2.8l0 0c0.9-0.7 2.1-0.5 2.8 0.3l0 0c0.7 0.9 0.6 2.1-0.3 2.8l0 0c-0.4 0.3-0.8 0.4-1.2 0.4l0 0C8.2 54.4 7.6 54.1 7.2 53.6zM56 53.9c-0.9-0.7-1-2-0.3-2.8l0 0c0.7-0.9 2-1 2.8-0.3l0 0c0.9 0.7 1 1.9 0.3 2.8l0 0c-0.4 0.5-1 0.8-1.6 0.8l0 0C56.8 54.3 56.4 54.1 56 53.9zM3.3 47.4c-0.5-1-0.1-2.2 0.9-2.7l0 0c1-0.5 2.2-0.1 2.7 0.9l0 0c0.5 1 0.1 2.2-0.9 2.7l0 0c-0.3 0.1-0.6 0.2-0.9 0.2l0 0C4.4 48.5 3.6 48.1 3.3 47.4zM60.1 48.2c-1-0.5-1.4-1.7-0.9-2.7l0 0c0.5-1 1.7-1.4 2.7-0.9l0 0c1 0.5 1.4 1.7 0.9 2.7l0 0c-0.4 0.7-1.1 1.1-1.8 1.1l0 0C60.7 48.4 60.4 48.3 60.1 48.2zM0.8 40.4c-0.2-1.1 0.4-2.1 1.5-2.4l0 0c1.1-0.2 2.1 0.4 2.4 1.5l0 0c0.2 1.1-0.4 2.1-1.5 2.4l0 0c-0.1 0-0.3 0-0.4 0l0 0C1.9 42 1 41.4 0.8 40.4zM62.8 41.8c-1.1-0.2-1.8-1.3-1.5-2.4l0 0c0.2-1.1 1.3-1.8 2.4-1.5l0 0c1.1 0.2 1.8 1.3 1.5 2.4l0 0c-0.2 0.9-1 1.6-2 1.6l0 0C63.1 41.9 62.9 41.8 62.8 41.8zM0 33.1c0-1.1 0.9-2 2-2l0 0c1.1 0 2 0.9 2 2l0 0c0 1.1-0.9 2-2 2l0 0c0 0 0 0 0 0l0 0C0.9 35.1 0 34.2 0 33.1zM62 33L62 33c0-1.1 0.9-2 2-2l0 0c1.1 0 2 0.9 2 2l0 0c0 1.1-0.9 2-2 2l0 0C62.9 35 62 34.1 62 33zM2.3 28.1c-1.1-0.2-1.8-1.3-1.5-2.4l0 0C1 24.7 2.1 24 3.2 24.2l0 0c1.1 0.2 1.8 1.3 1.5 2.4l0 0c-0.2 0.9-1 1.6-1.9 1.6l0 0C2.6 28.2 2.5 28.2 2.3 28.1zM61.3 26.5c-0.2-1.1 0.4-2.2 1.5-2.4l0 0c1.1-0.2 2.1 0.4 2.4 1.5l0 0 0 0 0 0c0.2 1.1-0.4 2.1-1.5 2.4l0 0c-0.1 0-0.3 0-0.5 0l0 0C62.3 28.1 61.5 27.4 61.3 26.5zM4.1 21.4c-1-0.5-1.4-1.7-0.9-2.7l0 0c0.5-1 1.7-1.4 2.7-0.9l0 0c1 0.5 1.4 1.7 0.9 2.7v0c-0.3 0.7-1.1 1.1-1.8 1.1l0 0C4.7 21.6 4.4 21.6 4.1 21.4zM59.1 20.4c-0.5-1-0.1-2.2 0.9-2.7l0 0c1-0.5 2.2-0.1 2.7 0.9l0 0c0.5 1 0.1 2.2-0.9 2.7l0 0c-0.3 0.1-0.6 0.2-0.9 0.2l0 0C60.2 21.5 59.5 21.1 59.1 20.4zM7.4 15.3c-0.9-0.7-1-1.9-0.3-2.8l0 0c0.7-0.9 1.9-1 2.8-0.3l0 0c0.9 0.7 1 1.9 0.3 2.8l0 0c-0.4 0.5-1 0.8-1.6 0.8l0 0C8.3 15.8 7.8 15.6 7.4 15.3zM55.7 14.9L55.7 14.9C55 14 55.1 12.8 56 12.1l0 0c0.9-0.7 2.1-0.5 2.8 0.3l0 0c0.7 0.9 0.5 2.1-0.3 2.8l0 0c-0.4 0.3-0.8 0.4-1.2 0.4l0 0C56.6 15.7 56.1 15.4 55.7 14.9zM12 10.1c-0.7-0.9-0.6-2.1 0.3-2.8l0 0c0.9-0.7 2.1-0.6 2.8 0.3l0 0c0.7 0.9 0.6 2.1-0.3 2.8l0 0c-0.4 0.3-0.8 0.4-1.3 0.4l0 0C13 10.8 12.4 10.6 12 10.1zM51.1 10.3L51.1 10.3c-0.9-0.7-1-2-0.3-2.8l0 0c0.7-0.9 1.9-1 2.8-0.3l0 0 0 0 0 0c0.9 0.7 1 1.9 0.3 2.8l0 0c-0.4 0.5-1 0.8-1.6 0.8l0 0C51.9 10.8 51.4 10.6 51.1 10.3zM17.6 6c-0.5-1-0.1-2.2 0.9-2.7l0 0c1-0.5 2.2-0.1 2.7 0.9l0 0c0.5 1 0.1 2.2-0.9 2.7l0 0C20 7 19.7 7.1 19.4 7.1l0 0C18.7 7.1 18 6.7 17.6 6zM45.6 6.9L45.6 6.9c-1-0.5-1.4-1.7-0.9-2.7l0 0c0.5-1 1.7-1.4 2.7-0.9l0 0c1 0.5 1.4 1.7 0.9 2.7l0 0c-0.4 0.7-1.1 1.1-1.8 1.1l0 0C46.1 7.1 45.9 7 45.6 6.9zM24 3.2c-0.2-1.1 0.4-2.2 1.5-2.4l0 0 0 0 0 0c1.1-0.2 2.1 0.4 2.4 1.5l0 0c0.2 1.1-0.4 2.2-1.5 2.4l0 0c-0.1 0-0.3 0-0.4 0l0 0C25.1 4.8 24.2 4.2 24 3.2zM39.4 4.7L39.4 4.7c-1.1-0.2-1.8-1.3-1.5-2.4l0 0c0.2-1.1 1.3-1.8 2.4-1.5l0 0c1.1 0.2 1.8 1.3 1.5 2.4l0 0c-0.2 0.9-1 1.6-1.9 1.6l0 0C39.8 4.8 39.6 4.8 39.4 4.7zM30.9 2c0-1.1 0.9-2 2-2l0 0c0 0 0 0 0.1 0l0 0c0 0 0 0 0.1 0l0 0c1.1 0 2 0.9 2 2l0 0c0 1.1-0.9 2-2 2l0 0c0 0 0 0-0.1 0l0 0c0 0 0 0-0.1 0l0 0h0l0 0C31.8 4 30.9 3.1 30.9 2z" />
                    </g>
                </symbol>
                <symbol
                    viewBox="0 0 168 168" id="svg-frame">
                    <title>frame</title>
                    <path
                        fill="#1D1D1D" d="M152 16v136H16V16H152M168 0H0v168h168V0L168 0z" />
                </symbol>


                <symbol
                    viewBox="0 0 8 18" id="svg-menu-arrow">
                    <title>menu-arrow</title>
                    <path
                        d="M4.4,17.8l3.5-4.5c0.2-0.2,0.1-0.5-0.1-0.7c-0.2-0.2-0.5-0.1-0.7,0.1L4.5,16V0.5C4.5,0.2,4.3,0,4,0
S3.5,0.2,3.5,0.5V16l-2.6-3.4c-0.2-0.2-0.5-0.3-0.7-0.1C0.1,12.7,0,12.8,0,13c0,0.1,0,0.2,0.1,0.3l3.5,4.5C3.7,17.9,3.8,18,4,18
S4.3,17.9,4.4,17.8z" />
                </symbol>
                <symbol
                    viewBox="0 0 1 18" id="svg-menu-line-arrow">
                    <title>menu-line-arrow</title>
                    <path
                        d="M0,17.6L0,0.4C0,0.2,0.2,0,0.5,0C0.8,0,1,0.2,1,0.4v17.3C1,17.8,0.8,18,0.5,18S0,17.8,0,17.6z" />
                </symbol>
                <symbol
                    viewBox="0 0 168 168" id="svg-square">
                    <title>square</title>
                    <polyline
                        fill="none" stroke="#1D1D1D" stroke-width="16" stroke-linecap="square" stroke-miterlimit="10" points="8,8 160,8
160,160 8,160 8,8 " />
                                    </symbol>

            </svg>
        </div>

       


        <a
            id="close-btn" class="close-btn" href="#" title="Close">
            <i
                class="menu-icon icon-close">
                <svg viewbox="0 0 15.3 15.3" class="svg-cross">
                <use
                    xlink:href="#svg-cross">
                </use>
            </svg>
            </i>

        </a>


        <i
            class="square-loading" style="opacity: 0;">
            <svg
                version="1.1"
                xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" xmlns:a="http://ns.adobe.com/AdobeSVGViewerExtensions/3.0/" class="svg-square">
                <rect
                    x=".5em" y=".5em" width="" height="" stroke-linecap="square" stroke-width="1em" />
            </svg>
            <span
                class="square-loading_fix"></span>
        </i>
        <span
            class="h-line h-line-bottom"></span>
        <span
            class="h-line h-line-top"></span>
        <div
            id="menu" class="menu">
            <div
                class="option-container">
              
                  <div
                    class="menu-option is-black" id="option1" data-url="/projets/" data-title="Projets">
                    <i
                        class="menu-icon icon-projets">
                        <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                        <svg
                        viewbox="0 0 71 71" class="svg-circle">
                        <use
                            xlink:href="#svg-circle">
                        </use>
                    </svg>
                      </asp:LinkButton>
                    </i>
                    <span
                        class="menu-text">Account Details</span>
                </div>
                  



                <div
                    class="menu-option is-black" id="option2" data-url="/ouverture/" data-title="Ouverture">
                    <i
                        class="menu-icon icon-ouverture">
                        <asp:LinkButton ID="LinkButton2" runat="server" OnClick="LinkButton2_Click">
                        <svg
                            viewbox="0 0 71 71" class="svg-circle">
                        <use
                            xlink:href="#svg-circle">
                        </use>
                    </svg>
                        </asp:LinkButton>
                    </i>
                    <span
                        class="menu-text">My Orders</span>
                </div>
                <div
                    class="menu-option is-black" id="option3" data-url="/courrier/" data-title="Courrier">
                    <i
                        class="menu-icon icon-courrier">
                        <asp:LinkButton ID="LinkButton3" runat="server" OnClick="LinkButton3_Click">
                        <svg
                            viewbox="0 0 71 71" class="svg-circle">
                        <use
                            xlink:href="#svg-circle">
                        </use>
                    </svg>
                            </asp:LinkButton>
                    </i>
                    <span
                        class="menu-text">Account Settings</span>
                </div>
                <div
                    class="menu-option is-black" id="option4" data-url="/a-propos/" data-title="&Agrave; propos">
                    <i
                        class="menu-icon icon-apropos">
                        <asp:LinkButton ID="LinkButton4" runat="server" OnClick="LinkButton4_Click">
                        <svg
                            viewbox="0 0 71 71" class="svg-circle">
                        <use
                            xlink:href="#svg-circle">
                        </use>
                    </svg>
                      </asp:LinkButton>
                    </i>
                    <span
                        class="menu-text">Family Account</span>
                </div>
            </div>
            <div
                class="heading">
                <div
                    class="menu-logo">
                    <i
                        id="menu-btn" class="menu-btn">
                        <i
                            class="menu-icon dots-icon">
                            <svg
                                viewbox="0 0 66 66" class="svg-dot-circle">
                            <use
                                xlink:href="#svg-dot-circle">
                            </use>
                        </svg>
                        </i>
                        <%-- <i
                        class="menu-icon logo-icon arrow-icon">
                        <svg
                            viewbox="0 0 8 18" class="svg-menu-arrow">
                            <use
                                xlink:href="#svg-menu-arrow">
                            </use>
                        </svg>
                    </i>--%>
                        <i
                            class="menu-icon logo-icon arrow-line-icon">
                            <svg
                                viewbox="0 0 1 18" class="svg-menu-line-arrow">
                            <use
                                xlink:href="#svg-menu-line-arrow">
                            </use>
                        </svg>
                        </i>
                        <span
                            id="menu-label" class="logo-icon menu-label"><span
                                class="label-text">Menu</span><span
                                    class="drop-text">Hit!</span></span>
                    </i>
                </div>
                <div
                    class="heading-text">
                    <h1 class="title-1 noselect">CheckUp</h1>
                    <h2 class="title-2 noselect">My Account</h2>
                </div>
            </div>
        </div>

         

        </form>
<%--        <div>
        </div>--%>
          
   <%-- <div id="haha">
      <button id="mybtn" type="submit">Submit</button>
        </div>--%>
        


















        <script type="text/javascript" src="AccountPage/4c9a9956b854a4f00943853ff15b2c99a81d6e7a.1441614784.js"></script>
        <script type="text/javascript">
            window.addEventListener('load', function () { app.init("", ""); });

        </script>


        





</body>

</html>
