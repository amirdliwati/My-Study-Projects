<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true" CodeBehind="Search.aspx.cs" Inherits="AIRWeb._1_Search" %>
<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style11
        {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
        }
        .style110
        {width: 400px;
            margin-left: auto;
            margin-right: auto;
        }
    .style4
    {
        width: 100%;
    }
    .style5
    {
        height: 38px;
        text-align: center;
    }
        .style6
        {
            font-size: large;
        }
        .style7
        {
            height: 38px;
        }
    .style11
    {
        color: #FFFFCC;
        font-size: large;
    }
        .style12
        {
            width: 100%;
        }
        .style13
        {
            color: #FFFF99;
        }
        .style112
        {
            color: #FF33CC;
        }
        .style111
        {
            color: #000000;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="style3" style="text-align: center">
    <table class="style4">
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <span class="style112"><strong>Examples For Search</strong></span><strong><br />
                </strong><span class="style111"><strong>
                <br />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                Boolean&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; digital and المعلومات or not 
                computer<br />
                Extended Boolean&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                digital and المعلومات<br />
                Vector Model&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &gt;&gt;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; 
                digital المعلومات<br />
                <br />
                </strong></span></td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <strong>
                <asp:Label ID="Label3" runat="server" CssClass="style11" 
                    Text="Please Enter Search Text:"></asp:Label>
                </strong>&nbsp;</td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <asp:TextBox ID="TextBox1" class="form-control" runat="server" Height="431px" Width="816px" TextMode="MultiLine"></asp:TextBox>
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
        </tr>
        <tr>
            <td class="style5">
            </td>
            <td class="style7">
                <asp:Label ID="Label1" runat="server" Text="Choose Type Search" 
                    style="color: #FFFFCC"></asp:Label>
                &nbsp;
                &nbsp;<asp:RadioButtonList ID="RadioButtonList1" runat="server" CellPadding="7" 
                    CellSpacing="7" RepeatDirection="Horizontal" RepeatLayout="Flow" 
                    style="color: #FFFFCC; text-align: center; font-size: medium;">
                    <asp:ListItem Selected="True">Boolean Model</asp:ListItem>
                    <asp:ListItem>VectorModel</asp:ListItem>
                    <asp:ListItem>Extended Boolean</asp:ListItem>
                </asp:RadioButtonList>
                <br />
                <br />
                <strong>
                <asp:Button ID="Button1" class="form-control" runat="server" 
                    onclick="Button1_Click" Text="Search" Width="137px" CssClass="style6" />
                </strong>&nbsp;</td>
            <td class="style5">
            </td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td style="text-align: center; color: #FFFFCC;">
                <asp:Label ID="Label5" runat="server" Font-Bold="True" Font-Italic="False" 
                    Font-Size="Larger" ForeColor="Red"></asp:Label>
                <br />
            </td>
            <td style="color: #FFFFCC; font-weight: 700">
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <br />
            <div class="style11">
                <table class="style12">
                    <tr>
                        <td class="style110" valign="top">
                <asp:GridView ID="GridView1" runat="server" class="style10"
                    style="text-align: center; color: #FFFFCC;" 
                    EmptyDataText="No Result Found" AutoGenerateColumns="False" DataKeyNames="Key" 
                                GridLines="None" onselectedindexchanged="GridView1_SelectedIndexChanged">
                    <Columns>
                        <asp:TemplateField HeaderText="Results" ShowHeader="False">
                            <ItemTemplate>
                                <br />
                                <span class="style13">File Name:</span>
                                <asp:Label ID="Label4" runat="server" Text='<%# Bind("Key","{0}.doc") %>'></asp:Label>
                                &nbsp;||
                                <asp:Image ID="Image1" runat="server" 
                                    ImageUrl='<%# Bind("Value","~/Images/Stars/{0}.png") %>' Width="70px" />
                                &nbsp;||
                                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                    CommandName="Select" Text="Open File"></asp:LinkButton>
                                <br />
                                <hr />
                            </ItemTemplate>
                            <HeaderStyle Font-Bold="True" Font-Italic="True" Font-Size="X-Large" 
                                ForeColor="Red" />
                        </asp:TemplateField>
                    </Columns>
                </asp:GridView>
                        </td>
                        <td>
                            <div style="overflow:auto;height:800px">
                                <asp:Literal ID="Literal1" runat="server"></asp:Literal>
                            </div>
                        </td>
                    </tr>
                    <tr>
                        <td class="style110" colspan="2">
                        </td>
                    </tr>
                </table>
                </div><br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
        <tr>
            <td>
                &nbsp;</td>
            <td>
                <%--<asp:ObjectDataSource ID="ObjectDataSource1" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="SearchFun" 
                    TypeName="AIRWeb.Search">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="RadioButtonList1" Name="searchType" 
                            PropertyName="SelectedValue" Type="String" />
                        <asp:ControlParameter ControlID="TextBox1" Name="searchtxt" PropertyName="Text" 
                            Type="String" />
                    </SelectParameters>
                </asp:ObjectDataSource>--%>
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
        </tr>
    </table>




</div>

</asp:Content>
