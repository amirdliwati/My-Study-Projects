<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Pools.aspx.cs" Inherits="Pools" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .circular {
	border-radius: 90%;
	}
        .style3
        {
            width: 700px;
            margin-left: auto;
            margin-right: auto;
        }
        .style6
        {
            width: 100%;
        }
        .style10
        {
            font-size: large;
            color: #003300;
        }
        .style11
        {
            color: #003300;
        }
        .style12
        {
            font-size: large;
        }
        .style13
        {
            text-align: left;
        }
        .style14
        {
            font-size: xx-large;
            color: #0099CC;
        }
        .style15
        {
            text-align: right;
            font-weight: bold;
        }
        .style16
        {
            font-size: large;
            font-weight: bold;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="style3">
        <h2>
            &nbsp;</h2>
        <p class="aligncenter">
            <em><strong>
            <asp:Label ID="Label8" runat="server" CssClass="style14" Text="Swimming Pools"></asp:Label>
            </strong></em>&nbsp;</p>
        <br />
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" OldValuesParameterFormatString="original_{0}"
            SelectMethod="GetSwimmingPools" TypeName="Functions"></asp:ObjectDataSource>
        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
            BackColor="White" BorderColor="#DEDFDE" BorderStyle="None" BorderWidth="1px" 
            CellPadding="4" DataSourceID="ObjectDataSource1" ForeColor="Black" 
            GridLines="Vertical" ShowHeader="False">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:TemplateField HeaderText="SwimmingPoolImage" 
                    SortExpression="SwimmingPoolImage">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" 
                            Text='<%# Bind("SwimmingPoolImage") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <br />
                        <br />
                        <br />
                        <asp:Image class="circular" ID="Image2" runat="server" 
                            ImageUrl='<%# Eval("SwimmingPoolImage") %>' Width="300px" />
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="PoolName" SortExpression="PoolName">
                    <ItemTemplate>
                        <div class="aligncenter">
                            <strong>
                            <br />
                            <asp:Label ID="Label7" runat="server" CssClass="style13" 
                                style="font-size: x-large; color: blue" Text='<%# Bind("PoolName") %>'></asp:Label>
                            </strong>&nbsp;<br />
                        </div>
                        <hr />
                        <div class="alignright">
                            <br />
                        </div>
                        <table class="style6">
                            <tr>
                                <td class="style15" rowspan="9">
                                    <strong>
                                    <asp:Label ID="Label3" runat="server" CssClass="style12" 
                                        Text='<%# Bind("SwimmingPoolDescription") %>'></asp:Label>
                                    </strong>
                                </td>
                                <td class="style15">
                                    <span class="style10"><strong><em>المدينة:</em></strong></span><span 
                                        class="style16"> </span><b>
                                    <asp:Label ID="Label6" runat="server" CssClass="style12" 
                                        Text='<%# Bind("Location") %>'></asp:Label>
                                    </b>
                                </td>
                                <td class="style15">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    </td>
                                <td class="style15">
                                    &nbsp;&nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    <span class="style11"><strong><em class="style12">العنوان:</em></strong></span><span 
                                        class="style12"> </span><strong>
                                    <asp:Label ID="Label5" runat="server" CssClass="style12" 
                                        Text='<%# Bind("AccessStreet") %>'></asp:Label>
                                    </strong>
                                </td>
                                <td class="style15">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    &nbsp;</td>
                                <td class="style15">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    <span class="style11"><strong><em class="style12">حالة المسبح:</em></strong></span>&nbsp;<strong><asp:Label 
                                        ID="Label4" runat="server" CssClass="style12" Text='<%# Bind("Condition") %>'></asp:Label>
                                    </strong>
                                </td>
                                <td class="style15">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    &nbsp;</td>
                                <td class="style15">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15">
                                    <span class="style10"><em>الخدمات:</em></span><span class="style12"> </span><asp:Label 
                                        ID="Label10" runat="server" CssClass="style12" Text='<%# Bind("Services") %>'></asp:Label>
                                </td>
                                <td class="style15">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15" colspan="2">
                                    &nbsp;</td>
                                <td class="style15">
                                    &nbsp;</td>
                            </tr>
                            <tr>
                                <td class="style15" colspan="2">
                                    &nbsp;</td>
                                <td class="style15">
                                    &nbsp;</td>
                            </tr>
                        </table>
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
        <br />
    </div>
</asp:Content>
