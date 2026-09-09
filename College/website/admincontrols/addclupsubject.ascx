<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addclupsubject.ascx.cs" Inherits="admincontrols_addclupsubject" %>
<table>
    <tr>
        <td style="width: 100px">
            main subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="subject" runat="server" DataSourceID="SqlDataSource1" DataTextField="suname"
                DataValueField="suid" Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1"
                    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT suid, suname FROM subject WHERE (active = 'active') ORDER BY suname">
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
            titel</td>
        <td style="width: 100px">
            <asp:TextBox ID="titel" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="titel"
                Display="Dynamic" ErrorMessage="enter titel" ValidationGroup="addclti">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            text</td>
        <td style="width: 100px">
            <asp:TextBox ID="text" runat="server" Height="175px" TextMode="MultiLine" Width="262px"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="text"
                Display="Dynamic" ErrorMessage="enter text" ValidationGroup="addclti">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            date</td>
        <td style="width: 100px">
            <asp:TextBox ID="date" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="date"
                Display="Dynamic" ErrorMessage="enter date" ValidationGroup="addclti">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="date"
                Display="Dynamic" ErrorMessage="invalid date" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                ValidationGroup="addclti">*</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            active</td>
        <td style="width: 100px">
            <asp:ListBox ID="active" runat="server" Rows="1">
                <asp:ListItem Selected="True">active</asp:ListItem>
                <asp:ListItem>not active</asp:ListItem>
            </asp:ListBox></td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="add" /></td>
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
                ValidationGroup="addclti" />
        </td>
    </tr>
</table>
