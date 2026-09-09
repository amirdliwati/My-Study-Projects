<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewmarks.ascx.cs" Inherits="studentcontrols_viewmarks" %>
<table>
    <tr>
        <td style="width: 101px">
            choos subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="subject" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                DataTextField="suname" DataValueField="suid" OnSelectedIndexChanged="subject_SelectedIndexChanged"
                Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT subject.suid, subject.suname FROM subject INNER JOIN subject_student ON subject.suid = subject_student.suid WHERE (subject.suname <> '') AND (subject.active = 'active') AND (subject_student.active = 'active') AND (subject_student.sid = @sid) ORDER BY subject.suname">
                    <SelectParameters>
                        <asp:SessionParameter Name="sid" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
    </tr>
    <tr>
        <td colspan="3" rowspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                Width="477px">
                <Columns>
                    <asp:BoundField DataField="exname" HeaderText="exam name" SortExpression="exname" />
                    <asp:TemplateField HeaderText="exam date" SortExpression="exdate">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("exdate") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("exdate", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="exgrade" HeaderText="max grade" SortExpression="exgrade" />
                    <asp:BoundField DataField="result" HeaderText="result" SortExpression="result" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT exam.exname, exam.exdate, exam.exgrade, result.result FROM result INNER JOIN exam ON result.exid = exam.exid WHERE (result.sid = @sid) AND (exam.suid = @suid) ORDER BY exam.exdate">
                <SelectParameters>
                    <asp:SessionParameter Name="sid" SessionField="id" />
                    <asp:ControlParameter ControlID="subject" Name="suid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
    </tr>
</table>
