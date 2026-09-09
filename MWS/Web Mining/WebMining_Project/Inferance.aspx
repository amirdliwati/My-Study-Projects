<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true"
    CodeFile="Inferance.aspx.cs" Inherits="Validation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
    <style type="text/css">
        .style3
        {
            width: 700px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        .style4
        {
            width: 100%;
        }
        .style5
        {
            color: #FF0000;
        }
        .style6
        {
            color: #660033;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <div class="style3">
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="AllInfer" 
            TypeName="Inference"></asp:ObjectDataSource>
        <br />
        <table class="style4">
            <tr>
                <td class="aligncenter">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ObjectDataSource1" CellPadding="4" 
            GridLines="Horizontal" BackColor="White" BorderColor="#336666" BorderStyle="Double" 
                        BorderWidth="3px" CellSpacing="2" onrowdatabound="GridView1_RowDataBound" 
                        Width="290px">
            <Columns>
                <asp:TemplateField HeaderText="Subject" SortExpression="Subject">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("Subject") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="aligncenter">
                            <strong>
                            <asp:Label ID="Label3" runat="server" CssClass="style5" style="color: #336600" 
                                Text='<%# Bind("Subject") %>'></asp:Label>
                            &nbsp;</strong></div>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Predicate" SortExpression="Predicate">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Predicate") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="aligncenter">
                            <strong>
                            <asp:Label ID="Label2" runat="server" CssClass="style6" style="color: #FF0000" 
                                Text='<%# Bind("Predicate") %>'></asp:Label>
                            <span class="style5">&nbsp;</span></strong></div>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Object" SortExpression="Object">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Object") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <div class="aligncenter">
                            <strong>
                            <asp:Label ID="Label1" runat="server" CssClass="style5" style="color: #0033CC" 
                                Text='<%# Bind("Object") %>'></asp:Label>
                            </strong>
                        </div>
                    </ItemTemplate>
                    <HeaderStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                    <ItemStyle HorizontalAlign="Center" VerticalAlign="Middle" />
                </asp:TemplateField>
            </Columns>
            <FooterStyle BackColor="White" ForeColor="#333333" />
            <HeaderStyle BackColor="#FFFF99" Font-Bold="True" ForeColor="#CC3399" />
            <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="White" ForeColor="#333333" />
            <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
            <SortedAscendingCellStyle BackColor="#F7F7F7" />
            <SortedAscendingHeaderStyle BackColor="#487575" />
            <SortedDescendingCellStyle BackColor="#E5E5E5" />
            <SortedDescendingHeaderStyle BackColor="#275353" />
        </asp:GridView>
                </td>
                <td class="aligncenter">
                    <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                        CellPadding="4" CellSpacing="2" GridLines="Horizontal" 
                        onrowdatabound="GridView2_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Persons after Inference">
                                <ItemTemplate>
                                    <div class="aligncenter">
                                        <strong>
                                        <asp:Label ID="Label4" runat="server" CssClass="style6" 
                                            Text='<%# Bind("Person") %>'></asp:Label>
                                        </strong>&nbsp;</div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
                <td class="aligncenter">
                    &nbsp;</td>
                <td class="aligncenter">
                    <asp:GridView ID="GridView3" runat="server" AutoGenerateColumns="False" 
                        BackColor="White" BorderColor="#336666" BorderStyle="Double" BorderWidth="3px" 
                        CellPadding="4" CellSpacing="2" GridLines="Horizontal" 
                        onrowdatabound="GridView3_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="Mammals after Inference">
                                <ItemTemplate>
                                    <div class="aligncenter">
                                        <strong>
                                        <asp:Label ID="Label5" runat="server" CssClass="style6" 
                                            Text='<%# Bind("mammal") %>'></asp:Label>
                                        </strong>&nbsp;</div>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                        <FooterStyle BackColor="White" ForeColor="#333333" />
                        <HeaderStyle BackColor="#336666" Font-Bold="True" ForeColor="White" />
                        <PagerStyle BackColor="#336666" ForeColor="White" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" ForeColor="#333333" />
                        <SelectedRowStyle BackColor="#339966" Font-Bold="True" ForeColor="White" />
                        <SortedAscendingCellStyle BackColor="#F7F7F7" />
                        <SortedAscendingHeaderStyle BackColor="#487575" />
                        <SortedDescendingCellStyle BackColor="#E5E5E5" />
                        <SortedDescendingHeaderStyle BackColor="#275353" />
                    </asp:GridView>
                </td>
                <td>
                    &nbsp;</td>
            </tr>
            <tr>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
                <td>
                    &nbsp;</td>
            </tr>
        </table>
&nbsp;</div>
</asp:Content>
