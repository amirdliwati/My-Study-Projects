<%@ Control Language="C#" AutoEventWireup="true" CodeFile="changstudentpass.ascx.cs" Inherits="admincontrols_changstudentpass" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sid"
    DataSourceID="SqlDataSource1" Width="453px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("are you sure")' Text="Update" ValidationGroup="chst"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="student name" SortExpression="name">
            <EditItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Eval("name") %>'></asp:Label>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("name") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="pass" SortExpression="pass">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("pass") %>' TextMode="Password"></asp:TextBox></td>
                    </tr>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox></td>
                    </tr>
                </table>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="chst">*</asp:RequiredFieldValidator>
                <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="TextBox1"
                    ControlToValidate="TextBox2" Display="Dynamic" ErrorMessage="CompareValidator"
                    ValidationGroup="chst">*</asp:CompareValidator>
            </EditItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT sid, fname + ' ' + coid AS name, pass FROM student ORDER BY fname"
    UpdateCommand="UPDATE student SET pass = @pass WHERE (sid = @sid)">
    <UpdateParameters>
        <asp:Parameter Name="pass" />
        <asp:Parameter Name="sid" />
    </UpdateParameters>
</asp:SqlDataSource>
