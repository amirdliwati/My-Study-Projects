<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="DisplayAllJob.aspx.cs" Inherits="MyWeb.MainForm" %>
<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">
    <style type="text/css">
        .style1
        {
            width: 100%;
        }
        .style2
        {
            height: 40px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <table class="style1">
        <tr>
            <td class="style2">
                &nbsp;Click Here For Display All Jobs
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click1" 
                    Text="View" />
                &nbsp;</td>
            <td class="style2">
                </td>
        </tr>
        <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" AllowSorting="True" 
                    BorderColor="#3366FF" BorderStyle="Solid" BorderWidth="5px" Height="198px" 
                    Width="658px">
                </asp:GridView>
                <br />
                <asp:Label ID="Label1" runat="server"></asp:Label>
                <br />
                <br />
                <br />
                <br />
            </td>
            <td>
                &nbsp;</td>
        </tr>
    </table>
</asp:Content>
