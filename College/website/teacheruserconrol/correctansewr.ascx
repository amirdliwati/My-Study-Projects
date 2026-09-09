<%@ Control Language="C#" AutoEventWireup="true" CodeFile="correctansewr.ascx.cs" Inherits="teacheruserconrol_correctansewr" %>
<table>
    <tr>
        <td style="width: 1661px">
            choos subject</td>
        <td style="width: 97px">
            <asp:ListBox ID="subject" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                DataTextField="suname" DataValueField="suid" Rows="1"></asp:ListBox><asp:SqlDataSource
                    ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT subject.suid, subject.suname FROM subject INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE (subject.active = 'active') AND (subject.suname <> '') AND (teacher_subject.active = 'active') AND (teacher_subject.tid = @tid) ORDER BY subject.suname">
                    <SelectParameters>
                        <asp:SessionParameter Name="tid" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="subject"
                Display="Dynamic" ErrorMessage="choos subject" ValidationGroup="corr">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 1661px">
            choos exam</td>
        <td style="width: 97px">
            <asp:ListBox ID="exam" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                DataTextField="exname" DataValueField="exid" Rows="1"></asp:ListBox><asp:SqlDataSource
                    ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT exid, exname FROM exam WHERE (suid = @suid) AND (exname <> '') ORDER BY exname">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="subject" Name="suid" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="exam"
                Display="Dynamic" ErrorMessage="choos exam" ValidationGroup="corr">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 1661px">
            choos student</td>
        <td style="width: 97px">
            <asp:ListBox ID="student" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource3"
                DataTextField="name" DataValueField="sid" Rows="1"></asp:ListBox><asp:SqlDataSource
                    ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT student.sid, student.fname + ' ' + student.coid AS name FROM student INNER JOIN subject_student ON student.sid = subject_student.sid WHERE (student.active = 'active') AND (subject_student.active = 'active') AND (subject_student.suid = @suid) ORDER BY name">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="subject" Name="suid" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="student"
                Display="Dynamic" ErrorMessage="choos student" ValidationGroup="corr">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 1661px">
            choos quastion</td>
        <td style="width: 97px">
            <asp:ListBox ID="quastion" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource4"
                DataTextField="qtext" DataValueField="qid" Height="86px" Rows="1" Width="608px">
            </asp:ListBox><asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT quastion.qid, quastion.qtext, quastion.qgrade FROM quastion INNER JOIN quastion_examform ON quastion.qid = quastion_examform.qid INNER JOIN examform ON quastion_examform.efid = examform.efid INNER JOIN exam ON examform.exid = exam.exid WHERE (quastion.qtype = 'written') AND (exam.exid = @exid) AND (quastion.qtext <> '')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="exam" Name="exid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="quastion"
                Display="Dynamic" ErrorMessage="choos quastion" ValidationGroup="corr">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 1661px">
            quastion mark</td>
        <td style="width: 97px">
            <asp:FormView ID="FormView2" runat="server" DataSourceID="SqlDataSource6"
                Width="88px">
                <EditItemTemplate>
                    qgrade:
                    <asp:TextBox ID="qgradeTextBox" runat="server" Text='<%# Bind("qgrade") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update">
                    </asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    qgrade:
                    <asp:TextBox ID="qgradeTextBox" runat="server" Text='<%# Bind("qgrade") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert">
                    </asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    &nbsp;<asp:Label ID="qgradeLabel" runat="server" Text='<%# Bind("qgrade") %>'></asp:Label><br />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource6" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT qgrade FROM quastion WHERE (qid = @qid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="quastion" Name="qid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource5" Height="97px"
                Width="609px">
                <EditItemTemplate>
                    anser:
                    <asp:TextBox ID="anserTextBox" runat="server" Text='<%# Bind("anser") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                        Text="Update">
                    </asp:LinkButton>
                    <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </EditItemTemplate>
                <InsertItemTemplate>
                    anser:
                    <asp:TextBox ID="anserTextBox" runat="server" Text='<%# Bind("anser") %>'>
                    </asp:TextBox><br />
                    <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                        Text="Insert">
                    </asp:LinkButton>
                    <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                        Text="Cancel">
                    </asp:LinkButton>
                </InsertItemTemplate>
                <ItemTemplate>
                    anser:
                    <asp:Label ID="anserLabel" runat="server" Text='<%# Bind("anser") %>'></asp:Label><br />
                </ItemTemplate>
            </asp:FormView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT anser FROM writeanser WHERE (sid = @sid) AND (qid = @qid) AND (exid = @exid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="student" Name="sid" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="quastion" Name="qid" PropertyName="SelectedValue" />
                    <asp:ControlParameter ControlID="exam" Name="exid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td style="width: 1661px">
            mark</td>
        <td style="width: 97px">
            <asp:TextBox ID="mark" runat="server"></asp:TextBox></td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="mark"
                Display="Dynamic" ErrorMessage="enter mark" ValidationGroup="corr">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="mark"
                Display="Dynamic" ErrorMessage="invalid mark" ValidationExpression="\d\d?\d?"
                ValidationGroup="corr">*</asp:RegularExpressionValidator></td>
    </tr>
    <tr>
        <td style="width: 1661px">
            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="correct" ValidationGroup="corr" /></td>
        <td style="width: 97px">
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
                ValidationGroup="corr" />
        </td>
    </tr>
    <tr>
        <td style="width: 1661px">
        </td>
        <td style="width: 97px">
        </td>
        <td style="width: 100px">
        </td>
    </tr>
</table>
&nbsp;
