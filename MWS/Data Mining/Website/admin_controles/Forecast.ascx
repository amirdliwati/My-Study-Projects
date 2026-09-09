<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Forecast.ascx.cs" Inherits="admin_controles_Forecast" %>

<table>
<tr>
<th>Actual Sales</th>
<th>Forcast</th>
</tr>
<tr valign="top"><td>

<asp:GridView runat="server" ID="GridView1" AutoGenerateColumns="False" 
    DataSourceID="SqlDataSource1">
    <Columns>
        <asp:BoundField DataField="SaleID" HeaderText="ID" SortExpression="SaleID" />
        <asp:BoundField DataField="Period" HeaderText="Period" 
            SortExpression="Period" />
        <asp:BoundField DataField="TotalSales" HeaderText="Total Sales" 
            SortExpression="TotalSales" DataFormatString="{0:c}" />
    </Columns>
</asp:GridView>

<asp:SqlDataSource ID="SqlDataSource1" runat="server" 
    ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
    SelectCommand="SELECT * FROM [SalesPeriod_V]"></asp:SqlDataSource>

</td><td>
Forecase for next <asp:TextBox runat="server" ID="txtPeriod" Width="20px" Text="5" /> monthes.
<asp:LinkButton runat="server" ID="btnShow" Text="Show" 
    onclick="btnShow_Click" />

<asp:GridView runat="server" ID="GridView2" AutoGenerateColumns="false">
    <Columns>
        <asp:BoundField DataField="Expression.$TIME" HeaderText="ID" />
        <asp:BoundField HeaderText="Period" />
        <asp:BoundField DataField="Expression.Total Sales" DataFormatString="{0:c}" HeaderText="Total Sales" />
    </Columns>
</asp:GridView>

</td></tr></table>