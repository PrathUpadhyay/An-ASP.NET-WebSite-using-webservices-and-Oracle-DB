<%@ Page Title="" Language="C#" MasterPageFile="~/head.Master" AutoEventWireup="true" CodeBehind="password_change.aspx.cs" Inherits="CheckUp.password_change" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">
   
    <div style="margin:10% 12% 10% 28%;">
        <h4><asp:Label ID="Label1" runat="server" Text="Verification Code has been sent to your Email!" style="color:darkblue;"></asp:Label><br /></h4>
    </div>
    <div style="margin:-6% 6% 5% 34%;;">    
        <asp:TextBox ID="TextBox1" runat="server" placeholder="Enter the Verification Code" style="display:inline-block;padding:8px;color:black;font-weight:500;" Height="40px" Width="350px"></asp:TextBox> <br />  
       <h5> <asp:Label ID="Label2" runat="server" Text="Label" Visible="false" style="color:red;"></asp:Label> </h5>
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password" placeholder="New Password" style="display:inline-block;padding:8px;color:black;font-weight:500;" Height="40px" Width="350px"></asp:TextBox> <br />      
        <asp:TextBox ID="TextBox3" runat="server" TextMode="Password" placeholder="Confirm Password" style="display:inline-block;padding:8px;color:black;font-weight:500;" Height="40px" Width="350px"></asp:TextBox> <br /> <br />
       <h5> <asp:Label ID="Label3" runat="server" Text="Label" Visible="false" style="color:red;"></asp:Label></h5>
        <asp:Button ID="Button1" runat="server" Text="Change Password" class="email" Height="50px" Width="175px" OnClick="Button1_Click" />
        <asp:Button ID="Button2" runat="server" Text="Resend Email" class="email" Height="50px" Width="175px" OnClick="Button2_Click" />
    </div>
</asp:Content>
