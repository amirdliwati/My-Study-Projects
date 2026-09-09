<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add_publisherl.ascx.cs" Inherits="admin_controles_Add_publisherl" %>
<style type="text/css">
    .style1
    {
        width: 54%;
        height: 294px;
    }
    .style2
    {
        text-align: center;
        font-size: x-large;
        color: #0066FF;
    }
    .style3
    {
        text-align: center;
        font-size: xx-large;
        color: #0066FF;
    }
</style>

<table class="style1">
    <tr>
        <td class="style3" colspan="3">
            Add Publisher</td>
    </tr>
    <tr>
        <td class="style2" colspan="3">
            1/3</td>
    </tr>
    <tr>
        <td align="left">
            Publisher Name :</td>
        <td align="center">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ForeColor="Red" ControlToValidate="TextBox1" ValidationGroup="pu">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            Publisher Description :</td>
        <td align="center">
            <asp:TextBox ID="TextBox2" runat="server" Height="62px" Width="148px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ForeColor="Red" ControlToValidate="TextBox2" ValidationGroup="pu">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left">
            <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="Save" 
                ValidationGroup="pu" />
        </td>
        <td align="center">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td align="left">
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Saved" 
                Visible="False"></asp:Label>
        </td>
        <td align="center">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
</table>

