<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addstudentsubject.ascx.cs" Inherits="admincontrols_addteachersubject" %>
&nbsp;
<table>
    <tr>
        <td style="width: 100px">
            student</td>
        <td style="width: 100px">
            <asp:ListBox ID="student" runat="server" DataSourceID="SqlDataSource1" DataTextField="student"
                DataValueField="sid" Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1"
                    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT sid, fname + '_' + coid AS student FROM student WHERE (active = 'active') ORDER BY student">
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
                Display="Dynamic" ErrorMessage="enter year" ValidationGroup="addstsu">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="year"
                Display="Dynamic" ErrorMessage="invalid year" ValidationExpression="\d\d\d\d[-]\d\d\d\d"
                ValidationGroup="addstsu">*</asp:RegularExpressionValidator></td>
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
