<%@ Control Language="C#" AutoEventWireup="true" CodeFile="LogIn.ascx.cs" Inherits="usercontrol_login" %>

<style type="text/css">

        .style5
        {
            width: 121px;
            height: 23px;
        }
        .style25
        {
            width: 92px;
            height: 26px;
        }
        .style26
        {
            height: 26px;
        }
        .style11
        {
            width: 92px;
        }
        .style12
        {
            width: 92px;
            height: 17px;
        }
        .style13
        {
            height: 17px;
        }
        .style4
        {
            width: 121px;
        }
        .style1
        {
            width: 32%;
        height: 190px;
    }
        </style>
<table class="style1">
        <tr>
            <td class="style5" colspan="2">
                <asp:Image ID="Image1" runat="server" ImageUrl="~/data/LogIn Bar.jpg" 
                    Width="233px" />
            </td>
        </tr>
        <tr>
            <td class="style25">
    <asp:Label ID="Label1" runat="server" Text="User name"></asp:Label>
            </td>
            <td class="style26">
    <asp:TextBox ID="TextBox1" runat="server" Height="16px" 
        style="margin-left: 5px" Width="103px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
        ControlToValidate="TextBox1" ToolTip="User Name Is Null !!!" 
        ValidationGroup="log">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style11">
    <asp:Label ID="Label2" runat="server" Text="Password"></asp:Label>
            </td>
            <td>
    <asp:TextBox ID="TextBox2" runat="server" Height="16px" 
        style="margin-left: 5px" TextMode="Password" Width="102px"></asp:TextBox>
                &nbsp;<asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
        ControlToValidate="TextBox2" ToolTip="Password Is Null !!!" 
        ValidationGroup="log">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style12">
    <asp:Label ID="Label3" runat="server" Text="Auth.Level"></asp:Label>
            </td>
            <td class="style13">
    <asp:DropDownList ID="DropDownList1" runat="server" Height="18px" Width="103px" style="margin-left: 5px">
        <asp:ListItem>Staff</asp:ListItem>
        <asp:ListItem>Student</asp:ListItem>
    </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="style5" colspan="2">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Button ID="Button1" runat="server" Height="25px" onclick="Button1_Click" 
        Text="LogIn" ValidationGroup="log" 
                    style="margin-left: 88px; margin-top: 0px; margin-bottom: 0px" 
                    Width="74px" />
                <br />
&nbsp;<asp:Label ID="Label10" runat="server" ForeColor="Red" Visible="False">*</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                <asp:Image ID="Image2" runat="server" ImageUrl="~/data/LogIn Bar2.jpg" 
                    Width="233px" />
            </td>
        </tr>
        <tr>
            <td class="style4" colspan="2">
                &nbsp;</td>
        </tr>
    </table>
