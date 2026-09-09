<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addformquastion.ascx.cs" Inherits="teacheruserconrol_addformquastion" %>
<table>
    <tr>
        <td style="width: 100px">
            choos subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="suname"
                DataValueField="suid" Rows="1" AutoPostBack="True"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1"
                    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT subject.suid, subject.suname FROM subject INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE (subject.active = 'active') AND (teacher_subject.tid = @tid) ORDER BY subject.suname">
                    <SelectParameters>
                        <asp:SessionParameter Name="tid" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
            choos exam</td>
        <td style="width: 100px">
            <asp:ListBox ID="ListBox2" runat="server" Rows="1" AutoPostBack="True" DataSourceID="SqlDataSource2" DataTextField="exname" DataValueField="exid"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT exid, exname FROM exam WHERE (suid = @suid) ORDER BY exname">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="suid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td style="width: 100px; height: 21px">
            choos form</td>
        <td style="width: 100px; height: 21px">
            <asp:ListBox ID="ListBox3" runat="server" DataSourceID="SqlDataSource3" DataTextField="formname"
                DataValueField="efid" Height="23px" Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource3"
                    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT efid, formname FROM examform WHERE (exid = @exid) ORDER BY formname">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox2" Name="exid" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px; height: 21px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListBox3"
                Display="Dynamic" ErrorMessage="choos form" ValidationGroup="addfoqu">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px; height: 30px">
            choos quastion</td>
        <td style="width: 100px; height: 30px">
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource4"
                DataTextField="qtext" DataValueField="qid">
            </asp:RadioButtonList><asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT qid, qtext FROM quastion WHERE (suid = @suid) ORDER BY qtext">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="suid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width: 100px; height: 30px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="RadioButtonList1"
                Display="Dynamic" ErrorMessage="choos quastion" ValidationGroup="addfoqu">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 100px; height: 21px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="add" ValidationGroup="addfoqu" /></td>
        <td style="width: 100px; height: 21px">
        </td>
        <td style="width: 100px; height: 21px">
        </td>
    </tr>
    <tr>
        <td style="height: 21px" colspan="3">
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td>
    </tr>
    <tr>
        <td style="height: 21px" colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ValidationGroup="addfoqu" />
        </td>
    </tr>
</table>
