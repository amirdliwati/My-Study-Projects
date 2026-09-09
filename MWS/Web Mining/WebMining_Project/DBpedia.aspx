<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="DBpedia.aspx.cs" Inherits="DBpedia" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style type="text/css">.circular {
	border-radius: 70%;
	}
        .style4
        {
            width: 700px;
            margin-left: auto;
            margin-right: auto;
        }
    .style5
    {
        color: #0033CC;
        font-size: large;
    }
    .style6
    {
        color: #336600;
    }
    .style7
    {
        font-size: large;
    }
    .style8
    {
        text-align: justify;
    }
    .style9
    {
        font-size: large;
        color: #003300;
    }
    .style10
    {
        width: 100%;
    }
    .style11
    {
        font-size: large;
        color: #000000;
    }
    .style12
    {
        color: #000000;
    }
    .style13
    {
        color: #336600;
        font-size: large;
    }
    .style14
    {
        color: #003300;
    }
    .style15
    {
        color: #0033CC;
    }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <div class="style4">
        <p class="aligncenter">
            &nbsp;</p>
        <p class="aligncenter">
            <em><strong>

        <asp:Label ID="Label13" runat="server" 
                Text="Choose Category to get it from DBpedia" CssClass="style15" 
                style="font-size: x-large; color: #0099FF"></asp:Label>
        &nbsp;</strong></em></p>
        <p class="aligncenter">
            &nbsp;</p>
        <p class="aligncenter">
            <strong>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                CssClass="style13" 
                onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                RepeatDirection="Horizontal" RepeatLayout="Flow" CellPadding="4" 
                CellSpacing="5" CausesValidation="True">
                <asp:ListItem>&nbsp;FootBallers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                <asp:ListItem>&nbsp;Swimmers&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</asp:ListItem>
                <asp:ListItem>&nbsp;BasketBall Players</asp:ListItem>
            </asp:RadioButtonList>
            </strong>&nbsp;</p>
        <br />
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
            DataSourceID="ObjectDataSource1" DataKeyNames="Resource" 
            onselectedindexchanged="GridView1_SelectedIndexChanged" AllowPaging="True" 
            PageSize="6" ShowHeader="False" Visible="False">
            <Columns>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <ItemTemplate>
                        <div class="aligncenter">
                            <hr />
                            <strong>
                            <asp:Label ID="Label4" runat="server" CssClass="style5" 
                                Text='<%# Bind("Name") %>'></asp:Label>
                            &nbsp;</strong><span class="style9"><strong>Born </strong></span>&nbsp;<strong><asp:Label 
                                ID="Label6" runat="server" CssClass="style5" Text='<%# Bind("BirthDate") %>'></asp:Label>
                            &nbsp;</strong></div>
                        <hr />
                        <div class="style8">
                            <span class="style6"><strong class="style7"><em>Abstract: </em></strong></span>
                            <asp:Label ID="Label7" runat="server" CssClass="style7" 
                                Text='<%# Bind("Abstract") %>'></asp:Label>
                            &nbsp;&nbsp;<br />
                            <br />
                            <table class="style10">
                                <tr>
                                    <td>
                                        <span class="style6"><em><strong class="style7">Position: </strong></em></span>
                                        <strong>
                                        <asp:Label ID="Label1" runat="server" CssClass="style7" 
                                            Text='<%# Bind("Position") %>'></asp:Label>
                                        </strong>&nbsp;&nbsp;</td>
                                    <td>
                                        <span class="style6"><em><strong class="style7">Height:</strong></em></span><span 
                                            class="style7"><strong> </strong></span><strong>
                                        <asp:Label ID="Label8" runat="server" CssClass="style7" 
                                            Text='<%# Bind("Height","{0}m") %>'></asp:Label>
                                        </strong>
                                    </td>
                                </tr>
                            </table>
                            <strong>
                            <br class="style7" />
                            <asp:LinkButton ID="LinkButton1" runat="server" CommandName="Select" 
                                CssClass="style7">Click here To See Player DBpedia Page.</asp:LinkButton>
                            </strong>
                            <br />
                            <br />
                        </div>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="Thumbnail" SortExpression="Thumbnail">
                    <ItemTemplate>
                        <br />
                        <asp:Image ID="Image1" runat="server" class="circular" ImageUrl='<%# Bind("Thumbnail") %>' 
                            Width="200px" Height="200px" />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
            <PagerSettings FirstPageText="First" LastPageText="Last" 
                Mode="NumericFirstLast" NextPageText="Next" PageButtonCount="3" 
                Position="TopAndBottom" PreviousPageText="Previous" />
            <PagerStyle Font-Bold="True" Font-Size="Large" Font-Underline="False" 
                HorizontalAlign="Center" VerticalAlign="Top" Wrap="True" />
        </asp:GridView>
    <asp:GridView ID="SwimGV" runat="server" AutoGenerateColumns="False" DataKeyNames="Resource" 
        DataSourceID="SwimODS1" AllowPaging="True" 
            onselectedindexchanged="SwimGV_SelectedIndexChanged" ShowHeader="False" 
            Visible="False">
        <Columns>
            <asp:TemplateField HeaderText="Name" SortExpression="Name">
                <EditItemTemplate>
                    <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                </EditItemTemplate>
                <ItemTemplate>
                    <hr />
                    <div class="aligncenter">
                        <strong>
                        <asp:Label ID="Label9" runat="server" CssClass="style5" 
                            Text='<%# Bind("Name") %>'></asp:Label>
                        <span class="style9">&nbsp;Born</span></strong><span class="style5"><strong>
                        <asp:Label ID="Label10" runat="server" Text='<%# Bind("BirthDate") %>'></asp:Label>
                        </strong></span>
                    </div>
                    <hr />
                    <strong class="style6">
                    <table class="style12">
                        <tr>
                            <td colspan="3">
                                <strong class="style6"><span class="style10"><em class="style7">Abstract:</em></span></strong><span 
                                    class="style7"> </span><span class="style11">
                                <asp:Label ID="Label3" runat="server" CssClass="style11" 
                                    Text='<%# Bind("Abstract") %>'></asp:Label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td>
                                <strong class="style6"><span class="style10"><em class="style7">Description:</em></span><span 
                                    class="style11">
                                <asp:Label ID="Label11" runat="server" Text='<%# Bind("Position") %>'></asp:Label>
                                </span></strong>
                            </td>
                            <td>
                                <strong class="style6"><em><span class="style13">Weight:</span></em><span 
                                    class="style11">
                                <asp:Label ID="Label12" runat="server" Text='<%# Bind("Weight","{0}Kg") %>'></asp:Label>
                                </span></strong>
                            </td>
                            <td class="alignright">
                                <span class="style6"><em class="style7">Height:</em></span><span class="style7">
                                </span><span class="style11">
                                <asp:Label ID="Label5" runat="server" Text='<%# Bind("Height","{0}m") %>'></asp:Label>
                                </span>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2">
                                &nbsp;</td>
                            <td>
                                &nbsp;</td>
                        </tr>
                        <tr>
                            <td colspan="3">
                                <asp:LinkButton ID="LinkButton2" runat="server" CommandName="Select" 
                                    CssClass="style7">Click here To See Player DBpedia Page.</asp:LinkButton>
                                &nbsp;<br />
                                <br />
                            </td>
                        </tr>
                    </table>
                    </strong>
                </ItemTemplate>
            </asp:TemplateField>
        </Columns>
        <PagerSettings FirstPageText="First" LastPageText="Last" 
            Mode="NumericFirstLast" NextPageText="Next" Position="TopAndBottom" 
            PreviousPageText="Previous" />
        <PagerStyle Font-Bold="True" Font-Size="Large" HorizontalAlign="Center" 
            VerticalAlign="Top" />
    </asp:GridView>
        <asp:GridView ID="BasketGV" runat="server" AutoGenerateColumns="False" 
            DataSourceID="BasketODS" onselectedindexchanged="BasketGV_SelectedIndexChanged" 
            ShowHeader="False" Visible="False" DataKeyNames="Resource">
            <Columns>
                <asp:TemplateField HeaderText="Name" SortExpression="Name">
                    <EditItemTemplate>
                        <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("Name") %>'></asp:TextBox>
                    </EditItemTemplate>
                    <ItemTemplate>
                        <hr />
                        <div class="aligncenter">
                            <strong>
                            <asp:Label ID="Label2" runat="server" CssClass="style5" 
                                Text='<%# Bind("Name") %>'></asp:Label>
                            </strong><strong class="style7"><span class="style14">&nbsp;Born</span><span 
                                class="style15">
                            <asp:Label ID="Label4" runat="server" Text='<%# Bind("BirthDate") %>'></asp:Label>
                            &nbsp;</span></strong></div>
                        <hr />
                        <span class="style6"><em><strong class="style7">Abstract:</strong></em></span><span 
                            class="style7"> </span>
                        <asp:Label ID="Label3" runat="server" CssClass="style7" 
                            Text='<%# Bind("Abstract") %>'></asp:Label>
                        <strong>
                        <br />
                        </strong>
                        <br />
                        <strong>
                        <asp:LinkButton ID="LinkButton3" runat="server" CommandName="Select" 
                            CssClass="style7">Click here To See Player DBpedia Page.</asp:LinkButton>
                        <br />
                        <br />
                        </strong>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </asp:GridView>
        <br />
    <asp:ObjectDataSource ID="SwimODS1" runat="server" 
        OldValuesParameterFormatString="original_{0}" SelectMethod="getSwimmers" 
        TypeName="DBpediaFunctions"></asp:ObjectDataSource>
        <asp:ObjectDataSource ID="BasketODS" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="getBasketball" 
            TypeName="DBpediaFunctions"></asp:ObjectDataSource>
        <br />
        <asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
            OldValuesParameterFormatString="original_{0}" SelectMethod="getFootball" 
            TypeName="DBpediaFunctions"></asp:ObjectDataSource>
        <br />
      <br /> 
    </div>
</asp:Content>

