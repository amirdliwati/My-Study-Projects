<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPages/Site.master" AutoEventWireup="true" CodeFile="CustomerInfo.aspx.cs" Inherits="CustomerInfo" %>

<%@ Register src="Controls/ctlClusters.ascx" tagname="ctlClusters" tagprefix="uc1" %>

<%@ Register src="Controls/ctlCustomerInfo.ascx" tagname="ctlCustomerInfo" tagprefix="uc2" %>

<%@ Register src="Controls/ctlClassifyID3.ascx" tagname="ctlClassifyID3" tagprefix="uc3" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="PageTitle" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
    <div style="float:left; padding:4px">
        <uc2:ctlCustomerInfo ID="ctlCustomerInfo1" runat="server" />
    </div>
    <div style="float:left; padding:4px">
        <uc1:ctlClusters ID="ctlClusters1" runat="server" />
        <uc3:ctlClassifyID3 ID="ctlClassifyID31" runat="server" />
    </div>
</asp:Content>

