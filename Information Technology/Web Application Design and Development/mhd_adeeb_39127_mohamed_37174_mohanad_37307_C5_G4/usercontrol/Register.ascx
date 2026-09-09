<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Register.ascx.cs" Inherits="usercontrol_Register" %>
<style type="text/css">

        .style6
        {
            height: 23px;
        }
        .style27
        {
            width: 114px;
            height: 26px;
        }
        .style54
        {
            height: 26px;
            width: 48px;
        }
        .style37
        {
            height: 26px;
            width: 36px;
        }
        .style55
        {
            width: 48px;
        }
        .style38
        {
            width: 36px;
        }
        .style14
        {
            width: 114px;
            height: 17px;
        }
        .style56
        {
            height: 17px;
            width: 48px;
        }
        .style39
        {
            height: 17px;
            width: 36px;
        }
        .style53
        {
            height: 23px;
            width: 48px;
        }
        .style36
        {
            height: 23px;
            width: 36px;
        }
        .style47
        {
            height: 42px;
        }
        .style58
        {
            width: 48px;
            height: 42px;
        }
        .style51
        {
            width: 36px;
            height: 42px;
        }
        .style1
        {
            width: 40%;
        height: 259px;
    }
        </style>
<table class="style1">
        <tr>
            <td class="style6" colspan="3">
    <asp:Image ID="Image2" runat="server" Height="55px" ImageAlign="Baseline" 
        ImageUrl="~/data/Registration.jpg" style="height: 17px; margin-left: 0px;" 
                    Width="292px" />
            </td>
        </tr>
        <tr>
            <td class="style27">
                <asp:Label ID="Label4" runat="server" Text="Full Name"></asp:Label>
            </td>
            <td class="style54">
    <asp:TextBox ID="TextBox3" runat="server" Height="16px" Width="103px" 
                    style="margin-left: 5px"></asp:TextBox>
            </td>
            <td class="style37">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
        ControlToValidate="TextBox3" ToolTip="Please Insert Your Full Name" 
        ValidationGroup="reg">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
    <asp:Label ID="Label5" runat="server" Text="User Name"></asp:Label>
            </td>
            <td class="style55">
    <asp:TextBox ID="TextBox4" runat="server" Height="16px" Width="103px" 
        style="margin-left: 5px"></asp:TextBox>
            </td>
            <td class="style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
        ControlToValidate="TextBox4" ToolTip="Please Insert Your User Name" 
        ValidationGroup="reg">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style14">
    <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
            </td>
            <td class="style56">
    <asp:TextBox ID="TextBox5" runat="server" Height="16px" Width="103px" 
        style="margin-left: 5px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style39">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
        ControlToValidate="TextBox5" ToolTip="Please Insert Your Password" 
        ValidationGroup="reg">*</asp:RequiredFieldValidator>
            </td>
        </tr>
        <tr>
            <td class="style6">
    <asp:Label ID="Label7" runat="server" Text="Confirm Password"></asp:Label>
            </td>
            <td class="style53">
    <asp:TextBox ID="TextBox6" runat="server" Height="16px" Width="103px" 
        style="margin-left: 5px" TextMode="Password"></asp:TextBox>
            </td>
            <td class="style36">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
        ControlToValidate="TextBox6" 
        ToolTip="Please Conferm Your Password" ValidationGroup="reg">*</asp:RequiredFieldValidator>
    <asp:CompareValidator ID="CompareValidator1" runat="server" 
        ControlToCompare="TextBox5" ControlToValidate="TextBox6" 
        ToolTip="Please check Your Password" ValidationGroup="reg">*</asp:CompareValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
                <asp:Label 
        ID="Label8" runat="server" Text="Email"></asp:Label>
            </td>
            <td class="style55">
    <asp:TextBox ID="TextBox7" runat="server" Height="16px" 
        style="margin-left: 5px" Width="103px"></asp:TextBox>
            </td>
            <td class="style38">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
        ControlToValidate="TextBox7" 
        ToolTip="Please Insert Your Email" ValidationGroup="reg">*</asp:RequiredFieldValidator>
    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
        ControlToValidate="TextBox7" 
        ToolTip="Please Insert Valid Email" 
        ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
        ValidationGroup="reg">*</asp:RegularExpressionValidator>
            </td>
        </tr>
        <tr>
            <td class="style3">
    <asp:Label ID="Label9" runat="server" Text="Program Name"></asp:Label>
            </td>
            <td class="style55">
    <asp:DropDownList ID="DropDownList2" runat="server" 
        DataSourceID="SqlDataSource1" DataTextField="pro_n" DataValueField="pro_id" 
        Height="20px" style="margin-left: 5px" Width="103px">
    </asp:DropDownList>
            </td>
            <td class="style38">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style47">
    <asp:Button ID="Button3" runat="server" Height="27px" onclick="Button3_Click" 
         Text="Save" ValidationGroup="reg" 
        Width="56px" />
            </td>
            <td class="style58">
                &nbsp;&nbsp;
    <br />
            </td>
            <td class="style51">
                </td>
        </tr>
        <tr>
            <td class="style47" colspan="3">
    <asp:Label ID="Label10" runat="server" ForeColor="Red" Visible="False">*</asp:Label>
    <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
        ConnectionString="<%$ ConnectionStrings:ConnectionString %>" 
        SelectCommand="SELECT [pro_id], [pro_n] FROM [program]"></asp:SqlDataSource>
            </td>
        </tr>
    </table>
