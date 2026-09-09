<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin.aspx.cs" Inherits="admin" %>

<%@ Register Src="admincontrols/changteacherpass.ascx" TagName="changteacherpass"
    TagPrefix="uc25" %>
<%@ Register Src="admincontrols/changstudentpass.ascx" TagName="changstudentpass"
    TagPrefix="uc26" %>

<%@ Register Src="usercontrols/welcom.ascx" TagName="welcom" TagPrefix="uc24" %>

<%@ Register Src="admincontrols/activereplay.ascx" TagName="activereplay" TagPrefix="uc23" %>

<%@ Register Src="admincontrols/clupsubject.ascx" TagName="clupsubject" TagPrefix="uc22" %>

<%@ Register Src="usercontrols/advertisingcontent.ascx" TagName="advertisingcontent"
    TagPrefix="uc21" %>

<%@ Register Src="admincontrols/changpass.ascx" TagName="changpass" TagPrefix="uc20" %>

<%@ Register Src="admincontrols/addadvertising.ascx" TagName="addadvertising" TagPrefix="uc1" %>
<%@ Register Src="admincontrols/activestudentsubject.ascx" TagName="activestudentsubject"
    TagPrefix="uc3" %>
<%@ Register Src="admincontrols/activeteachersubject.ascx" TagName="activeteachersubject"
    TagPrefix="uc6" %>
<%@ Register Src="admincontrols/addclupsubject.ascx" TagName="addclupsubject" TagPrefix="uc7" %>
<%@ Register Src="admincontrols/adddepartment.ascx" TagName="adddepartment" TagPrefix="uc8" %>
<%@ Register Src="admincontrols/addstudent.ascx" TagName="addstudent" TagPrefix="uc9" %>
<%@ Register Src="admincontrols/addstudentsubject.ascx" TagName="addstudentsubject"
    TagPrefix="uc10" %>
<%@ Register Src="admincontrols/addsubject.ascx" TagName="addsubject" TagPrefix="uc11" %>
<%@ Register Src="admincontrols/addteacher.ascx" TagName="addteacher" TagPrefix="uc12" %>
<%@ Register Src="admincontrols/addteachersubject.ascx" TagName="addteachersubject"
    TagPrefix="uc13" %>
<%@ Register Src="admincontrols/updateadvertising.ascx" TagName="updateadvertising"
    TagPrefix="uc14" %>
<%@ Register Src="admincontrols/updateclupsubject.ascx" TagName="updateclupsubject"
    TagPrefix="uc15" %>
<%@ Register Src="admincontrols/updatedepartment.ascx" TagName="updatedepartment"
    TagPrefix="uc16" %>
<%@ Register Src="admincontrols/updatestudent.ascx" TagName="updatestudent" TagPrefix="uc17" %>
<%@ Register Src="admincontrols/updatesubject.ascx" TagName="updatesubject" TagPrefix="uc18" %>
<%@ Register Src="admincontrols/updateteacher.ascx" TagName="updateteacher" TagPrefix="uc19" %>


<%@ Register Src="usercontrols/header2.ascx" TagName="header2" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/advertising.ascx" TagName="advertising" TagPrefix="uc4" %>
<%@ Register Src="usercontrols/footer.ascx" TagName="footer" TagPrefix="uc5" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
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
                        &nbsp;<uc2:header2 ID="Header2_1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center">
                        &nbsp;
                        <uc4:advertising ID="Advertising1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td style="width: 10px; text-align: left">
                        &nbsp;
                        <table>
                            <tr>
                                <td style="width: 100px; height: 16px">
                                    <uc24:welcom ID="Welcom1" runat="server" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px; height: 16px">
                                    <asp:Button ID="Button17" runat="server" OnClick="Button17_Click" Text="home page" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="add advertising" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="update advertising" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="add department" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="update department" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="add subject" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px; height: 24px">
                                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="update subject" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="add student" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="update student" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="add teacher" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="update teacher" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="add subject to student" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="update student's subject" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button14" runat="server" OnClick="Button14_Click" Text="add subject to teacher " /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button15" runat="server" OnClick="Button15_Click" Text="update teacher's subject" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button16" runat="server" OnClick="Button16_Click" Text="chang password" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button18" runat="server" OnClick="Button18_Click" Text="clup subjects managing" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button19" runat="server" OnClick="Button19_Click" Text="active club's replies" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button20" runat="server" OnClick="Button20_Click" Text="chang teacher password" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button21" runat="server" OnClick="Button21_Click" Text="chang student password" /></td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                    <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="log out" /></td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 100px">
                                    &nbsp;<uc21:advertisingcontent ID="Advertisingcontent1" runat="server" Visible="true" />
                                    <uc6:activeteachersubject ID="Activeteachersubject1" runat="server" Visible="false" />
                                    <uc3:activestudentsubject ID="Activestudentsubject1" runat="server" Visible="false" />
                                    <uc1:addadvertising ID="Addadvertising1" runat="server" Visible="false" />
                                    <uc7:addclupsubject ID="Addclupsubject1" runat="server" Visible="false" />
                                    <uc8:adddepartment ID="Adddepartment1" runat="server" Visible="false" />
                                    <uc9:addstudent ID="Addstudent1" runat="server" Visible="false" />
                                    <uc10:addstudentsubject ID="Addstudentsubject1" runat="server" Visible="false" />
                                    &nbsp;
                                    <uc11:addsubject ID="Addsubject1" runat="server" Visible="false" />
                                    &nbsp;
                                    <uc12:addteacher ID="Addteacher1" runat="server" Visible="false" />
                        <uc26:changstudentpass ID="Changstudentpass1" runat="server" Visible="false" />
                        <uc22:clupsubject ID="Clupsubject1" runat="server" Visible="false" />
                                    <uc13:addteachersubject ID="Addteachersubject1" runat="server" Visible="false" />
                                    <uc14:updateadvertising ID="Updateadvertising1" runat="server" Visible="false" />
                                    <uc15:updateclupsubject ID="Updateclupsubject1" runat="server" Visible="false" />
                                    <uc16:updatedepartment ID="Updatedepartment1" runat="server" Visible="false" />
                                    <uc17:updatestudent ID="Updatestudent1" runat="server" Visible="false" />
                                    <uc18:updatesubject ID="Updatesubject1" runat="server" Visible="false" />
                                    &nbsp;
                                    <uc20:changpass ID="Changpass1" runat="server" Visible="false" />
                        <uc25:changteacherpass ID="Changteacherpass1" runat="server" Visible="false" />
                        <uc23:activereplay ID="Activereplay1" runat="server" Visible="false" />
                                    <uc19:updateteacher ID="Updateteacher1" runat="server" Visible="false" />
                    </td>
                </tr>
                <tr>
                    <td colspan="2" style="text-align: center; height: 48px;">
                        &nbsp;
                        <uc5:footer ID="Footer1" runat="server" />
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
