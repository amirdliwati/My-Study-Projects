<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Authors_publisers.ascx.cs" Inherits="admin_controles_Authors_publisers" %>
<style type="text/css">
    .style1
    {
        width: 68%;
    }
    .style2
    {
        color: #0066FF;
        font-size: x-large;
    }
    .style3
    {
        color: #0066FF;
        font-size: x-large;
    }
    .style4
    {
    }
    .style5
    {
    }
</style>

<table align="left" class="style1">
    <tr>
        <td align="center" class="style3" colspan="3" valign="top">
            <strong>Author</strong></td>
        <td align="center" bgcolor="#FF3300" class="style2" rowspan="9">
            &nbsp;</td>
        <td align="center" class="style2" colspan="2">
            <strong>Publisher</strong></td>
    </tr>
    <tr>
        <td align="center" class="style5" colspan="3" valign="top">
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Author_name" 
                DataTextField="AuthorName" DataValueField="AuthorID" Height="30px" 
                Width="135px" AutoPostBack="True" 
                onselectedindexchanged="DropDownList2_SelectedIndexChanged" 
                AppendDataBoundItems="True">
            </asp:DropDownList>
            </td>
        <td align="center" colspan="2">
            <asp:DropDownList ID="DropDownList3" runat="server" 
                DataSourceID="Publisher_name" DataTextField="PublisherName" 
                DataValueField="PublisherID" Height="29px" style="margin-left: 0px" 
                Width="114px" AutoPostBack="True" 
                onselectedindexchanged="DropDownList3_SelectedIndexChanged" 
                AppendDataBoundItems="True">
            </asp:DropDownList>
        </td>
    </tr>
    <tr>
        <td class="style5" rowspan="2" valign="top">
            Author Name :</td>
        <td rowspan="2" valign="top">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
            </td>
        <td rowspan="2" valign="top">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ForeColor="Red" ToolTip="Author Name Is Null" 
                ValidationGroup="RE">*</asp:RequiredFieldValidator>
        </td>
        <td align="left">
            Publisher Name :</td>
        <td align="left" rowspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ForeColor="Red" ControlToValidate="TextBox1" ValidationGroup="pu">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            <asp:TextBox ID="TextBox3" runat="server"></asp:TextBox>
        </td>
    </tr>
    <tr>
        <td class="style5" valign="top">
            Nationality :</td>
        <td valign="top">
            <asp:DropDownList ID="DropDownList1" runat="server" DataSourceID="nationlity" 
                DataTextField="NationalityName" DataValueField="NationalityID">
            </asp:DropDownList>
        </td>
        <td valign="top">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="DropDownList1" ForeColor="Red" 
                ToolTip="Nationality Is Null" ValidationGroup="RE">*</asp:RequiredFieldValidator>
        </td>
        <td align="left">
            Publisher Description :</td>
        <td align="left">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ForeColor="Red" ControlToValidate="TextBox2" ValidationGroup="pu">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style5" valign="top">
            Author Description :</td>
        <td valign="top">
            <asp:TextBox ID="TextBox2" runat="server" Height="64px" TextMode="MultiLine" 
                Width="147px">NO</asp:TextBox>
            </td>
        <td valign="top">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox2" ForeColor="Red" ToolTip=" Is Null" 
                ValidationGroup="RE">*</asp:RequiredFieldValidator>
        </td>
        <td align="left">
            <asp:TextBox ID="TextBox4" runat="server" Height="62px" Width="148px" 
                TextMode="MultiLine"></asp:TextBox>
        </td>
        <td align="left">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style5" valign="top" colspan="2">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Add" 
                ValidationGroup="RE" />
            <asp:Button ID="Button5" runat="server" Text="Update" Width="70px" 
                onclick="Button5_Click1" />
            <asp:Button ID="Button6" runat="server" Text="Delete" onclick="Button6_Click" 
                onclientclick="return confirm (&quot;o you want to delete&quot;)" />
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            </td>
        <td valign="top">
            &nbsp;</td>
        <td align="left" colspan="2">
            <asp:Button ID="Button4" runat="server" Text="Add" 
                ValidationGroup="pu" onclick="Button4_Click" />
            <asp:Button ID="Button7" runat="server" Text="Update" Width="68px" 
                onclick="Button7_Click" />
            <asp:Button ID="Button8" runat="server" Text="Delete" 
                onclientclick="return confirm (&quot;o you want to delete&quot;)" 
                onclick="Button8_Click" />
        &nbsp;
        </td>
    </tr>
    <tr>
        <td class="style5" valign="top">
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Visible="False">Saved</asp:Label>
        &nbsp;&nbsp;
            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="Deleted" 
                Visible="False"></asp:Label>
        </td>
        <td valign="top" align="center">
            <asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                Text="Resete All" />
        </td>
        <td valign="top">
            &nbsp;</td>
        <td align="left">
            <asp:Label ID="Label2" runat="server" ForeColor="Red" Text="Saved" 
                Visible="False"></asp:Label>
        &nbsp;&nbsp;
            <asp:Label ID="Label4" runat="server" ForeColor="Red" Text="Deleted" 
                Visible="False"></asp:Label>
        </td>
        <td align="left">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4" colspan="2" valign="top">
            <asp:SqlDataSource ID="nationlity" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT * FROM [Nationalities]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Author_name" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT [AuthorID], [AuthorName] FROM [Authors]">
            </asp:SqlDataSource>
            </td>
        <td valign="top">
            &nbsp;</td>
        <td align="left" colspan="2">
            <asp:SqlDataSource ID="Publisher_name" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT [PublisherID], [PublisherName] FROM [Publishers]">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>

