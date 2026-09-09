<%@ Control Language="C#" AutoEventWireup="true" CodeFile="clup.ascx.cs" Inherits="studentcontrols_clup" %>
<table style="width: 100%">
    <tr>
        <td style="width: 100px">
            choos clup</td>
        <td style="width: 100px">
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                DataTextField="suname" DataValueField="suid" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"
                Width="83px"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT suid, suname FROM subject WHERE (suname <> '') AND (active = 'active') ORDER BY suname">
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
        <td style="width: 100px">
        </td>
        <td style="width: 96px">
        </td>
    </tr>
    <tr>
        <td style="width: 100px">
            choos subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                DataTextField="subtitel" DataValueField="cbid" OnSelectedIndexChanged="ListBox2_SelectedIndexChanged"
                Width="463px"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource2" runat="server"
                    ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT cbid, subtitel FROM clupsubject WHERE (subtitel <> '') AND (active = 'active') AND (suid = @suid) ORDER BY date">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="ListBox1" Name="suid" PropertyName="SelectedValue" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 100px">
        </td>
        <td style="width: 100px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox2"
                Display="Dynamic" ErrorMessage="choos subject" ValidationGroup="adrep">*</asp:RequiredFieldValidator></td>
        <td style="width: 96px">
        </td>
    </tr>
    <tr>
        <td colspan="4">
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT COUNT(reid) AS number FROM reply WHERE (cbid = @cbid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox2" Name="cbid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <table>
                <tr>
                    <td style="width: 100px">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource3"
                Width="791px">
                <Columns>
                    <asp:BoundField DataField="subtitel" HeaderText="subtitel" SortExpression="subtitel">
                        <ItemStyle Width="20%" />
                    </asp:BoundField>
                    <asp:BoundField DataField="subtext" HeaderText="subtext" SortExpression="subtext" />
                    <asp:TemplateField HeaderText="date" SortExpression="date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="20%" />
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
                    </td>
                    <td style="width: 100px">
            <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource4" Width="102px">
                <Columns>
                    <asp:BoundField DataField="number" HeaderText="replies count" ReadOnly="True" SortExpression="number" />
                </Columns>
            </asp:GridView>
                    </td>
                </tr>
            </table>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT subtitel, subtext, date FROM clupsubject WHERE (active = 'active') AND (cbid = @cbid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox2" Name="cbid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp; &nbsp;
        </td>
        <td colspan="1" style="width: 96px">
        </td>
    </tr>
    <tr>
        <td colspan="4">
            replies :<br />
            <br />
            <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource5"
                Width="783px">
                <Columns>
                    <asp:BoundField DataField="retext" HeaderText="reply text" SortExpression="retext">
                        <ItemStyle Width="70%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="date" SortExpression="date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="15%" />
                    </asp:TemplateField>
                    <asp:BoundField DataField="student" HeaderText="student" ReadOnly="True" SortExpression="student">
                        <ItemStyle Width="15%" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT reply.retext, reply.date, student.fname + ' ' + student.coid AS student FROM reply INNER JOIN student ON reply.sid = student.sid WHERE (reply.active = 'active') AND (student.active = 'active') AND (reply.cbid = @cbid) ORDER BY reply.date">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox2" Name="cbid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
        <td colspan="1" style="width: 96px">
        </td>
    </tr>
    <tr>
        <td colspan="4">
            &nbsp;<asp:Panel ID="Panel1" runat="server" Height="50px" Width="661px">
                <table style="width: 100%">
                    <tr>
                        <td style="width: 100px">
                            add reply</td>
                        <td style="width: 112px">
                            <asp:TextBox ID="TextBox2" runat="server" Height="132px" TextMode="MultiLine" Width="371px"></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                                Display="Dynamic" ErrorMessage="enter reply text" ValidationGroup="adrep">*</asp:RequiredFieldValidator></td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="add" ValidationGroup="adrep" /></td>
                        <td style="width: 112px">
                        </td>
                        <td style="width: 100px">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label></td>
                    </tr>
                    <tr>
                        <td colspan="3">
                            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                                ValidationGroup="adrep" />
                        </td>
                    </tr>
                </table>
            </asp:Panel>
        </td>
        <td colspan="1" style="width: 96px">
        </td>
    </tr>
</table>
