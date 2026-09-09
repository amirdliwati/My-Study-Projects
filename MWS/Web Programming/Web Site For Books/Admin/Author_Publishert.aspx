<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage_admin.master" AutoEventWireup="true" CodeFile="Author_Publishert.aspx.cs" Inherits="Admin_Author_Publishert" %>



<%@ Register src="../admin_controles/Authors_publisers.ascx" tagname="Authors_publisers" tagprefix="uc2" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <uc2:Authors_publisers ID="Authors_publisers1" runat="server" />
</asp:Content>

