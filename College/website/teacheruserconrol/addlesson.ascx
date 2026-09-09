<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addlesson.ascx.cs" Inherits="teacheruserconrol_addlesson" %>
<table style="width: 610px">
    <tr>
        <td style="width: 100px">
            subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="subject" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                DataTextField="suname" DataValueField="suid" Rows="1"></asp:ListBox><asp:SqlDataSource
                    ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT subject.suid, subject.suname FROM subject INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE (teacher_subject.tid = @tid) AND (teacher_subject.active = 'active') AND (subject.active = 'active') AND (subject.suname <> '') ORDER BY subject.suname">
                    <SelectParameters>
                        <asp:SessionParameter Name="tid" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="subject"
                Display="Dynamic" ErrorMessage="choos subject" ValidationGroup="adlis">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            lesson name</td>
        <td style="width: 100px">
            <asp:TextBox ID="name" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="name"
                Display="Dynamic" ErrorMessage="enter lisson name" ValidationGroup="adlis">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px">
            lesson file</td>
        <td style="width: 100px">
            <asp:FileUpload ID="FileUpload1" runat="server" /></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="FileUpload1"
                Display="Dynamic" ErrorMessage="choos file" ValidationGroup="adlis">*</asp:RequiredFieldValidator></td>
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
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ValidationGroup="adlis" />
        </td>
    </tr>
</table>
