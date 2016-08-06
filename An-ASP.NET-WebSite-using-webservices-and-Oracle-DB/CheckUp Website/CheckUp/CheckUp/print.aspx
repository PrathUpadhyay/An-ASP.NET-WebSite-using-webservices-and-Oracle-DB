<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="print.aspx.cs" Inherits="CheckUp.print" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    <script type = "text/javascript">
     function PrintPanel() {
         var panel = document.getElementById("<%=pnlContents.ClientID %>");
            var printWindow = window.open('', '', 'height=400,width=800');
            printWindow.document.write('<html><head><title>Receipt Details|CheckUp Portal</title>');
            printWindow.document.write('</head><body >');
            printWindow.document.write(panel.innerHTML);
            printWindow.document.write('</body></html>');
            printWindow.document.close();
            setTimeout(function () {
                printWindow.print();
            }, 500);
            return false;
        }
    </script>
<asp:Panel id="pnlContents" runat = "server">
   
<style>
     table {
  font-family: 'Comic Sans MS';
  font-size: 14px;
  color: #212121;
  margin: 0 auto;
  width: 960px;
  border-collapse: collapse;
}
thead th {
  font-size: 20px;
  color: #212121;
  height: 40px;
  border: 1px solid #e6eaed;
  background: -webkit-gradient(linear, 0% 0%, 0% 100%, from(#e7f0fa), to(#dbe8f5));
}

.first {
  padding-right:40px;
  width: 230px;
  text-align: right;
  border-right:  none;
  font-weight: 200;
}
.odd {
  background-color: #f6f9fb;
}
td {
  height: 40px;
  width: 230px;
  border-bottom: 1px solid #e6eaed;
}

    </style>
    <table>
   <tbody>
       <tr>
           <td colspan="4" style="background-color:whitesmoke;"">
               <asp:Image ID="Image1" runat="server" ImageUrl="~/img/logoo.png" Width="180px" Height="70px" />
           </td>
       </tr>
       <tr>
           <td colspan="4" style="word-spacing:5px;background-color:darkblue;color:white;">
               Receipt for Lab Test taken. This Receipt is generated from CheckUp Portal
           </td>
       </tr>
      <tr class="odd">     
      <td class="first" style="float:left;">Test: </td>
      <td>
            <asp:Label ID="Label6" runat="server" Text="Label"> </asp:Label></td>
    </tr>
       <tr class="even"> 
      <td class="first" style="float:left;">Amount: </td>
      <td>
          <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label> </td>
    </tr>
    <tr class="odd">     
      <td class="first" style="float:left;">Lab Name: </td>
      <td>
            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
    </tr>
    <tr class="even">    
      <td class="first" style="float:left;">Address: </td>
      <td>
           <asp:Label ID="Label3" runat="server"></asp:Label></td>
    </tr>
    <tr class="odd">    
     <td class="first" style="float:left;">Location: </td>
      <td>
           <asp:Label ID="Label4" runat="server" Text="Label"></asp:Label></td>
    </tr>
              <tr class="even">     
      <td class="first" style="float:left;">Contacts: </td>
      <td>
          <asp:Label ID="Label7" runat="server" Text="Label"></asp:Label> </td>
    </tr>
  </tbody>
    </table>
    </asp:Panel>

        <center> <asp:Button ID="btnPrint" runat="server" Text="Get PDF" OnClientClick = "return PrintPanel();" style="margin-top:50px;" Width="100px" /></center>
    </div>
    </form>
</body>
</html>
