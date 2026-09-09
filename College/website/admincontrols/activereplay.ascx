<%@ Control Language="C#" AutoEventWireup="true" CodeFile="activereplay.ascx.cs" Inherits="admincontrols_activereplay" %>
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="reid" DataSourceID="SqlDataSource1" Width="702px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update" ValidationGroup="uprep"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Delete"
                    OnClientClick='return confirm ("are you sure")' Text="Delete"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="text" SortExpression="retext">
            <EditItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("retext") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("retext") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="date" SortExpression="date">
            <EditItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%# Eval("date", "{0:d}") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
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
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("active") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="subject titel" SortExpression="subtitel">
            <EditItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%# Eval("subtitel") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("subtitel") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="student" SortExpression="student">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("student") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("student") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    DeleteCommand="DELETE FROM reply WHERE (reid = @reid)" SelectCommand="SELECT reply.reid, reply.retext, reply.date, reply.active, clupsubject.subtitel, student.fname + '' + student.coid AS student FROM reply INNER JOIN clupsubject ON reply.cbid = clupsubject.cbid INNER JOIN student ON reply.sid = student.sid ORDER BY reply.date"
    UpdateCommand="UPDATE reply SET active = @active WHERE (reid = @reid)">
    <DeleteParameters>
        <asp:Parameter Name="reid" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="active" />
        <asp:Parameter Name="reid" />
    </UpdateParameters>
</asp:SqlDataSource>
