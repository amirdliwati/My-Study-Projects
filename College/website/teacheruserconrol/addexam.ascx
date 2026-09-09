<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addexam.ascx.cs" Inherits="teacheruserconrol_addexam" %>
<asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource1" DefaultMode="Insert">
    <EditItemTemplate>
        exname:
        <asp:TextBox ID="exnameTextBox" runat="server" Text='<%# Bind("exname") %>'>
        </asp:TextBox><br />
        exdate:
        <asp:TextBox ID="exdateTextBox" runat="server" Text='<%# Bind("exdate") %>'>
        </asp:TextBox><br />
        exgrade:
        <asp:TextBox ID="exgradeTextBox" runat="server" Text='<%# Bind("exgrade") %>'>
        </asp:TextBox><br />
        active:
        <asp:TextBox ID="activeTextBox" runat="server" Text='<%# Bind("active") %>'>
        </asp:TextBox><br />
        suid:
        <asp:TextBox ID="suidTextBox" runat="server" Text='<%# Bind("suid") %>'>
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
                    name</td>
                <td style="width: 100px">
                    <asp:TextBox ID="exnameTextBox" runat="server" Text='<%# Bind("exname") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="exnameTextBox"
                        Display="Dynamic" ErrorMessage="enter exam name" ValidationGroup="addex">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    date</td>
                <td style="width: 100px">
                    <asp:TextBox ID="exdateTextBox" runat="server" Text='<%# Bind("exdate") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="exdateTextBox"
                        Display="Dynamic" ErrorMessage="enter exam date" ValidationGroup="addex">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="exdateTextBox"
                        Display="Dynamic" ErrorMessage="invalid date" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                        ValidationGroup="addex">*</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    grade</td>
                <td style="width: 100px">
                    <asp:TextBox ID="exgradeTextBox" runat="server" Text='<%# Bind("exgrade") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="exgradeTextBox"
                        Display="Dynamic" ErrorMessage="enter exam max grade" ValidationGroup="addex">*</asp:RequiredFieldValidator>
                    <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="exgradeTextBox"
                        Display="Dynamic" ErrorMessage="invalid grade" MaximumValue="100" MinimumValue="0"
                        Type="Integer" ValidationGroup="addex">*</asp:RangeValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    active</td>
                <td style="width: 100px">
                    <asp:ListBox ID="ListBox1" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                        <asp:ListItem>active</asp:ListItem>
                        <asp:ListItem>not active</asp:ListItem>
                    </asp:ListBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    subject</td>
                <td style="width: 100px">
                    <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource2" DataTextField="suname"
                        DataValueField="suid" Rows="1" SelectedValue='<%# Bind("suid") %>'></asp:ListBox><asp:SqlDataSource
                            ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT subject.suid, subject.suname FROM subject INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid INNER JOIN teacher ON teacher_subject.tid = teacher.tid WHERE (subject.active = 'active') AND (teacher.tid = @tid) AND (teacher_subject.active = 'active') AND (teacher.active = 'active') ORDER BY subject.suname">
                            <SelectParameters>
                                <asp:SessionParameter Name="tid" SessionField="id" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                </td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ListBox2"
                        Display="Dynamic" ErrorMessage="choos subject" ValidationGroup="addex">*</asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            Text="Insert" ValidationGroup="addex"></asp:LinkButton>
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel"></asp:LinkButton>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ValidationGroup="addex" />
    </InsertItemTemplate>
    <ItemTemplate>
        exname:
        <asp:Label ID="exnameLabel" runat="server" Text='<%# Bind("exname") %>'></asp:Label><br />
        exdate:
        <asp:Label ID="exdateLabel" runat="server" Text='<%# Bind("exdate") %>'></asp:Label><br />
        exgrade:
        <asp:Label ID="exgradeLabel" runat="server" Text='<%# Bind("exgrade") %>'></asp:Label><br />
        active:
        <asp:Label ID="activeLabel" runat="server" Text='<%# Bind("active") %>'></asp:Label><br />
        suid:
        <asp:Label ID="suidLabel" runat="server" Text='<%# Bind("suid") %>'></asp:Label><br />
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New"></asp:LinkButton>
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO exam(exname, exdate, exgrade, active, suid) VALUES (@exname, @exdate, @exgrade, @active, @suid)"
    SelectCommand="SELECT exname, exdate, exgrade, active, suid FROM exam ORDER BY exname">
    <InsertParameters>
        <asp:Parameter Name="exname" />
        <asp:Parameter Name="exdate" />
        <asp:Parameter Name="exgrade" />
        <asp:Parameter Name="active" />
        <asp:Parameter Name="suid" />
    </InsertParameters>
</asp:SqlDataSource>
