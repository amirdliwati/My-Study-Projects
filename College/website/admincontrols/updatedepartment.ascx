<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updatedepartment.ascx.cs" Inherits="admincontrols_updatedepartment" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="did"
    DataSourceID="SqlDataSource1" Width="230px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("do you want to update")' Text="Update" ValidationGroup="updep"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="department" SortExpression="dname">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("dname") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                Display="Dynamic" ValidationGroup="updep">*</asp:RequiredFieldValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("dname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT dname, did FROM dept ORDER BY dname" UpdateCommand="UPDATE dept SET dname = @dname WHERE (did = @did)">
    <UpdateParameters>
        <asp:Parameter Name="dname" />
        <asp:Parameter Name="did" />
    </UpdateParameters>
</asp:SqlDataSource>
