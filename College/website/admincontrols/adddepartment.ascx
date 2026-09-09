<%@ Control Language="C#" AutoEventWireup="true" CodeFile="adddepartment.ascx.cs" Inherits="admincontrols_adddepartment" %>
<table>
    <tr>
        <td style="width: 100px">
            department</td>
        <td style="width: 100px">
            <asp:TextBox ID="dept" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="dept"
                Display="Dynamic" ErrorMessage="enter department" ValidationGroup="adddep">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick='return confirm("do you want to add")'
                Text="add" ValidationGroup="adddep" /></td>
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
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ValidationGroup="adddep" />
        </td>
    </tr>
</table>
