<%@ Control Language="C#" AutoEventWireup="true" CodeFile="login.ascx.cs" Inherits="usercontrols_login" %>
<table style="width: 200px; height: 198px">
    <tr>
        <td style="width: 103px">
            user name</td>
        <td style="width: 71px">
            <asp:TextBox ID="username" runat="server"></asp:TextBox></td>
        <td style="width: 98px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="username"
                ErrorMessage="Enter your user name" ValidationGroup="log">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 103px">
            password</td>
        <td style="width: 71px">
            <asp:TextBox ID="pass" runat="server" TextMode="Password"></asp:TextBox></td>
        <td style="width: 98px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ErrorMessage="enter your password"
                ValidationGroup="log" ControlToValidate="pass">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 103px; height: 24px">
            user type</td>
        <td style="width: 71px; height: 24px">
            <asp:ListBox ID="ListBox1" runat="server" Rows="1">
                <asp:ListItem Selected="True" Value="admin">admin</asp:ListItem>
                <asp:ListItem>teacher</asp:ListItem>
                <asp:ListItem>student</asp:ListItem>
            </asp:ListBox></td>
        <td style="width: 98px; height: 24px">
        </td>
    </tr>
    <tr>
        <td style="width: 103px; height: 24px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="log in" ValidationGroup="log" /></td>
        <td style="width: 71px; height: 24px">
        </td>
        <td style="width: 98px; height: 24px">
        </td>
    </tr>
    <tr>
        <td colspan="3" style="height: 24px">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ShowSummary="False" ValidationGroup="log" />
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td>
    </tr>
</table>
