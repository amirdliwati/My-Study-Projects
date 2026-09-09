<%@ Control Language="C#" AutoEventWireup="true" CodeFile="studentmarks.ascx.cs" Inherits="teacheruserconrol_studentmarks" %>
<table style="width: 619px">
    <tr>
        <td style="width: 100px">
            subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="subject" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                DataTextField="suname" DataValueField="suid" OnSelectedIndexChanged="subject_SelectedIndexChanged"
                Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT subject.suid, subject.suname FROM subject INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE (teacher_subject.tid = @tid) AND (subject.suname <> '') AND (subject.active = 'active') AND (teacher_subject.active = 'active') ORDER BY subject.suname">
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
            exam</td>
        <td style="width: 100px">
            <asp:ListBox ID="exam" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                DataTextField="exname" DataValueField="exid" OnSelectedIndexChanged="exam_SelectedIndexChanged"
                Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT exid, exname FROM exam WHERE (suid = @suid) ORDER BY exname">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="subject" Name="suid" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                Width="508px" AllowPaging="True">
                <Columns>
                    <asp:BoundField DataField="coid" HeaderText="colleg id" SortExpression="coid" />
                    <asp:BoundField DataField="name" HeaderText="name" ReadOnly="True" SortExpression="name" />
                    <asp:BoundField DataField="result" HeaderText="result" SortExpression="result" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT student.coid, student.fname + ' ' + student.lname AS name, result.result FROM result INNER JOIN student ON result.sid = student.sid WHERE (result.exid = @exid) ORDER BY student.coid">
                <SelectParameters>
                    <asp:ControlParameter ControlID="exam" Name="exid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
