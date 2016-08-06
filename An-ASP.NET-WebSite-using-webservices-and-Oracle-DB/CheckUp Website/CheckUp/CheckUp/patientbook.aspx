<%@ Page Title="" Language="C#" MasterPageFile="~/head_patient.Master" AutoEventWireup="true" CodeBehind="patientbook.aspx.cs" Inherits="CheckUp.patientbook" Culture = "en-GB"  EnableEventValidation="false" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">


    <title>Booking</title>
     <%--<meta name="viewport" content="width=device-width, initial-scale=1.0" />--%>
   
    <link rel="stylesheet" type="text/css" href="/CSS/font-awesome.min.css" />

<%--    <script type="text/javascript" src="/Scripts/jquery-1.10.2.min.js"></script>--%>
    <%--<script type="text/javascript" src="/Scripts/bootstrap.min.js"></script>--%> 
    <%--<script src="/CSS/jquery-ui.min.css"></script>--%>

   
    <style type="text/css">
.table th, .table td {
    border: 0px !important;
}
.table {
    border: 0px !important;
    }

.table th{
    font-family: Sen-Regular;
    font-size: 20px;
}

</style>




</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder2" runat="server">

    <body style="background-color:#fff" >
<%--<div class="page-header">--%>
    <h1 style="font-family:Pacifico;color:#00B8E6;text-shadow: 2px 2px 5px Orange;padding:5px;margin-left:210px;margin-top:20px;">Booking &nbsp Details:</h1>
<%--</div>--%>

<!-- Registration form - START -->
<div class="container" style="margin-top:80px">
    <div class="row">
        <form role="form">
            <div class="col-md-6">
                <div class="well well-sm"><strong><span class="glyphicon glyphicon-asterisk"></span>Required Field</strong></div>
                 <div class="form-group">
                    <label for="InputEmail">Enter Name</label>
                    <div class="input-group">
                        <asp:TextBox ID="TextBox1" class="form-control" runat="server" placeholder="Enter Name" ReadOnly="true" style="width:410px;height:40px"></asp:TextBox>
                        <%--<input type="text" class="form-control" runat="server" id="InputNameFirst" placeholder="Enter Name" style="width:410px;height:40px"/>--%>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="InputEmail">Enter Email</label>
                    <div class="input-group">
                        <asp:TextBox ID="TextBox2" class="form-control" runat="server" placeholder="Enter Email" ReadOnly="true" style="width:410px;height:40px" TextMode="Email"></asp:TextBox>
                        <%--<input type="email" class="form-control" runat="server" id="InputEmailFirst" name="InputEmail" placeholder="Enter Email" required="required" style="width:410px;height:40px"/>--%>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                <div class="form-group">
                    <label for="InputEmail">Phone Number</label>
                    <div class="input-group">
                       <asp:TextBox ID="TextBox3" class="form-control" runat="server" placeholder="Phone Number" style="width:410px;height:40px" TextMode="Phone"></asp:TextBox>
                     
                         <%--<input type="text" class="form-control" runat="server" id="InputEmailSecond" name="InputEmail" placeholder="Phone Number" required="required" style="width:410px;height:40px"/>--%>
                        <span class="input-group-addon"><span class="glyphicon glyphicon-asterisk"></span></span>
                    </div>
                </div>
                
                <label class="radio-inline"><input type="radio" name="optradio" runat="server"/>Male</label>
                <label class="radio-inline"><input type="radio" name="optradio" runat="server"/>Female</label>
                
               <br />
                 <br />
                <div class="form-group">
                    <label for="InputEmail">Date of Booking</label>
                    <div class="input-group" style="position:relative;">
                        <asp:TextBox ID="TextBox4" class="form-control" runat="server" placeholder="dd/mm/yyyy" style="width:216px;height:40px;text-align:center;" TextMode="Date"></asp:TextBox>
                    <span class="input-group-addon" style="position:absolute;margin-left:200px;height:40px;text-align:center;"><span class="glyphicon glyphicon-asterisk" style="padding:5px"></span></span>
                        <asp:CompareValidator  ID="CompareValidator2"
  ControlToValidate="TextBox4"
  runat="server"
  ErrorMessage="..     Enter Valid Date"
  Operator="GreaterThan" Display="Dynamic"
      ValueToCompare="<%# DateTime.Today.ToShortDateString() %>"
  ForeColor = "Red"
  Type="Date" ValidateRequestMode="Disabled"></asp:CompareValidator>
                        <%-- <asp:TextBox ID="TextBox5" class="form-control" runat="server" placeholder="mm" style="width:58px;height:40px;text-align:center;" TextMode="Date"></asp:TextBox>
                     <asp:TextBox ID="TextBox6" class="form-control" runat="server" placeholder="yyyy" style="width:58px;height:40px;text-align:center;" TextMode="Date"></asp:TextBox>
                     --%>
                        <%--<input type="text" class="form-control" runat="server" id="dd" name="InputEmail" placeholder="dd" required="required" style="width:58px;height:40px;text-align:center;"/>--%>
                        <%--<input type="text" class="form-control" runat="server" id="mm" name="InputEmail" placeholder="mm" required="required" style="width:58px;height:40px;text-align:center;"/>--%>
                         <%--<input type="text" class="form-control" runat="server" id="yy" name="InputEmail" placeholder="yyyy" required="required" style="width:100px;height:40px;text-align:center;"/>--%>
                        
                    </div>
                </div>
                <br />
                <label class="checkbox-inline">
                    <asp:CheckBox ID="family" runat="server" OnCheckedChanged="family_CheckedChanged" AutoPostBack="true"/><b style="color:darkgreen;">Book Test For Family</b></label><a href="FamilyAccount.aspx"><asp:Label ID="Label3" runat="server" Text="   No family member added.Add some." Visible="false" ForeColor="Red"></asp:Label></a>
                <br/>
                <asp:Label ID="Label4" runat="server" Text="Net Amount: " Visible="false" Font-Size="Large" ForeColor="Red"></asp:Label><asp:Label ID="Label5" runat="server" Text="Label" Visible="false" Font-Size="Large" ForeColor="Red"></asp:Label>
                <br/>
               <%-- <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-right" onclick="submit">--%>
                
               
                <asp:Button ID="Button1" runat="server" Text="Book Now" class="btn" Width="100px" Height="40px" style="color:blue;font-weight:bolder" BorderColor="#0066FF" OnClick="Button1_Click"/>
            </div>
        </form>
        <div class="col-md-5">
            <div class="col-md-12">
                <div class="panel panel-info" style="width:452px;">

                    <div class="panel-heading" style="width:450px;">
                     <h1 class="panel-title" style="font-family:Calibri;font-size:20px">Review Booking</h3><br>
                       <table class="table table-bordered">
    <thead>
      <tr>
        <th>Test</th>
        <th>Instructions</th>
        <th>Price</th>
      </tr>
    </thead>
    <tbody style="font-family:Calibri">
      <tr>
        <td style="width:200px;"> <asp:label ID="testname" runat="server"></asp:label></td>
        <td style="width:100px;">Carry Prescription from Doctor</td>
        <td style="width:150px;"><asp:Label ID="price" runat="server"></asp:Label> </td>
      </tr>
      
    </tbody>
  </table>


                                                </div>

                </div>

                <div class="panel panel-primary" style="height:130px">
                            <div class="panel-heading"><h4>Center Details</h4></div>
                        <asp:Label ID="Label2" runat="server"></asp:Label>
                    <br />    <asp:Label ID="address" runat="server"></asp:Label>
                  <br />  <asp:Label ID="Label1" runat="server"></asp:Label>
                </div>
               <!--  <div class="col-lg-"></div> -->
                  
            </div>
        </div>
    </div>
</div>
<!-- Registration form - END -->
        </body>

</asp:Content>
