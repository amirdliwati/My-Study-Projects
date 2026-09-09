<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Display1.aspx.cs" Inherits="MyWeb.Display1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
    {
        width: 49%;
    }
    .style2
    {
        height: 30px;
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table align="left" class="style1">
    <tr>
        <td class="style2">
            Select Name&#39;s Candidate :</td>
        <td class="style2">
            <asp:DropDownList ID="DropDownList1" runat="server" Height="24px" Width="147px" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" 
                ViewStateMode="Enabled">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Search" />
        </td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:GridView ID="GridView1" runat="server">
            </asp:GridView>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server"></asp:Label>
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>
</asp:Content>
