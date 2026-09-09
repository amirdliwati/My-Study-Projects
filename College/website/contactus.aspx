<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contactus.aspx.cs" Inherits="contactus" %>

<%@ Register Src="usercontrols/header2.ascx" TagName="header2" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/login.ascx" TagName="login" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/advertising.ascx" TagName="advertising" TagPrefix="uc3" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Untitled Page</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
    
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align: center">
            <table width="100%">
                <tr>
                    <td colspan="2" style="height: 258px; text-align: center">
                        <uc1:header2 ID="Header2_1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;<uc3:advertising ID="Advertising1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left" colspan="2">
                        &nbsp; &nbsp;&nbsp;<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False"
                            DataSourceID="SqlDataSource1" Width="760px">
                            <Columns>
                                <asp:BoundField DataField="name" HeaderText="admin name" ReadOnly="True" SortExpression="name" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="phon" HeaderText="phon" SortExpression="phon" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT fname + ' ' + lname AS name, email, phon FROM admin"></asp:SqlDataSource>
                        <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" DataSourceID="SqlDataSource2"
                            Width="762px">
                            <Columns>
                                <asp:BoundField DataField="name" HeaderText="teacher name" ReadOnly="True" SortExpression="name" />
                                <asp:BoundField DataField="email" HeaderText="email" SortExpression="email" />
                                <asp:BoundField DataField="phon" HeaderText="phon" SortExpression="phon" />
                            </Columns>
                        </asp:GridView>
                        <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT fname + ' ' + lname AS name, email, phon FROM teacher WHERE (active = 'active')">
                        </asp:SqlDataSource>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;<uc4:footer ID="Footer1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
