<%@ Page Language="C#" AutoEventWireup="true" CodeFile="cluphouse.aspx.cs" Inherits="cluphouse" %>

<%@ Register Src="studentcontrols/clup.ascx" TagName="clup" TagPrefix="uc5" %>

<%@ Register Src="usercontrols/header2.ascx" TagName="header2" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/login.ascx" TagName="login" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="uc3" %>
<%@ Register Src="usercontrols/advertising.ascx" TagName="advertising" TagPrefix="uc4" %>

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
                        &nbsp;<uc1:header2 ID="Header2_1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;<uc4:advertising ID="Advertising1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="text-align: left; height: 16px;" colspan="2">
                        &nbsp; &nbsp;&nbsp;&nbsp;<uc5:clup ID="Clup1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;<uc3:footer ID="Footer1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
