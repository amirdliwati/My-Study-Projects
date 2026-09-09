<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updatesubject.ascx.cs" Inherits="admincontrols_updatesubject" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="suid"
    DataSourceID="SqlDataSource1" Width="248px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("do you want to update")' Text="Update" ValidationGroup="upsub"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="subject" SortExpression="suname">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("suname") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upsub">*</asp:RequiredFieldValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("suname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="year" SortExpression="suyear">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox1" runat="server" Rows="1" SelectedValue='<%# Bind("suyear") %>'>
                    <asp:ListItem Selected="True">1</asp:ListItem>
                    <asp:ListItem>2</asp:ListItem>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("suyear") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="active" SortExpression="active">
            <EditItemTemplate>
                &nbsp;<asp:ListBox ID="ListBox2" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                    <asp:ListItem>active</asp:ListItem>
                    <asp:ListItem>not active</asp:ListItem>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("active") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO subject(active, suyear, suname) VALUES (@active, @suyear, @suname)"
    SelectCommand="SELECT suid, suname, suyear, active FROM subject ORDER BY suname"
    UpdateCommand="UPDATE subject SET active = @active, suname = @suname, suyear = @suyear WHERE (suid = @suid)">
    <UpdateParameters>
        <asp:Parameter Name="active" />
        <asp:Parameter Name="suname" />
        <asp:Parameter Name="suyear" />
        <asp:Parameter Name="suid" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="active" />
        <asp:Parameter Name="suyear" />
        <asp:Parameter Name="suname" />
    </InsertParameters>
</asp:SqlDataSource>
&nbsp;
