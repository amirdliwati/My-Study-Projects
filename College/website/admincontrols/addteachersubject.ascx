<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addteachersubject.ascx.cs" Inherits="admincontrols_addteachersubject" %>
&nbsp;
<table>
    <tr>
        <td style="width: 100px">
                    teacher</td>
        <td style="width: 100px">
            <asp:ListBox ID="teacher" runat="server" DataSourceID="SqlDataSource1" DataTextField="teacher"
                DataValueField="tid" Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1"
                    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT tid, fname + ' ' + lname AS teacher FROM teacher WHERE (active = 'active') ORDER BY teacher">
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
                    subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="subject" runat="server" DataSourceID="SqlDataSource2" DataTextField="suname"
                DataValueField="suid" Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource2"
                    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT suid, suname FROM subject WHERE active ='active' order BY suname">
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
                    year</td>
        <td style="width: 100px">
            <asp:TextBox ID="year" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="year"
                Display="Dynamic" ErrorMessage="enter year" ValidationGroup="addtesu">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="year"
                Display="Dynamic" ErrorMessage="invalid year" ValidationExpression="\d\d\d\d[-]\d\d\d\d"
                ValidationGroup="addtesu">*</asp:RegularExpressionValidator></td>
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
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="add" ValidationGroup="addtesu" /></td>
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
                ValidationGroup="addtesu" />
        </td>
    </tr>
</table>
