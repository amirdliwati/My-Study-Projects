<%@ Control Language="C#" AutoEventWireup="true" CodeFile="activeexamform.ascx.cs" Inherits="teacheruserconrol_activeexamform" %>
&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="efid"
    DataSourceID="SqlDataSource1" Width="713px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    Text="Update"></asp:LinkButton>
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
                <asp:Label ID="Label5" runat="server" Text='<%# Eval("suname") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("suname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="exam name" SortExpression="exname">
            <EditItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Eval("exname") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("exname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="form name" SortExpression="formname">
            <EditItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%# Eval("formname") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("formname") %>'></asp:Label>
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
    SelectCommand="SELECT examform.efid, examform.formname, examform.active, exam.exname, subject.suname FROM examform INNER JOIN exam ON examform.exid = exam.exid INNER JOIN subject ON exam.suid = subject.suid INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE  (subject.active = 'active') AND (teacher_subject.active = 'active') AND (teacher_subject.tid = @tid) ORDER BY examform.formname"
    UpdateCommand="UPDATE examform SET active = @active WHERE (efid = @efid)">
    <UpdateParameters>
        <asp:Parameter Name="active" />
        <asp:Parameter Name="efid" />
    </UpdateParameters>
    <SelectParameters>
        <asp:SessionParameter Name="tid" SessionField="id" />
    </SelectParameters>
</asp:SqlDataSource>
