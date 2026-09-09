<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>

<%@ Register Src="usercontrols/advertisingcontent.ascx" TagName="advertisingcontent"
    TagPrefix="uc22" %>



<%@ Register Src="teacheruserconrol/addquastion.ascx" TagName="addquastion" TagPrefix="uc21" %>

<%@ Register Src="admincontrols/addclupsubject.ascx" TagName="addclupsubject" TagPrefix="uc19" %>
<%@ Register Src="admincontrols/updateclupsubject.ascx" TagName="updateclupsubject"
    TagPrefix="uc20" %>

<%@ Register Src="admincontrols/addstudentsubject.ascx" TagName="addstudentsubject"
    TagPrefix="uc16" %>
<%@ Register Src="admincontrols/activeteachersubject.ascx" TagName="activeteachersubject"
    TagPrefix="uc17" %>
<%@ Register Src="admincontrols/activestudentsubject.ascx" TagName="activestudentsubject"
    TagPrefix="uc18" %>

<%@ Register Src="admincontrols/updateteacher.ascx" TagName="updateteacher" TagPrefix="uc14" %>
<%@ Register Src="admincontrols/addteachersubject.ascx" TagName="addteachersubject"
    TagPrefix="uc15" %>

<%@ Register Src="admincontrols/addteacher.ascx" TagName="addteacher" TagPrefix="uc13" %>

<%@ Register Src="admincontrols/addstudent.ascx" TagName="addstudent" TagPrefix="uc11" %>
<%@ Register Src="admincontrols/updatestudent.ascx" TagName="updatestudent" TagPrefix="uc12" %>

<%@ Register Src="admincontrols/addadvertising.ascx" TagName="addadvertising" TagPrefix="uc5" %>
<%@ Register Src="admincontrols/updateadvertising.ascx" TagName="updateadvertising"
    TagPrefix="uc6" %>
<%@ Register Src="admincontrols/adddepartment.ascx" TagName="adddepartment" TagPrefix="uc7" %>
<%@ Register Src="admincontrols/updatedepartment.ascx" TagName="updatedepartment"
    TagPrefix="uc8" %>
<%@ Register Src="admincontrols/addsubject.ascx" TagName="addsubject" TagPrefix="uc9" %>
<%@ Register Src="admincontrols/updatesubject.ascx" TagName="updatesubject" TagPrefix="uc10" %>

<%@ Register Src="usercontrols/login.ascx" TagName="login" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="uc3" %>
<%@ Register Src="usercontrols/advertising.ascx" TagName="advertising" TagPrefix="uc4" %>

<%@ Register Src="usercontrols/header.ascx" TagName="header" TagPrefix="uc1" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
    <link href="styles.css" rel="stylesheet" type="text/css" />
</head>
<body dir="ltr" background="0001 (7).JPG">
    <form id="form1" runat="server">
    <div style="text-align: center">
        <table width="100%">
            <tr>
                <td colspan="2" style="height: 258px; text-align: center">
                    &nbsp;<uc1:header ID="Header1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center">
                    &nbsp;<uc4:advertising id="Advertising2" runat="server">
                    </uc4:advertising></td>
            </tr>
            <tr>
                <td style="width: 10px; text-align: left;">
                    &nbsp;<uc2:login ID="Login1" runat="server" />
                </td>
                <td style="width: 100px">
                    &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <uc22:advertisingcontent ID="Advertisingcontent1" runat="server" />
                </td>
            </tr>
            <tr>
                <td colspan="2" style="text-align: center; height: 5px;">
                    &nbsp;</td>
            </tr>
        </table>
    
    </div>
    </form>
</body>
</html>
