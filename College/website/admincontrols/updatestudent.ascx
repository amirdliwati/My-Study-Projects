<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updatestudent.ascx.cs" Inherits="admincontrols_addsubjectstudent" %>
&nbsp;<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT student.sid, student.coid, student.fname, student.lname, student.username, student.pass, student.sex, student.birthdate, student.email, student.phon, student.active, dept.dname, student.did FROM student INNER JOIN dept ON student.did = dept.did order by coid"
    UpdateCommand="UPDATE student SET coid = @coid, fname = @fname, lname = @lname, username = @username, sex = @sex, birthdate = @birthdate, email = @email, phon = @phon, active = @active, did = @did WHERE (sid = @sid)">
    <UpdateParameters>
        <asp:Parameter Name="coid" />
        <asp:Parameter Name="fname" />
        <asp:Parameter Name="lname" />
        <asp:Parameter Name="username" />
        <asp:Parameter Name="sex" />
        <asp:Parameter Name="birthdate" />
        <asp:Parameter Name="email" />
        <asp:Parameter Name="phon" />
        <asp:Parameter Name="active" />
        <asp:Parameter Name="did" />
        <asp:Parameter Name="sid" />
    </UpdateParameters>
</asp:SqlDataSource>
&nbsp;
<br />
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="sid"
    DataSourceID="SqlDataSource1" AllowPaging="True" PageSize="5" Width="707px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("do you want to update")' Text="Update" ValidationGroup="upst"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="colleg id" SortExpression="coid">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("coid") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                                Display="Dynamic" ErrorMessage="enter colleg id" ValidationGroup="upst">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                    ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox1"
                                    Display="Dynamic" ErrorMessage="invalid colleg id" ValidationExpression="\d\d\d\d\d\d?\d?"
                                    ValidationGroup="upst">*</asp:RegularExpressionValidator><asp:CustomValidator ID="CustomValidator1"
                                        runat="server" ControlToValidate="TextBox1" Display="Dynamic" ErrorMessage="colleg id is exist try another one"
                                        OnServerValidate="CustomValidator1_ServerValidate" ValidationGroup="upst">*</asp:CustomValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("coid") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="first name" SortExpression="fname">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                                Display="Dynamic" ErrorMessage="enter first name" ValidationGroup="upst">*</asp:RequiredFieldValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="lname name" SortExpression="lname">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                                Display="Dynamic" ErrorMessage="enter last name" ValidationGroup="upst">*</asp:RequiredFieldValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("lname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="user name" SortExpression="username">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox4" runat="server" Text='<%# Bind("username") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="TextBox4"
                                Display="Dynamic" ErrorMessage="enter user name" ValidationGroup="upst">*</asp:RequiredFieldValidator><asp:CustomValidator
                                    ID="CustomValidator2" runat="server" ControlToValidate="TextBox4" Display="Dynamic"
                                    ErrorMessage="user name is exist try another one" OnServerValidate="CustomValidator2_ServerValidate"
                                    ValidationGroup="upst">*</asp:CustomValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("username") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="sex" SortExpression="sex">
            <EditItemTemplate>
                <table style="width: 150px; height: 29px">
                    <tr>
                        <td style="width: 134px">
                            <asp:ListBox ID="sex" runat="server" Rows="1" SelectedValue='<%# Bind("sex") %>'>
                                <asp:ListItem>male</asp:ListItem>
                                <asp:ListItem>female</asp:ListItem>
                            </asp:ListBox></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("sex") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="birth date" SortExpression="birthdate">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("birthdate", "{0:d}") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox6"
                                Display="Dynamic" ErrorMessage="enter birth date" ValidationGroup="upst">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                    ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6"
                                    Display="Dynamic" ErrorMessage="invalid birth date" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                                    ValidationGroup="upst">*</asp:RegularExpressionValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Bind("birthdate", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="email" SortExpression="email">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("email") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox7"
                                Display="Dynamic" ErrorMessage="enter email" ValidationGroup="upst">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                    ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox7"
                                    Display="Dynamic" ErrorMessage="invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                    ValidationGroup="upst">*</asp:RegularExpressionValidator><asp:CustomValidator ID="CustomValidator3"
                                        runat="server" ControlToValidate="TextBox7" Display="Dynamic" ErrorMessage="email adress is exist try another one"
                                        OnServerValidate="CustomValidator3_ServerValidate" ValidationGroup="upst">*</asp:CustomValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%# Bind("email") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="phon" SortExpression="phon">
            <EditItemTemplate>
                <table>
                    <tr>
                        <td style="width: 100px">
                            <asp:TextBox ID="TextBox8" runat="server" Text='<%# Bind("phon") %>'></asp:TextBox></td>
                        <td style="width: 100px">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox8"
                                Display="Dynamic" ErrorMessage="enter phon number" ValidationGroup="upst">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                                    ID="RegularExpressionValidator4" runat="server" ControlToValidate="TextBox8"
                                    Display="Dynamic" ErrorMessage="invalid phon number" ValidationExpression="\d{10}"
                                    ValidationGroup="upst">*</asp:RegularExpressionValidator><asp:CustomValidator ID="CustomValidator4"
                                        runat="server" ControlToValidate="TextBox8" Display="Dynamic" ErrorMessage="phon number is exist"
                                        OnServerValidate="CustomValidator4_ServerValidate" ValidationGroup="upst">*</asp:CustomValidator></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%# Bind("phon") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="active" SortExpression="active">
            <EditItemTemplate>
                <table style="width: 148px; height: 29px">
                    <tr>
                        <td style="width: 88px; height: 26px">
                            <asp:ListBox ID="active" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                                <asp:ListItem>active</asp:ListItem>
                                <asp:ListItem>not active</asp:ListItem>
                            </asp:ListBox></td>
                    </tr>
                </table>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label9" runat="server" Text='<%# Bind("active") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="department" SortExpression="dname">
            <EditItemTemplate>
                <asp:ListBox ID="dept" runat="server" DataSourceID="SqlDataSource1" DataTextField="dname"
                    DataValueField="did" Rows="1" SelectedValue='<%# Bind("did") %>'></asp:ListBox>
                <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT [did], [dname] FROM [dept] ORDER BY [dname]"></asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label10" runat="server" Text='<%# Bind("dname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
