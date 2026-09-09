<%@ Control Language="C#" AutoEventWireup="true" CodeFile="activeexam.ascx.cs" Inherits="teacheruserconrol_activeexam" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="exid"
    DataSourceID="SqlDataSource1" Width="440px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("are you sure")' Text="Update"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="subject name" SortExpression="suname">
            <EditItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Eval("suname") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("suname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="exam name" SortExpression="exname">
            <EditItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("exname") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("exname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="active" SortExpression="active">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox1" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                    <asp:ListItem Selected="True">active</asp:ListItem>
                    <asp:ListItem>not active</asp:ListItem>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("active") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT exam.exid, exam.exname, exam.active, subject.suname FROM exam INNER JOIN subject ON exam.suid = subject.suid INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE (subject.active = 'active') AND (teacher_subject.active = 'active') AND (teacher_subject.tid = @tid) ORDER BY exam.exname"
    UpdateCommand="UPDATE exam SET active = @active WHERE (exid = @exid)">
    <UpdateParameters>
        <asp:Parameter Name="active" />
        <asp:Parameter Name="exid" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter Name="tid" SessionField="id" />
    </SelectParameters>
</asp:SqlDataSource>
