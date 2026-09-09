<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Admin.aspx.cs" Inherits="Admin" %>































































<%@ Register src="usercontrol/ViewCourses.ascx" tagname="ViewCourses" tagprefix="uc2" %>































<%@ Register src="usercontrol/ViewPrograms.ascx" tagname="ViewPrograms" tagprefix="uc3" %>































<%@ Register src="usercontrol/VewRegisterd.ascx" tagname="VewRegisterd" tagprefix="uc4" %>































<%@ Register src="usercontrol/AddProgram.ascx" tagname="AddProgram" tagprefix="uc5" %>































<%@ Register src="usercontrol/AddCourse.ascx" tagname="AddCourse" tagprefix="uc1" %>































<%@ Register src="usercontrol/LogIn.ascx" tagname="LogIn" tagprefix="uc6" %>































<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin</title>
    <style type="text/css">
        #form1
        {
           height: 100%;
            width: 100%;
            margin-left:10%;
            margin-top:5%;
            margin-right:5%;
            
        }
        #form2
        {
            height: 125px;
            width: 223px;
        }
        .style1
        {
            width: 76%;
            height: 100%;
        }
        .style10
        {
            width: 0%;
        }
        .style12
        {
            width: 156px;
            height: 78px;
        }
        .style13
        {
            width: 428px;
            height: 78px;
        }
        .style14
        {
            width: 156px;
        }
        .style15
        {
            width: 301px;
            height: 78px;
        }
        .style16
        {
            width: 301px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server" method="post"   >
   
                <asp:Image ID="Image1" runat="server" Height="142px" ImageUrl="~/data/Head.jpg" 
                    Width="75%" />
   
    <table class="style1" frame="above">
        <tr>
            <td class="style12" valign="middle">
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <asp:Label ID="Label1" runat="server" Font-Size="Larger" ForeColor="Red"></asp:Label>
                <br />
                <br />
                <asp:Button ID="Button1" runat="server" onclick="Button1_Click" 
                    Text="Log_Out" />
            </td>
            <td class="style15">
                </td>
            <td class="style13">
                </td>
        </tr>
        <tr>
            <td class="style14" valign="top" height="30%">
                <asp:TreeView ID="TreeView1" runat="server" Height="467px" 
                    onselectednodechanged="TreeView1_SelectedNodeChanged" ImageSet="Arrows" 
                    LineImagesFolder="~/TreeLineImages" ExpandDepth="0">
                    <ParentNodeStyle Font-Bold="False" />
                    <HoverNodeStyle Font-Underline="True" ForeColor="#5555DD" />
                    <SelectedNodeStyle Font-Underline="True" ForeColor="#5555DD" 
                        HorizontalPadding="0px" VerticalPadding="0px" />
                    <Nodes>
                        <asp:TreeNode Text="Program" Value="Program" SelectAction="Expand">
                            <asp:TreeNode Text="Add New Program" Value="Add New Program"></asp:TreeNode>
                            <asp:TreeNode Text="View All Programs" Value="View All Programs"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Course" Value="Course" SelectAction="Expand">
                            <asp:TreeNode Text="Add Course" Value="Add Course"></asp:TreeNode>
                            <asp:TreeNode Text="View Courses" Value="View Courses"></asp:TreeNode>
                        </asp:TreeNode>
                        <asp:TreeNode Text="Registered Student" Value="Registered Student" 
                            SelectAction="Expand">
                            <asp:TreeNode Text="View Registered Student" Value="View Registered Student">
                            </asp:TreeNode>
                        </asp:TreeNode>
                    </Nodes>
                    <NodeStyle Font-Names="Verdana" Font-Size="8pt" ForeColor="Black" 
                        HorizontalPadding="5px" NodeSpacing="0px" VerticalPadding="0px" />
                </asp:TreeView>
            </td>
            <td valign="top" class="style16" height="30%">
              
                <br />
            </td>
            <td valign="top" class="style10" height="30%" width ="100%" style="width: 50%">
              
                <uc1:AddCourse ID="AddCourse1" runat="server" Visible="False" />
                <uc5:AddProgram ID="AddProgram1" runat="server" Visible="False" />
                <uc2:ViewCourses ID="ViewCourses1" runat="server" Visible="False" />
                <uc3:ViewPrograms ID="ViewPrograms2" runat="server" Visible="False" />
                <uc4:VewRegisterd ID="VewRegisterd1" runat="server" Visible="False" />
            </td>
        </tr>
        </table>
   
    </form>
    
    </body>
</html>
