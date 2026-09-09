<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register src="user_controles/u_login.ascx" tagname="u_login" tagprefix="uc2" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        #form1
        {
            height: 782px;
            width: 1322px;
        }
        .style1
        {
            width: 35%;
        }
        .style27
        {
            width: 24px;
        }
    </style>
</head>
<body style="height: 748px; width: 1322px; margin-bottom: 25px">
<form id="form1" runat="server" method="post">
    <table align="center" class="style1">
        <tr>
            <td colspan="2">
                <img alt="" src="Images/Head.jpg" /></td>
        </tr>
        <tr>
            <td class="style4" align="left" valign="top">
                <uc2:u_login ID="u_login1" runat="server" />
            </td>
            <td rowspan="3" align="center">
    
        <p style="height: 320px; width: 519px;">
            &nbsp;</p>
    
            </td>
        </tr>
        <tr>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td class="style27">
                &nbsp;</td>
        </tr>
        <tr>
            <td colspan="2">
                <img alt="" src="Images/Head.jpg" /></td>
        </tr>
    </table>
    </form>
</body>
</html>
