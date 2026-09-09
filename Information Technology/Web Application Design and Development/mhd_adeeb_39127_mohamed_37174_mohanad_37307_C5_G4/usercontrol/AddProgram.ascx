<%@ Control Language="C#" AutoEventWireup="true" CodeFile="AddProgram.ascx.cs" Inherits="usercontrol_AddProgram" %>
<style type="text/css">
    .style1
    {
        width: 39%;
        height: 188px;
        margin-right: 1px;
    }
    .style3
    {
        width: 95px;
    }
    .style4
    {
    }
    .style5
    {
        width: 39px;
    }
    .style6
    {
        height: 39px;
    }
    .style7
    {
        width: 116px;
    }
</style>
<table class="style1">
    <tr>
        <td class="style6" colspan="3">
            <asp:Image ID="Image1" runat="server" Height="29px" 
                ImageUrl="~/data/AddProgram.jpg" Width="318px" />
        </td>
    </tr>
    <tr>
        <td class="style7">
    <asp:Label ID="Label1" runat="server" Text="Program Name"></asp:Label>
        </td>
        <td class="style3">
    <asp:TextBox ID="TextBox1" runat="server" Height="16px" Width="103px"></asp:TextBox>
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ToolTip="Program Name Is Null!!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style7">
    <asp:Label ID="Label2" runat="server" Text="Description"></asp:Label>
        </td>
        <td class="style3">
    <asp:TextBox ID="TextBox2" runat="server" Height="16px" Width="103px"></asp:TextBox>
        </td>
        <td class="style5">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="TextBox2" ToolTip="Description Is Null!!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style7">
            <asp:Label ID="Label3" runat="server" ForeColor="Red" Visible="False"></asp:Label>
        </td>
        <td class="style3">
    <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" />
        </td>
        <td class="style5">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4" colspan="3">
            <asp:Image ID="Image2" runat="server" Height="25px" 
                ImageUrl="~/data/LogIn Bar2.jpg" Width="314px" />
        </td>
    </tr>
</table>

