<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewPrograms.ascx.cs" Inherits="usercontrol_ViewPrograms" %>
<style type="text/css">
    .style1
    {
        width: 30%;
        height: 166px;
    }
</style>
<table class="style1">
    <tr>
        <td>
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CellPadding="4" DataSourceID="SqlDataSource1" ForeColor="#333333" 
                GridLines="None" Height="100px" 
                 Width="220px">
                <RowStyle BackColor="#EFF3FB" />
                <Columns>
                    <asp:BoundField DataField="pro_n" HeaderText="Program Name" 
                        SortExpression="pro_n" />
                    <asp:BoundField DataField="pro_des" HeaderText="Description" 
                        SortExpression="pro_des" />
                </Columns>
                <FooterStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#2461BF" ForeColor="White" HorizontalAlign="Center" />
                <SelectedRowStyle BackColor="#D1DDF1" Font-Bold="True" ForeColor="#333333" />
                <HeaderStyle BackColor="#507CD1" Font-Bold="True" ForeColor="White" />
                <EditRowStyle BackColor="#2461BF" />
                <AlternatingRowStyle BackColor="White" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                SelectCommand="SELECT [pro_n], [pro_des] FROM [program]">
            </asp:SqlDataSource>
            <br />
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                Text="Refresh" />
        </td>
    </tr>
</table>
