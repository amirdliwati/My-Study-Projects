<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VewRegisterd.ascx.cs" Inherits="usercontrol_VewRegisterd" %>
<style type="text/css">
    .style1
    {
        width: 100%;
    }
    .style2
    {
    }
    .style3
    {
        width: 153px;
    }
</style>
<table class="style1">
    <tr>
        <td class="style3">
            <asp:Label ID="Label1" runat="server" Text="Program Name"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="pro_n" 
                DataValueField="pro_id" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                SelectCommand="SELECT [pro_id], [pro_n] FROM [program]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="style3">
            <asp:Label ID="Label2" runat="server" Text="Course Name"></asp:Label>
        </td>
        <td>
            <asp:DropDownList ID="DropDownList2" runat="server" AutoPostBack="True" 
                DataSourceID="SqlDataSource2" DataTextField="c_name" DataValueField="c_id" 
                Height="16px">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                SelectCommand="SELECT [c_name], [c_id] FROM [course] WHERE ([pro_id] = @pro_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="pro_id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <asp:GridView ID="GridView1" runat="server" DataSourceID="SqlDataSource3" 
                AutoGenerateColumns="False" Height="163px" Width="391px">
                <Columns>
                    <asp:BoundField DataField="full_n" HeaderText="Full Name" 
                        SortExpression="full_n" >
                        <ControlStyle BorderStyle="Dotted" />
                        <FooterStyle BackColor="#CC0000" />
                        <HeaderStyle BackColor="Blue" />
                    </asp:BoundField>
                    <asp:BoundField DataField="user_n" HeaderText="User Name" 
                        SortExpression="user_n" >
                        <FooterStyle BackColor="#0066FF" />
                        <HeaderStyle BackColor="Blue" />
                    </asp:BoundField>
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource3" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                
                SelectCommand="select  register.full_n , register.user_n  from register , student_course where (register.id_s = student_course.id_s) and (student_course.c_id = @c_id)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList2" Name="c_id" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
