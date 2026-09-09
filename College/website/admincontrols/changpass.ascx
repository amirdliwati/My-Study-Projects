<%@ Control Language="C#" AutoEventWireup="true" CodeFile="changpass.ascx.cs" Inherits="admincontrols_changpass" %>
<table style="width: 424px">
    <tr>
        <td style="width: 100px">
            old password</td>
        <td style="width: 100px">
            <asp:TextBox ID="oldpass" runat="server" TextMode="Password"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="oldpass"
                Display="Dynamic" ErrorMessage="enter old password" ValidationGroup="chpas">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            new password</td>
        <td style="width: 100px">
            <asp:TextBox ID="newpass" runat="server" TextMode="Password"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="newpass"
                Display="Dynamic" ErrorMessage="enter new password" ValidationGroup="chpas">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            confirm password</td>
        <td style="width: 100px">
            <asp:TextBox ID="repass" runat="server" TextMode="Password"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="newpass"
                ControlToValidate="repass" Display="Dynamic" ErrorMessage="password and confirm password not matched"
                ValueToCompare="chpas">*</asp:CompareValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="chang" ValidationGroup="chpas" /></td>
        <td style="width: 100px">
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="chpas" />
        </td>
    </tr>
</table>
