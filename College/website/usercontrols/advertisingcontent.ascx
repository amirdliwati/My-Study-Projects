<%@ Control Language="C#" AutoEventWireup="true" CodeFile="advertisingcontent.ascx.cs" Inherits="usercontrols_advertisingcontent" %>
<table style="width: 100%">
    <tr>
        <td colspan="3">
            <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="titel"
                DataValueField="adid" Width="710px" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged" AutoPostBack="True"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1"
                    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT adid, titel FROM advertising ORDER BY date">
                </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td colspan="3" rowspan="2">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                Width="711px">
                <Columns>
                    <asp:BoundField DataField="titel" HeaderText="titel" SortExpression="titel">
                        <ControlStyle Width="20%" />
                        <ItemStyle Width="20%" />
                    </asp:BoundField>
                    <asp:TemplateField HeaderText="date" SortExpression="date">
                        <EditItemTemplate>
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("date") %>'></asp:TextBox>
                        </EditItemTemplate>
                        <ControlStyle Width="20%" />
                        <ItemStyle Width="20%" />
                        <ItemTemplate>
                            <asp:Label ID="Label1" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="text" HeaderText="text" SortExpression="text" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT titel, date, text FROM advertising WHERE (adid = @adid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox1" Name="adid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
    </tr>
</table>
