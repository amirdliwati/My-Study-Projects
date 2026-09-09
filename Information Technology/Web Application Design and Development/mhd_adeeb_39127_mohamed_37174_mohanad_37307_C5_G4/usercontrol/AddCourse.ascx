<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddCourse.ascx.cs" Inherits="usercontrol_AddCourse" %>
<html>
<head>
<style type="text/css">

    .style1
    {
        width: 54%;
    }
    .style7
    {
        width: 142px;
        height: 30px;
    }
    .style8
    {
        width: 157px;
        height: 30px;
    }
    .style9
    {
        height: 30px;
    }
    .style3
    {
        width: 157px;
    }
    .style4
    {
        width: 142px;
        height: 23px;
    }
    .style5
    {
        width: 157px;
        height: 23px;
    }
    .style6
    {
        height: 23px;
    }
    </style>
</head>
<body>
<form id ="form1"  method = "post">

<table class="style1">
    <tr>
        <td class="style2" colspan="3">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/data/AddCourse.jpg" 
                Width="361px" />
        </td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label1" runat="server" Text="Program Name"></asp:Label>
        </td>
        <td class="style8">
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="pro_n" DataValueField="pro_id" 
                Height="16px" Width="103px">
            </asp:DropDownList>
        </td>
        <td class="style9">
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="Label2" runat="server" Text="Semester"></asp:Label>
        </td>
        <td class="style3">
            <asp:TextBox ID="TextBox6" runat="server" Height="16px" Width="103px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="TextBox6" ToolTip="Semester Is Null!!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="Label3" runat="server" Text="Code"></asp:Label>
        </td>
        <td class="style3">
            <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="103px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ToolTip="Code Is Null!!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="Label4" runat="server" Text="Course Name"></asp:Label>
        </td>
        <td class="style3">
            <asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="103px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox2" ToolTip="Course Name Is Null!!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="Label5" runat="server" Text="Number Of Sessions"></asp:Label>
        </td>
        <td class="style3">
            <asp:TextBox ID="TextBox3" runat="server" Height="16px" Width="103px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox3" ToolTip="Number Of Sessions Is Null!!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="Label6" runat="server" Text="Price"></asp:Label>
        </td>
        <td class="style3">
            <asp:TextBox ID="TextBox4" runat="server" Height="16px" Width="103px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox4" ToolTip="Price Is Null!!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="Label7" runat="server" Text="Maximum Number Of Students"></asp:Label>
        </td>
        <td class="style3">
            <asp:TextBox ID="TextBox5" runat="server" Height="16px" Width="103px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBox5" ToolTip="Max Number Is Null!!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style2">
            <asp:Label ID="Label8" runat="server" Text="Open"></asp:Label>
        </td>
        <td class="style3">
            <asp:CheckBox ID="CheckBox1" runat="server" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4">
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                SelectCommand="SELECT [pro_id], [pro_n] FROM [program]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server"></asp:SqlDataSource>
        </td>
        <td class="style5">
            <asp:Button ID="Button1" runat="server" Text="Add" onclick="Button1_Click" 
                Width="113px" />
            </td>
        <td class="style6">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style2" colspan="3">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/data/Copyright.jpg" 
                Width="365px" />
        </td>
    </tr>
</table>

</form>
</body>
</html>