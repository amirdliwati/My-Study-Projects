<%@ Page Language="C#" AutoEventWireup="true"  CodeFile="Home.aspx.cs" Inherits="_Default" %>



<%@ Register src="usercontrol/login.ascx" tagname="login" tagprefix="uc1" %>
<%@ Register src="usercontrol/Register.ascx" tagname="Register" tagprefix="uc2" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Home</title>
    <style type="text/css">
        #form1
        {
            height: 100%;
            width: 100%;
            margin-left:10%;
            margin-top:5%;
            margin-right:5%;
        }
        .style1
        {
            width: 100%;
        }
        .style27
        {
            width: 378px;
        }
        .style59
        {
            width: 43px;
        }
        .style60
        {
            height: 356px;
        }
        .style61
        {
            width: 43px;
            height: 356px;
        }
        .style62
        {
            width: 114px;
            height: 356px;
        }
        </style>
</head>
<body>
    <form id="form1" runat="server" method="post" submitdisabledcontrols="False" 
    visible="True">
    <img alt="" longdesc="file:///C:/Users/eternal/Desktop/mine/data/Head.jpg" 
        src="data/Head.jpg" style="width: 70%; height: 142px" /><br />
    &nbsp;<table class="style1">
        <tr>
            <td class="style60">
                <uc1:login ID="login1" runat="server" />
            </td>
            <td class="style61">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                &nbsp;</td>
                
                
            <td class="style62">
                <uc2:Register ID="Register1" runat="server" Visible="False" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:LinkButton ID="LinkButton1" runat="server" onclick="LinkButton1_Click">A 
                New Student Registration</asp:LinkButton>
            </td>
            <td class="style59">
                &nbsp;</td>
                
                
            <td class="style27">
                &nbsp;&nbsp;
            </td>
        </tr>
    </table>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    <asp:Image ID="Image1" runat="server" Height="102px" ImageAlign="Baseline" 
        ImageUrl="~/data/Home.jpg" Width="597px" />
    <br />
    <br />
    </form>
</body>
</html>
