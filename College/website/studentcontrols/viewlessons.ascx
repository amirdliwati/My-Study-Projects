<%@ Control Language="C#" AutoEventWireup="true" CodeFile="viewlessons.ascx.cs" Inherits="studentcontrols_viewlessons" %>
<table>
    <tr>
        <td style="width: 100px">
            choos subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="subject" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                DataTextField="suname" DataValueField="suid" Rows="1" OnSelectedIndexChanged="subject_SelectedIndexChanged"></asp:ListBox><asp:SqlDataSource
                    ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
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
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
                DataSourceID="SqlDataSource2" Width="356px">
                <Columns>
                    <asp:BoundField DataField="lisname" HeaderText="lisson name" SortExpression="lisname" />
                    <asp:TemplateField HeaderText="url" SortExpression="lisurl">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("lisurl") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:HyperLink ID="HyperLink1" runat="server" NavigateUrl='<%# Eval("lisurl") %>'
                                Text='<%# Eval("lisname") %>'></asp:HyperLink>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT lisname, lisurl FROM lisson WHERE (suid = @suid) ORDER BY lisid">
                <SelectParameters>
                    <asp:ControlParameter ControlID="subject" Name="suid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
    </tr>
</table>
