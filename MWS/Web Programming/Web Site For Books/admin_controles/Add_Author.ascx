<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add_Author.ascx.cs" Inherits="admin_controles_Add_books" %>
<style type="text/css">
    .style1
    {
        width: 46%;
        font-size: small;
    }
    .style2
    {
        font-size: x-large;
        color: #0066FF;
    }
    .style3
    {
        font-size: xx-large;
        color: #0066FF;
    }
</style>

<table class="style1">
    <tr>
        <td align="center" class="style3" colspan="3">
            <strong>Add Author</strong></td>
    </tr>
    <tr>
        <td align="center" class="style2" colspan="3">
            3/3</td>
    </tr>
    <tr>
        <td>
            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                Height="44px" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                Width="135px">
                <asp:ListItem>Select Author</asp:ListItem>
                <asp:ListItem>Add Author</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td>
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center" colspan="2">
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Author_name" 
                DataTextField="AuthorName" DataValueField="AuthorID" Height="19px" 
                Visible="False" Width="135px" AutoPostBack="True" 
                onselectedindexchanged="DropDownList2_SelectedIndexChanged" 
                AppendDataBoundItems="True">
            </asp:DropDownList>
            <br />
            <br />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            Author Name :</td>
        <td>
            &nbsp;<asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            &nbsp;</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ForeColor="Red" ToolTip="Author Name Is Null" 
                ValidationGroup="RE">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Nationality :</td>
        <td>
            &nbsp;&nbsp;<asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="nationlity" 
                DataTextField="NationalityName" DataValueField="NationalityID">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="DropDownList1" ForeColor="Red" 
                ToolTip="Nationality Is Null" ValidationGroup="RE">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Author Description :</td>
        <td>
            &nbsp;<asp:TextBox ID="TextBox2" runat="server" Height="64px" TextMode="MultiLine" 
                Width="147px">NO</asp:TextBox>
            &nbsp;</td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox2" ForeColor="Red" ToolTip=" Is Null" 
                ValidationGroup="RE">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" 
                ValidationGroup="RE" Visible="False" />
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Select" 
                Visible="False" />
        </td>
        <td align="center">
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" Text="Resete" />
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="False">Saved</asp:Label>
        </td>
        <td align="center">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td colspan="2">
            <asp:SqlDataSource ID="nationlity" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT * FROM [Nationalities]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Author_name" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT [AuthorID], [AuthorName] FROM [Authors]">
            </asp:SqlDataSource>
            <br />
        </td>
        <td>
            &nbsp;</td>
    </tr>
</table>

