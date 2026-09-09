<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/MasterPage_admin.master" AutoEventWireup="true" CodeFile="Add_author.aspx.cs" Inherits="Admin_Add_author" %>

<%@ Register src="../admin_controles/Add_Author.ascx" tagname="Add_Author" tagprefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <p>
        <br />
        <uc1:Add_Author ID="Add_Author1" runat="server" />
    </p>
    <p>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; &nbsp;
        <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click" 
            PostBackUrl="~/Admin/Admin.aspx">&lt;&lt; Back To Home</asp:LinkButton>
    </p>
</asp:Content>

