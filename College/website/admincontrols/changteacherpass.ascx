<%@ Control Language="C#" AutoEventWireup="true" CodeFile="changteacherpass.ascx.cs" Inherits="admincontrols_changteacherpass" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="tid"
    DataSourceID="SqlDataSource1" Width="315px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("are you sure")' Text="Update" ValidationGroup="chte"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="teacher name" SortExpression="name">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("name") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="pass" SortExpression="pass">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("pass") %>' TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox3" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                </table>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="chte">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox2"
                    ControlToValidate="TextBox3" Display="Dynamic" ErrorMessage="CompareValidator"
                    ValueToCompare="chte">*</asp:CompareValidator><br />
            </EditItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT tid, fname + ' ' + lname AS name, pass FROM teacher ORDER BY fname"
    UpdateCommand="UPDATE teacher SET pass = @pass WHERE (tid = @tid)">
    <UpdateParameters>
        <asp:Parameter Name="pass" />
        <asp:Parameter Name="tid" />
    </UpdateParameters>
</asp:SqlDataSource>
