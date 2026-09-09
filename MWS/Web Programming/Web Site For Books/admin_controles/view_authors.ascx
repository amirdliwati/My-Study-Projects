<%@ Control Language="C#" AutoEventWireup="true" CodeFile="view_authors.ascx.cs" Inherits="admin_controles_view_authors" %>
<style type="text/css">
    .style1
    {
        width: 53%;
        height: 329px;
    }
    .style2
    {
        width: 432px;
    }
    .style3
    {
        width: 432px;
        font-size: x-large;
        color: #0066FF;
    }
</style>

<table align="left" class="style1">
    <tr>
        <td align="center" class="style3">
            <strong><em>View Author</em></strong></td>
    </tr>
    <tr>
        <td align="left" class="style2">
            <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">A</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click">B</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click">C</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton4" runat="server" onclick="LinkButton4_Click">D</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton5" runat="server" onclick="LinkButton5_Click">E</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton6" runat="server" onclick="LinkButton6_Click">F</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton7" runat="server" onclick="LinkButton7_Click">G</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton8" runat="server" onclick="LinkButton8_Click">H</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton9" runat="server" onclick="LinkButton9_Click">I</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton10" runat="server" onclick="LinkButton10_Click">J</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton11" runat="server" onclick="LinkButton11_Click">K</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton12" runat="server" onclick="LinkButton12_Click">L</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton13" runat="server" onclick="LinkButton13_Click">M</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton14" runat="server" onclick="LinkButton14_Click">N</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton15" runat="server" onclick="LinkButton15_Click">O</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton16" runat="server" onclick="LinkButton16_Click">P</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton17" runat="server" onclick="LinkButton17_Click">Q</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton18" runat="server" onclick="LinkButton18_Click">R</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton19" runat="server" onclick="LinkButton19_Click">S</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton20" runat="server" onclick="LinkButton20_Click">T</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton21" runat="server" onclick="LinkButton21_Click">U</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton22" runat="server" onclick="LinkButton22_Click">V</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton23" runat="server" onclick="LinkButton23_Click">W</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton24" runat="server" onclick="LinkButton24_Click">X</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton25" runat="server" onclick="LinkButton25_Click">Y</asp:LinkButton>
&nbsp;<asp:LinkButton ID="LinkButton26" runat="server" onclick="LinkButton26_Click">Z</asp:LinkButton>
&nbsp;</td>
    </tr>
    <tr>
        <td align="left" class="style2">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left" class="style2">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="select_author" 
                AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" 
                        SortExpression="AuthorName" />
                    <asp:BoundField DataField="AuthorDescription" HeaderText="AuthorDescription" 
                        SortExpression="AuthorDescription" />
                    <asp:BoundField DataField="NationalityName" HeaderText="NationalityName" 
                        SortExpression="NationalityName" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="select_author" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT Authors.AuthorName, Authors.AuthorDescription, Nationalities.NationalityName FROM Authors INNER JOIN Nationalities ON Authors.NationalityID = Nationalities.NationalityID WHERE (Authors.AuthorName LIKE @AuthorName + '%')">
                <SelectParameters>
                    <asp:ControlParameter ControlID="TextBox1" Name="AuthorName" 
                        PropertyName="Text" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td align="left" class="style2">
            <asp:TextBox ID="TextBox1" runat="server" Visible="False"></asp:TextBox>
        </td>
    </tr>
</table>

