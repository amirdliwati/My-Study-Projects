<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Teams.aspx.cs" Inherits="Teams" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .circular {
	border-radius: 90%;
	}
        .style3
        {
            width: 300px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
                
        .style6
        {
            font-size: xx-large;
            color: #0099CC;
        }
        .style5
        {
            color: #0000FF;
        }
        
        .style2
        {
            font-size: large;
            text-align: center;
            color: #000000;
        }
        .style7
        {
            font-size: x-large;
            text-align: center;
            color: #003366;
        }
        .style9
        {
            font-size: large;
            text-align: center;
            color: #003300;
        }
        .style11
        {
            color: #336600;
        }
        
        .style12
        {
            font-size: large;
            text-align: center;
        }
        .style13
        {
            width: 100%;
        }
        
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="style3">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetTeams" TypeName="Functions"></asp:ObjectDataSource>
        <br />
        <em><strong>
        <asp:Label ID="Label6" runat="server" CssClass="style6" Text="All Teams"></asp:Label>
        <br />
        <br />
        <br />
        </strong></em>&nbsp;<asp:GridView ID="GridView1" runat="server" 
            AutoGenerateColumns="False" DataSourceID="ObjectDataSource1"
            PageSize="1" BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" 
            BorderWidth="1px" CellPadding="4" ForeColor="Black" GridLines="Vertical" 
            ShowHeader="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="TeamName" SortExpression="TeamName">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("TeamName") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="aligncenter">
                            <strong><span><span class="style11">
                            <br class="style5" />
                            </span></span><span class="style5"><span class="style9"><span class="style11">&nbsp;</span></span></span><asp:Label 
                                ID="Label2" runat="server" CssClass="style7" Text='<%# Bind("TeamName") %>'></asp:Label>
                            &nbsp;</strong></div>
                        <hr style="font-size: large" />
                        <div class="aligncenter">
                            <table class="style13">
                                <tr>
                                    <td>
                                        <span class="style12"><span class="style9"><em><strong>Won Matchs:</strong></em></span></span><span 
                                            class="style2"><strong> </strong></span><strong>
                                        <asp:Label ID="Label4" runat="server" CssClass="style2" 
                                            Text='<%# Eval("WonMatchs") %>'></asp:Label>
                                        </strong>
                                    </td>
                                    <td>
                                        <span class="style2"><strong>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; </strong></span>
                                    </td>
                                    <td>
                                        <span class="style12"><span class="style9"><strong><em>Fail Matchs:</em></strong></span></span><span 
                                            class="style2"><strong> </strong></span><strong>
                                        <asp:Label ID="Label5" runat="server" CssClass="style2" 
                                            Text='<%# Eval("FailMatchs") %>'></asp:Label>
                                        </strong>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                            </table>
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerSettings FirstPageText="First" LastPageText="Last" 
                Mode="NumericFirstLast" NextPageText="Next" Position="TopAndBottom" 
                PreviousPageText="Previous" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Maroon" HorizontalAlign="Center" 
                BorderStyle="Dotted" Font-Size="Large" VerticalAlign="Top" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>
</asp:Content>
