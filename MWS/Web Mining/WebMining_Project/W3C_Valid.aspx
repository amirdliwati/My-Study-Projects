<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="W3C_Valid.aspx.cs" Inherits="W3C_Valid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
<style type="text/css">
        .style3
        {
            width: 1000px;
            margin-left: auto;
            margin-right: auto;
            text-align: center;
        }
        .style15
        {
            color: #0099CC;
            font-size: xx-large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
<div class="style3">
        <br />
        <asp:Label ID="Label1" runat="server" 
            Text="RDF document validated successfully." CssClass="style15"></asp:Label>
        <br />
        <br />
<div style="overflow:scroll;height:800px">
    <asp:Image ID="Image1" runat="server" ImageUrl="~/Images/servlet_5760707817755050580.png" 
        />

</div></div>
</asp:Content>

