<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ViewCourses.ascx.cs" Inherits="usercontrol_ViewCourses" %>
<style type="text/css">
    .style1
    {
        width: 88%;
        height: 270px;
    }
    .style2
    {
    }
    .style3
    {
        width: 133px;
        height: 86px;
    }
    .style4
    {
        height: 86px;
    }
</style>
<table class="style1">
    <tr>
        <td class="style3">
            <asp:Label ID="Label1" runat="server" Text="Program Name"></asp:Label>
        </td>
        <td class="style4">
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="SqlDataSource1" DataTextField="pro_n" 
                DataValueField="pro_id" AutoPostBack="True">
            </asp:DropDownList>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                SelectCommand="SELECT [pro_n], [pro_id] FROM [program]"></asp:SqlDataSource>
        </td>
    </tr>
    <tr>
        <td class="style2" colspan="2">
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" 
                AutoGenerateColumns="False" DataKeyNames="c_id" DataSourceID="SqlDataSource2" 
                Height="141px" PageSize="4" Width="824px">
                <Columns>
                    <asp:TemplateField ShowHeader="False">
                        <EditItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" 
                                CommandName="Update" Text="Update"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Cancel" Text="Cancel"></asp:LinkButton>
                        </EditItemTemplate>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Edit" Text="Edit"></asp:LinkButton>
                            &nbsp;<asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" 
                                CommandName="Delete" onclientclick="return confirm(&quot;هل تريد الحذف؟&quot;)" 
                                Text="Delete"></asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="c_id" HeaderText="Course ID" InsertVisible="False" 
                        ReadOnly="True" SortExpression="c_id" />
                    <asp:BoundField DataField="pro_id" HeaderText="Program ID" 
                        SortExpression="pro_id" />
                    <asp:BoundField DataField="sem" HeaderText="Semester" SortExpression="sem" />
                    <asp:BoundField DataField="code" HeaderText="Code" SortExpression="code" />
                    <asp:BoundField DataField="c_name" HeaderText="Course Name" 
                        SortExpression="c_name" />
                    <asp:BoundField DataField="n_session" HeaderText="Num of Session" 
                        SortExpression="n_session" />
                    <asp:BoundField DataField="price" HeaderText="Price" SortExpression="price" />
                    <asp:BoundField DataField="m_n" HeaderText="Max Num Stud" 
                        SortExpression="m_n" />
                    <asp:BoundField DataField="n_c" HeaderText="Stud Count" SortExpression="n_c" />
                    <asp:BoundField DataField="open" HeaderText="Open" SortExpression="open" />
                </Columns>
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource2" runat="server" 
                ConnectionString="<%$ ConnectionStrings:connectionString %>" 
                DeleteCommand="DELETE FROM [course] WHERE [c_id] = @c_id" 
                InsertCommand="INSERT INTO [course] ([pro_id], [sem], [code], [c_name], [n_session], [price], [m_n], [n_c], [open]) VALUES (@pro_id, @sem, @code, @c_name, @n_session, @price, @m_n, @n_c, @open)" 
                SelectCommand="SELECT * FROM [course] WHERE ([pro_id] = @pro_id)" 
                UpdateCommand="UPDATE [course] SET [pro_id] = @pro_id, [sem] = @sem, [code] = @code, [c_name] = @c_name, [n_session] = @n_session, [price] = @price, [m_n] = @m_n, [n_c] = @n_c, [open] = @open WHERE [c_id] = @c_id">
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList1" Name="pro_id" 
                        PropertyName="SelectedValue" Type="Int32" />
                </SelectParameters>
                <DeleteParameters>
                    <asp:Parameter Name="c_id" Type="Int32" />
                </DeleteParameters>
                <UpdateParameters>
                    <asp:Parameter Name="pro_id" Type="Int32" />
                    <asp:Parameter Name="sem" Type="String" />
                    <asp:Parameter Name="code" Type="String" />
                    <asp:Parameter Name="c_name" Type="String" />
                    <asp:Parameter Name="n_session" Type="Int32" />
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter Name="m_n" Type="Int32" />
                    <asp:Parameter Name="n_c" Type="Int32" />
                    <asp:Parameter Name="open" Type="String" />
                    <asp:Parameter Name="c_id" Type="Int32" />
                </UpdateParameters>
                <InsertParameters>
                    <asp:Parameter Name="pro_id" Type="Int32" />
                    <asp:Parameter Name="sem" Type="String" />
                    <asp:Parameter Name="code" Type="String" />
                    <asp:Parameter Name="c_name" Type="String" />
                    <asp:Parameter Name="n_session" Type="Int32" />
                    <asp:Parameter Name="price" Type="Int32" />
                    <asp:Parameter Name="m_n" Type="Int32" />
                    <asp:Parameter Name="n_c" Type="Int32" />
                    <asp:Parameter Name="open" Type="String" />
                </InsertParameters>
            </asp:SqlDataSource>
        </td>
    </tr>
</table>
