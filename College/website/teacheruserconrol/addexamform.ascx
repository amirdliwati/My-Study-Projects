<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addexamform.ascx.cs" Inherits="teacheruserconrol_addexamform" %>
<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
    <EditItemTemplate>
        formname:
        <asp:TextBox ID="formnameTextBox" runat="server" Text='<%# Bind("formname") %>'>
        </asp:TextBox><br />
        active:
        <asp:TextBox ID="activeTextBox" runat="server" Text='<%# Bind("active") %>'>
        </asp:TextBox><br />
        exid:
        <asp:TextBox ID="exidTextBox" runat="server" Text='<%# Bind("exid") %>'>
        </asp:TextBox><br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="Update">
        </asp:LinkButton>
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel">
        </asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        <table>
            <tr>
                <td style="width: 100px">
                    form name</td>
                <td style="width: 100px">
                    <asp:TextBox ID="formnameTextBox" runat="server" Text='<%# Bind("formname") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="formnameTextBox"
                        Display="Dynamic" ErrorMessage="enter exam form name" ValidationGroup="addexf">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    active</td>
                <td style="width: 100px">
                    <asp:ListBox ID="ListBox1" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                        <asp:ListItem Selected="True">active</asp:ListItem>
                        <asp:ListItem>not active</asp:ListItem>
                    </asp:ListBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    exam</td>
                <td style="width: 100px">
                    <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource1" DataTextField="exname"
                        DataValueField="exid" Rows="1" SelectedValue='<%# Bind("exid") %>'></asp:ListBox><asp:SqlDataSource
                            ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT exam.exid, exam.exname FROM exam INNER JOIN subject ON exam.suid = subject.suid INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE (exam.active = 'active') AND (subject.active = 'active') AND (teacher_subject.active = 'active') AND (teacher_subject.tid = @tid) ORDER BY exam.exname">
                            <SelectParameters>
                                <asp:SessionParameter Name="tid" SessionField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                </td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox2"
                        Display="Dynamic" ErrorMessage="choos exam" ValidationGroup="addexf">*</asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            Text="Insert" ValidationGroup="addexf"></asp:LinkButton>
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel"></asp:LinkButton>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ValidationGroup="addexf" />
    </InsertItemTemplate>
    <ItemTemplate>
        formname:
        <asp:Label ID="formnameLabel" runat="server" Text='<%# Bind("formname") %>'></asp:Label><br />
        active:
        <asp:Label ID="activeLabel" runat="server" Text='<%# Bind("active") %>'></asp:Label><br />
        exid:
        <asp:Label ID="exidLabel" runat="server" Text='<%# Bind("exid") %>'></asp:Label><br />
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New"></asp:LinkButton>
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO examform(exid, active, formname) VALUES (@exid, @active, @formname)"
    SelectCommand="SELECT examform.formname, examform.active, examform.exid FROM examform INNER JOIN exam ON examform.exid = exam.exid INNER JOIN subject ON exam.suid = subject.suid INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE (exam.active = 'active') AND (subject.active = 'active') AND (teacher_subject.active = 'active') AND (teacher_subject.tid = @tid)">
    <SelectParameters>
        <asp:SessionParameter Name="tid" SessionField="id" />
    </SelectParameters>
    <InsertParameters>
        <asp:Parameter Name="exid" />
        <asp:Parameter Name="active" />
        <asp:Parameter Name="formname" />
    </InsertParameters>
</asp:SqlDataSource>
