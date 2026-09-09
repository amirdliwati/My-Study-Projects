<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Swimmers.aspx.cs" Inherits="Swimmers" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .circular {
	border-radius: 70%;
	}
        .style3
        {
            width: 700px;
            margin-left: auto;
            margin-right: auto;
        }
        .style4
        {
            color: blue;
        }
        .style5
        {
            font-size: x-large;
        }
        .style6
        {
            color: #003300;
        }
        .style7
        {
            font-size: large;
            text-align: justify;
            font-weight: 700;
        }
        .style9
        {
            text-align: left;direction: rtl;
        }
        .style10
        {
            width: 100%;
        }
        .style15
        {
            color: #0099CC;
            font-size: xx-large;
        }
        .style16
        {
            font-size: xx-large;
        }
        .style17
        {
            text-align: right;
direction: rtl;
            text-decoration: underline;
            color: #0099CC;
        }
        .style18
        {
            font-size: large;
        }
        .style19
        {
            font-size: x-large;
            color: #663300;
        }
        .style191
        {
            direction:rtl;
            text-align: center;
        }
        .style192
        {
            font-size: large;
            text-align: left;
            font-weight: 700;
            text-decoration: underline;
        }
        .style194
        {
            direction: rtl;
            text-align: justify;
        }
        .style195
        {
            font-size: large;
            color: #003300;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="style3">

        <div class="aligncenter">
            <em><strong>
            <br />

        <asp:Label ID="Label8" runat="server" Text="All Swimmers " CssClass="style15"></asp:Label>
        &nbsp;<br />
            </strong></em><strong><em class="style16">
        <br />
            </em></strong>
        </div>
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="GetAllSwimmers" 
            TypeName="Functions"></asp:ObjectDataSource>
        <asp:GridView ID="SwimmerGV" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ObjectDataSource1" PageSize="5" 
            onrowdatabound="SwimmerGV_RowDataBound" BackColor="White" 
            BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" CellPadding="4" 
            ForeColor="Black" GridLines="Vertical" ShowHeader="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField SortExpression="SwimmerImage">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("SwimmerImage") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <br />
                        <br />
                        <br />
                        <asp:Image class="circular" ID="Image1" runat="server" ImageUrl='<%# Eval("SwimmerImage") %>' 
                            Width="280px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField SortExpression="FirstName">
                    <ItemTemplate>
                        <div class="aligncenter">
                            <span class="style4"><strong>
                            <br />
                            <asp:Label ID="Label1" runat="server" CssClass="style5" 
                                Text='<%# Bind("EngName") %>' Visible="False"></asp:Label>
                            <asp:Label ID="Label4" runat="server" CssClass="style5" 
                                Text='<%# Bind("ArName") %>'></asp:Label>
                            </strong></span>
                            <br />
                        </div>
                        <hr style="font-weight: 700; font-size: large" />
                        <div class="style9">
                            <table class="style10">
                                <tr>
                                    <td class="style191">
                                        &nbsp;</td>
                                    <td class="style191">
&nbsp;</td>
                                    <td class="style191" colspan="4">
                                        <span class="style18">مواليد مدينة</span> <span>
                                        <asp:Label ID="Label3" runat="server" CssClass="style192" 
                                            Text='<%# Bind("City") %>'></asp:Label>
                                        </span><span class="style18">عام</span><span>
                                        <asp:Label ID="Label2" runat="server" CssClass="style192" 
                                            Text='<%# Bind("BirthDate") %>'></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style194">
                                        &nbsp;</td>
                                    <td class="style194">
                                        &nbsp;</td>
                                    <td class="style194" colspan="4">
                                        <span class="style195"><strong><em>لمحة عامة: </em></strong></span><span>
                                        <asp:Label ID="Label5" runat="server" CssClass="style7" 
                                            Text='<%# Bind("Abstract") %>'></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td class="style194">
                                        &nbsp;</td>
                                    <td class="style194">
                                        &nbsp;</td>
                                    <td class="style194" colspan="4">
                                        <span class="style6"><strong class="style18"><em>الإنجازات:<br /> </em></strong>
                                        </span><span>
                                        <asp:Label ID="Label7" runat="server" CssClass="style7" 
                                            Text='<%# Bind("Awards") %>'></asp:Label>
                                        </span>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td colspan="2">
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td colspan="2">
                                        <div class="style17">
                                            <span class="style19"><strong>مشارك بالفرق التالية:</strong></span><strong 
                                                class="style18">&nbsp; </strong>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="style17">
                                            <span class="style19"><strong>يرتاد المسابح التالية:</strong></span><strong 
                                                class="style18"> </strong>
                                        </div>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        &nbsp;</td>
                                    <td>
                                        &nbsp;</td>
                                    <td colspan="2">
                                        <div class="style9">
                                            <br />
                                            <asp:GridView ID="SwimmerTeamGV" runat="server" CellSpacing="4" 
                                                CssClass="style18" Font-Bold="True" Font-Italic="False" Font-Overline="False" 
                                                Font-Strikeout="False" Font-Underline="False" ShowHeader="False">
                                            </asp:GridView>
                                        </div>
                                    </td>
                                    <td colspan="2">
                                        <div class="style9">
                                            <br />
                                            <asp:GridView ID="SwimInGV" runat="server" CellSpacing="4" CssClass="style18" 
                                                Font-Bold="True" Font-Italic="False" ShowHeader="False">
                                            </asp:GridView>
                                        </div>
                                    </td>
                                </tr>
                            </table>
                            <br />
                            </div>
                    </ItemTemplate>
                    <ItemStyle Width="400px" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="#CCCC99" />
            <HeaderStyle BackColor="#6B696B" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#F7F7DE" ForeColor="Black" HorizontalAlign="Right" />
            <RowStyle BackColor="#F7F7DE" />
            <SelectedRowStyle BackColor="#CE5D5A" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#FBFBF2" />
            <SortedAscendingHeaderStyle BackColor="#848384" />
            <SortedDescendingCellStyle BackColor="#EAEAD3" />
            <SortedDescendingHeaderStyle BackColor="#575357" />
        </asp:GridView>
    </div>
</asp:Content>
