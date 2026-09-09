<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage_admin.master" AutoEventWireup="true" CodeFile="view_authors.aspx.cs" Inherits="Admin_view_authors" %>

<%@ Register src="../admin_controles/view_authors.ascx" tagname="view_authors" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:view_authors ID="view_authors1" runat="server" />
</asp:Content>

