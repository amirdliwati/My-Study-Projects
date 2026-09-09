<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage_admin.master" AutoEventWireup="true" CodeFile="Catgories.aspx.cs" Inherits="Admin_Catgories" %>

<%@ Register src="../admin_controles/Edit_Catgory.ascx" tagname="Edit_Catgory" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc1:Edit_Catgory ID="Edit_Catgory1" runat="server" />
</asp:Content>

