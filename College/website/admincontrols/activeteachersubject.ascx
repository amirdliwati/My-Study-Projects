<%@ Control Language="C#" AutoEventWireup="true" CodeFile="activeteachersubject.ascx.cs" Inherits="admincontrols_activeteachersubject" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1" PageSize="5" Width="440px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" ValidationGroup="uptesu"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="teacher" SortExpression="teacher">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource1" DataTextField="teacher"
                    DataValueField="tid" Enabled="False" Rows="1" SelectedValue='<%# Bind("tid") %>'>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("teacher") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="subject" SortExpression="suname">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox3" runat="server" DataSourceID="SqlDataSource1" DataTextField="suname"
                    DataValueField="suid" Enabled="False" Rows="1" SelectedValue='<%# Bind("suid") %>'>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("suname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="year" SortExpression="year">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("year") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="enter year" ValidationGroup="uptesu">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="invalid year" ValidationExpression="\d\d\d\d[-]\d\d\d\d"
                    ValidationGroup="uptesu">*</asp:RegularExpressionValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("year") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="active" SortExpression="active">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox1" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                    <asp:ListItem>active</asp:ListItem>
                    <asp:ListItem>not active</asp:ListItem>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("active") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT teacher.fname + ' ' + teacher.lname AS teacher, subject.suname, teacher_subject.year, teacher_subject.active, teacher_subject.tid, teacher_subject.suid FROM teacher_subject INNER JOIN teacher ON teacher_subject.tid = teacher.tid INNER JOIN subject ON teacher_subject.suid = subject.suid"
    UpdateCommand="UPDATE teacher_subject SET active = @active, year = @year WHERE (tid = @tid) AND (suid = @suid)">
    <UpdateParameters>
        <asp:Parameter Name="active" />
        <asp:Parameter Name="year" />
        <asp:Parameter Name="tid" />
        <asp:Parameter Name="suid" />
    </UpdateParameters>
</asp:SqlDataSource>
