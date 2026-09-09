<%@ Control Language="C#" AutoEventWireup="true" CodeFile="activestudentsubject.ascx.cs" Inherits="admincontrols_activestudentsubject" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataSourceID="SqlDataSource1" PageSize="5" Width="452px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" ValidationGroup="upstsu"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="student" SortExpression="student">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox2" runat="server" DataSourceID="SqlDataSource1" DataTextField="student"
                    DataValueField="sid" Enabled="False" Rows="1" SelectedValue='<%# Bind("sid") %>'>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("student") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="suname" SortExpression="suname">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="suname"
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
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upstsu">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationGroup="upstsu\d\d\d\d[-]\d\d\d\d">*</asp:RegularExpressionValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("year") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="active" SortExpression="active">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox3" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                    <asp:ListItem Selected="True">active</asp:ListItem>
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
    SelectCommand="SELECT student.fname + '_' + student.coid AS student, subject.suname, subject_student.year, subject_student.active, subject_student.suid, subject_student.sid FROM subject_student INNER JOIN subject ON subject_student.suid = subject.suid INNER JOIN student ON subject_student.sid = student.sid"
    UpdateCommand="UPDATE subject_student SET year = @year, active = @active WHERE (suid = @suid) AND (sid = @sid)">
    <UpdateParameters>
        <asp:Parameter Name="year" />
        <asp:Parameter Name="active" />
        <asp:Parameter Name="suid" />
        <asp:Parameter Name="sid" />
    </UpdateParameters>
</asp:SqlDataSource>
