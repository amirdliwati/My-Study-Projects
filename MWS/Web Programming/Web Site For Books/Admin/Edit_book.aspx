<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage_admin.master" AutoEventWireup="true" CodeFile="Edit_book.aspx.cs" Inherits="Admin_Edit_book" %>

<%@ Register src="../admin_controles/Edit_book.ascx" tagname="Edit_book" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Edit_book ID="Edit_book1" runat="server" />
</asp:Content>

