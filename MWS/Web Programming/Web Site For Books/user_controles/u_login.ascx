<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_login.ascx.cs" Inherits="user_controles_u_login" %>
<style type="text/css">

        .style1
        {
            width: 25%;
        height: 190px;
    }
        
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
        .style27
    {
        width: 121px;
        height: 19px;
    }
    .style28
    {
        width: 121px;
        height: 16px;
    }
        </style>

<table class="style1">
    <tr>
        <td class="style5" colspan="2">
            <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/LogIn Bar.jpg" 
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
            <asp:DropDownList ID="DropDownList1" runat="server" Height="18px" 
                style="margin-left: 5px" Width="103px">
                <asp:ListItem>Admin</asp:ListItem>
                <asp:ListItem>Custmer</asp:ListItem>
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style27" colspan="2">
            &nbsp;<asp:Button ID="Button1" runat="server" Height="25px" onclick="Button1_Click" 
                style="margin-left: 88px; margin-top: 0px; margin-bottom: 0px" Text="LogIn" 
                ValidationGroup="log" Width="74px" />
            <br />
            &nbsp;<asp:Label ID="Label10" runat="server" ForeColor="Red" Visible="False">*</asp:Label>
        </td>
    </tr>
    <tr>
        <td class="style28" colspan="2">
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
                style="text-align: left" PostBackUrl="~/Customer/SignUp.aspx">SignUp</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td class="style4" colspan="2">
            <asp:Image ID="Image2" runat="server" ImageUrl="~/Images/LogIn Bar2.jpg" 
                Width="233px" Height="24px" />
        </td>
    </tr>
</table>

