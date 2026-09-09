<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewCourses.ascx.cs" Inherits="usercontrol_ViewCourses" %>
<style type="text/css">
    .style1
    {
        width: 99%;
        height: 108px;
    }
    .style2
    {
    }
    .style3
    {
        width: 133px;
        height: 86px;
    }
    .style4
    {
        height: 86px;
    }
</style>
<table class="style1">
    <tr>
        <td class="style3">
            <asp:Label ID="Label1" runat="server" Text="Program Name"></asp:Label>
        </td>
        <td class="style4">
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="pro_n" 
                DataValueField="pro_id" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                SelectCommand="SELECT [pro_n], [pro_id] FROM [program]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataSourceID="SqlDataSource2">
                <Columns>
                    <asp:BoundField DataField="sem" HeaderText="sem" SortExpression="sem">
                    </asp:BoundField>
                    <asp:BoundField DataField="code" HeaderText="code" SortExpression="code" />
                    <asp:BoundField DataField="c_name" HeaderText="c_name" 
                        SortExpression="c_name">
                    </asp:BoundField>
                    <asp:BoundField DataField="n_session" HeaderText="n_session" 
                        SortExpression="n_session">
                    </asp:BoundField>
                    <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                    <asp:BoundField DataField="m_n" HeaderText="m_n" 
                        SortExpression="m_n">
                    </asp:BoundField>
                    <asp:BoundField DataField="n_c" HeaderText="n_c" 
                        SortExpression="n_c">
                    </asp:BoundField>
                    <asp:BoundField DataField="open" HeaderText="open" SortExpression="open" />
                </Columns>
                <EmptyDataTemplate>
                    Semester
                </EmptyDataTemplate>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                SelectCommand="SELECT [sem], [code], [c_name], [n_session], [price], [m_n], [n_c], [open] FROM [course] WHERE ([pro_id] = @pro_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="pro_id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
