<%@ Page Language="C#" AutoEventWireup="true" CodeFile="teacher.aspx.cs" Inherits="teacher" %>

<%@ Register Src="usercontrols/welcom.ascx" TagName="welcom" TagPrefix="uc17" %>

<%@ Register Src="teacheruserconrol/activeexam.ascx" TagName="activeexam" TagPrefix="uc15" %>
<%@ Register Src="teacheruserconrol/activeexamform.ascx" TagName="activeexamform"
    TagPrefix="uc16" %>

<%@ Register Src="admincontrols/addadvertising.ascx" TagName="addadvertising" TagPrefix="uc14" %>

<%@ Register Src="usercontrols/advertisingcontent.ascx" TagName="advertisingcontent"
    TagPrefix="uc13" %>

<%@ Register Src="admincontrols/changpass.ascx" TagName="changpass" TagPrefix="uc12" %>

<%@ Register Src="teacheruserconrol/correctansewr.ascx" TagName="correctansewr" TagPrefix="uc9" %>
<%@ Register Src="teacheruserconrol/studentmarks.ascx" TagName="studentmarks" TagPrefix="uc10" %>
<%@ Register Src="teacheruserconrol/addlesson.ascx" TagName="addlesson" TagPrefix="uc11" %>

<%@ Register Src="teacheruserconrol/addformquastion.ascx" TagName="addformquastion"
    TagPrefix="uc8" %>

<%@ Register Src="teacheruserconrol/addexamform.ascx" TagName="addexamform" TagPrefix="uc6" %>
<%@ Register Src="teacheruserconrol/addquastion.ascx" TagName="addquastion" TagPrefix="uc7" %>

<%@ Register Src="teacheruserconrol/addexam.ascx" TagName="addexam" TagPrefix="uc5" %>

<%@ Register Src="usercontrols/header2.ascx" TagName="header2" TagPrefix="uc1" %>
<%@ Register Src="usercontrols/login.ascx" TagName="login" TagPrefix="uc2" %>
<%@ Register Src="usercontrols/advertising.ascx" TagName="advertising" TagPrefix="uc3" %>
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
                        <uc3:advertising ID="Advertising1" runat="server" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="2" style="width: 10px; text-align: left">
                        &nbsp;&nbsp;
                        <table>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <uc17:welcom ID="Welcom1" runat="server" />
                                </td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button10" runat="server" OnClick="Button10_Click" Text="home page" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button11" runat="server" OnClick="Button11_Click" Text="add advertising" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="add exam" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button3" runat="server" OnClick="Button3_Click" Text="add exam form" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="add quastion" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button5" runat="server" OnClick="Button5_Click" Text="add form's quastion" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button12" runat="server" OnClick="Button12_Click" Text="active exam" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button13" runat="server" OnClick="Button13_Click" Text="active exam form" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button6" runat="server" OnClick="Button6_Click" Text="correct answers" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button7" runat="server" OnClick="Button7_Click" Text="show students marks" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button8" runat="server" OnClick="Button8_Click" Text="add lesson" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button9" runat="server" OnClick="Button9_Click" Text="chang password" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100px">
                                </td>
                                <td style="width: 100px">
                                    <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="log out" /></td>
                                <td style="width: 100px">
                                </td>
                            </tr>
                        </table>
                    </td>
                    <td style="width: 100px; text-align: left;" dir="ltr" rowspan="3">
                        <uc13:advertisingcontent ID="Advertisingcontent1" runat="server" Visible="true" />
                                    <uc6:addexamform ID="Addexamform1" runat="server" Visible="false" />
                                    &nbsp;
                                    <uc5:addexam ID="Addexam1" runat="server" Visible="false" />
                                    <uc14:addadvertising ID="Addadvertising1" runat="server" Visible="false" />
                                    <uc16:activeexamform ID="Activeexamform1" runat="server" Visible="false" />
                                    <uc15:activeexam ID="Activeexam1" runat="server" Visible="false" />
                                    <uc7:addquastion ID="Addquastion1" runat="server" Visible="false" />
                        <uc8:addformquastion ID="Addformquastion1" runat="server" Visible="false" />
                        <uc11:addlesson ID="Addlesson1" runat="server" Visible="false" />
                        <uc10:studentmarks ID="Studentmarks1" runat="server" Visible="false" />
                        <uc12:changpass ID="Changpass1" runat="server" Visible="false" />
                        <uc9:correctansewr ID="Correctansewr1" runat="server" Visible="false" />
                        &nbsp; &nbsp; &nbsp;&nbsp;&nbsp; &nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                </tr>
            </table>
        </div>
    
    </div>
    </form>
</body>
</html>
