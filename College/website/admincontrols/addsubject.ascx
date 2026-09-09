<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addsubject.ascx.cs" Inherits="admincontrols_addsubject" %>
<table>
    <tr>
        <td style="width: 100px">
            subject</td>
        <td style="width: 100px">
            <asp:TextBox ID="subject" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="subject"
                Display="Dynamic" ErrorMessage="enter subject" ValidationGroup="addsub">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            year</td>
        <td style="width: 100px">
            <asp:ListBox ID="year" runat="server" Rows="1">
                <asp:ListItem Selected="True">1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
            </asp:ListBox></td>
        <td style="width: 100px">
            &nbsp;</td>
    </tr>
    <tr>
        <td style="width: 100px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" OnClientClick='return confirm("do you want to add")'
                Text="add" ValidationGroup="addsub" /></td>
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
                ValidationGroup="addsub" />
        </td>
    </tr>
</table>
