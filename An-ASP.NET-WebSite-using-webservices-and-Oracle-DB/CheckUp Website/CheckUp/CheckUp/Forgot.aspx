<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="Forgot.aspx.cs" Inherits="CheckUp.Forgot" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
    <div style="margin:10% 12% 10% 28%;">
        <h1><asp:Label ID="Label1" runat="server" Text="Forgotten your Password! " style="color:CaptionText;"></asp:Label></h1>
      <h4><asp:Label ID="Label2" runat="server" Text="Provide your registered email-Id to get the further instructions..." style="color:CaptionText;"></asp:Label></h4>
    </div>
    <div style="display:inline-block;margin:-6% 6% 5% 34%;">
       <h5> <asp:Label ID="Label3" runat="server" Text="Label" Visible="false"></asp:Label></h5> <br />
         <asp:TextBox ID="TextBox1" runat="server" placeholder="Email-id" Height="50px" Width="410px" TextMode="Email" style="display:inline-block;padding:8px;margin-top:5%;"></asp:TextBox><br />
        <asp:Button ID="Button1" runat="server" Text="Send Email" class="email" Height="50px" Width="410px" OnClick="Button1_Click" />
    </div>
</asp:Content>
