<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Edit_Catgory.ascx.cs" Inherits="admin_controles_Edit_Catgory" %>
<style type="text/css">
    .style1
    {
        width: 38%;
        height: 363px;
    }
    .style2
    {
        font-size: x-large;
        color: #0066FF;
    }
    .style3
    {}
</style>

<table class="style1">
    <tr>
        <td align="center" class="style2" colspan="3">
            <strong><em>Categories</em></strong></td>
    </tr>
    <tr>
        <td align="center" class="style3" colspan="3">
            <asp:DropDownList ID="DropDownList1" runat="server" AppendDataBoundItems="True" 
                AutoPostBack="True" DataSourceID="Catgory" DataTextField="CategoryName" 
                DataValueField="CategoryID" Height="20px" 
                onselectedindexchanged="DropDownList1_SelectedIndexChanged" Width="124px">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td align="left" class="style3">
            Catgory Name</td>
        <td align="left">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ForeColor="Red" ToolTip="Author Name Is Null" 
                ValidationGroup="RE">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left" class="style3">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" 
                ValidationGroup="RE" />
&nbsp;
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Update" 
                ValidationGroup="RE" />
&nbsp;
        </td>
        <td align="left">
            <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td align="left">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left" colspan="2">
            <asp:SqlDataSource ID="Catgory" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT CategoryName, CategoryID FROM Categories">
            </asp:SqlDataSource>
        </td>
        <td align="left">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left" class="style3">
            &nbsp;</td>
        <td align="left">
            &nbsp;</td>
        <td align="left">
            &nbsp;</td>
    </tr>
</table>

