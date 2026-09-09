<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addadvertising.ascx.cs" Inherits="admincontrols_addadvertising" %>
<table>
    <tr>
        <td style="width: 100px">
            titel</td>
        <td style="width: 100px">
            <asp:TextBox ID="titel" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="titel"
                Display="Dynamic" ErrorMessage="enter titel" ValidationGroup="addadv">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px; height: 47px">
            text</td>
        <td style="width: 100px; height: 47px">
            <asp:TextBox ID="text" runat="server" Height="118px" TextMode="MultiLine" Width="239px"></asp:TextBox></td>
        <td style="width: 100px; height: 47px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="text"
                Display="Dynamic" ErrorMessage="enter text" ValidationGroup="addadv">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            date</td>
        <td style="width: 100px">
            <asp:TextBox ID="date" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="date"
                Display="Dynamic" ErrorMessage="enter date" ValidationGroup="addadv">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="date"
                Display="Dynamic" ErrorMessage="invalid date" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                ValidationGroup="addadv">*</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick='return confirm ("do you want to add")'
                Text="add" ValidationGroup="addadv" /></td>
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
                ValidationGroup="addadv" />
        </td>
    </tr>
</table>
