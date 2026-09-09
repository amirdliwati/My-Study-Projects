<%@ Page Language="C#" AutoEventWireup="true" CodeFile="student.aspx.cs" Inherits="student" %>

<%@ Register Src="usercontrols/welcom.ascx" TagName="welcom" TagPrefix="uc9" %>

<%@ Register Src="usercontrols/advertisingcontent.ascx" TagName="advertisingcontent"
    TagPrefix="uc8" %>

<%@ Register Src="studentcontrols/viewlessons.ascx" TagName="viewlessons" TagPrefix="uc5" %>
<%@ Register Src="studentcontrols/viewmarks.ascx" TagName="viewmarks" TagPrefix="uc6" %>
<%@ Register Src="admincontrols/changpass.ascx" TagName="changpass" TagPrefix="uc7" %>



<%@ Register Src="usercontrols/header2.ascx" TagName="header2" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/advertising.ascx" TagName="advertising" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/login.ascx" TagName="login" TagPrefix="uc3" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="uc4" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div style="text-align: center">
            <table width="100%">
                <tr>
                    <td colspan="2" style="height: 258px; text-align: center">
                        <uc1:header2 ID="Header2_1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;
                        <uc2:advertising ID="Advertising1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 10px; text-align: left; height: 361px;">
                        &nbsp;&nbsp;
                        <table>
                            <tr>
                                <td style="width: 100px">
                                    <uc9:welcom ID="Welcom1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="home page" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="view marks" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="view lissons" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="enter exam" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; height: 16px">
                                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="chang password" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="log out" /></td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 100px; height: 361px; text-align: left;">
                        &nbsp;&nbsp;
                        <uc8:advertisingcontent ID="Advertisingcontent1" runat="server" Visible="true" />
                        <uc7:changpass ID="Changpass1" runat="server" Visible="false" />
                        <uc5:viewlessons ID="Viewlessons1" runat="server" Visible="false" />
                        &nbsp;
                        <uc6:viewmarks ID="Viewmarks1" runat="server" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;
                        <uc4:footer ID="Footer1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
