<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Student.aspx.cs" Inherits="Student" %>


<%@ Register src="usercontrol/LogIn.ascx" tagname="LogIn" tagprefix="uc1" %>


<%@ Register src="usercontrol/ViewCourses.ascx" tagname="ViewCourses" tagprefix="uc2" %>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student</title>
    <style type="text/css">
        #form1
        {
            height: 782px;
            width: 88%;
            margin-left:10%;
            margin-top:5%;
            margin-right:5%;
        }
        .style1
        {
            width: 79%;
            height: 100%;
        }
        .style2
        {
            width: 590px;
        }
        .style3
        {
            height: 242px;
        }
        .style4
        {
            width: 590px;
            height: 242px;
        }
        .style5
        {
            height: 19px;
        }
        .style6
        {
            width: 590px;
            height: 19px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <table class="style1">
        <tr>
            <td colspan="2">
                <asp:Image ID="Image1" runat="server" Height="142px" ImageUrl="~/data/Head.jpg" 
                    Width="70%" />
            </td>
        </tr>
        <tr>
            <td>
                <asp:Label ID="Label2" runat="server" Text="Label"></asp:Label>
                <asp:Label ID="Label3" runat="server" Visible="False"></asp:Label>
                <br />
                <br />
                <br />
                <asp:Button ID="Button2" runat="server" onclick="Button2_Click" 
                    Text="Log_Out" />
                <br />
            </td>
            <td class="style2">
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                    
                    
                    
                    SelectCommand="SELECT course.c_id, course.code, course.c_name, course.price, course.m_n, course.n_c FROM course INNER JOIN program ON course.pro_id = program.pro_id INNER JOIN register ON program.pro_id = register.pro_id WHERE (course.[open] &lt;&gt; @open ) and (course.n_c &lt; course.m_n) AND (register.id_s = @id_s)">
                    <SelectParameters>
                        <asp:Parameter DefaultValue="0" Name="open" Type="String" />
                        <asp:ControlParameter ControlID="Label3" DefaultValue="" Name="id_s" 
                            PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource1" Width="520px" 
                    Height="258px" onselectedindexchanged="GridView1_SelectedIndexChanged" 
                    SelectedIndex="0" DataKeyNames="c_id">
                    <Columns>
                        <asp:BoundField DataField="c_name" HeaderText="Course Name" 
                            SortExpression="c_name" >
                        </asp:BoundField>
                        <asp:BoundField DataField="code" HeaderText="code" 
                            SortExpression="code" >
                        </asp:BoundField>
                        <asp:BoundField DataField="m_n" HeaderText="Max Student Number" 
                            SortExpression="m_n" >
                        </asp:BoundField>
                        <asp:BoundField DataField="n_c" HeaderText="Number Of Student Registerd" 
                            SortExpression="n_c" />
                        <asp:BoundField DataField="price" HeaderText="price" 
                            SortExpression="price" >
                        </asp:BoundField>
                        <asp:CommandField SelectText="Register Now" ShowSelectButton="True" />
                        <asp:BoundField DataField="c_id" HeaderText="c_id" InsertVisible="False" 
                            ReadOnly="True" SortExpression="c_id" Visible="False" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Label ID="Label1" runat="server" ForeColor="Red"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="style3">
            </td>
            <td class="style4">
                <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                    ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                    
                    SelectCommand="SELECT course.c_id, course.c_name, course.price FROM course INNER JOIN student_course ON course.c_id = student_course.c_id WHERE (student_course.id_s = @id_s)">
                    <SelectParameters>
                        <asp:ControlParameter ControlID="Label3" Name="id_s" PropertyName="Text" />
                    </SelectParameters>
                </asp:SqlDataSource>
                <asp:GridView ID="GridView2" runat="server" AutoGenerateColumns="False" 
                    DataSourceID="SqlDataSource2" Width="358px" DataKeyNames="c_id" 
                    onselectedindexchanged="GridView2_SelectedIndexChanged">
                    <Columns>
                        <asp:BoundField DataField="c_id" HeaderText="c_id" SortExpression="c_id" 
                            ReadOnly="True" Visible="False" />
                        <asp:BoundField DataField="c_name" HeaderText="Course Name" 
                            SortExpression="c_name" />
                        <asp:BoundField DataField="price" HeaderText="price" SortExpression="price" />
                        <asp:CommandField SelectText="Delete" ShowSelectButton="True" />
                    </Columns>
                </asp:GridView>
                <br />
                <asp:Button ID="Button1" runat="server" Text="Register" 
                    onclick="Button1_Click" />
            </td>
        </tr>
        </table>
    </form>
</body>
</html>
