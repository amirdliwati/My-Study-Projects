<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addstudent.ascx.cs" Inherits="admincontrols_addstudent" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO student(coid, fname, lname, username, pass, sex, birthdate, email, phon, active, did) VALUES (@coid, @fname, @lname, @username, @pass, @sex, @birthdate, @email, @phon, @active, @did)"
    SelectCommand="SELECT student.sid, student.coid, student.fname, student.lname, student.username, student.pass, student.sex, student.birthdate, student.email, student.phon, student.active, dept.dname, student.did FROM student INNER JOIN dept ON student.did = dept.did"
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
    <InsertParameters>
        <asp:Parameter Name="coid" />
        <asp:Parameter Name="fname" />
        <asp:Parameter Name="lname" />
        <asp:Parameter Name="username" />
        <asp:Parameter Name="pass" />
        <asp:Parameter Name="sex" />
        <asp:Parameter Name="birthdate" />
        <asp:Parameter Name="email" />
        <asp:Parameter Name="phon" />
        <asp:Parameter Name="active" />
        <asp:Parameter Name="did" />
    </InsertParameters>
</asp:SqlDataSource>
<asp:FormView ID="FormView1" runat="server" DataKeyNames="sid" DataSourceID="SqlDataSource1"
    DefaultMode="Insert">
    <EditItemTemplate>
        sid:
        <asp:Label ID="sidLabel1" runat="server" Text='<%# Eval("sid") %>'></asp:Label><br />
        coid:
        <asp:TextBox ID="coidTextBox" runat="server" Text='<%# Bind("coid") %>'>
        </asp:TextBox><br />
        fname:
        <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>'>
        </asp:TextBox><br />
        lname:
        <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>'>
        </asp:TextBox><br />
        username:
        <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>'>
        </asp:TextBox><br />
        pass:
        <asp:TextBox ID="passTextBox" runat="server" Text='<%# Bind("pass") %>'>
        </asp:TextBox><br />
        sex:
        <asp:TextBox ID="sexTextBox" runat="server" Text='<%# Bind("sex") %>'>
        </asp:TextBox><br />
        birthdate:
        <asp:TextBox ID="birthdateTextBox" runat="server" Text='<%# Bind("birthdate") %>'>
        </asp:TextBox><br />
        email:
        <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'>
        </asp:TextBox><br />
        phon:
        <asp:TextBox ID="phonTextBox" runat="server" Text='<%# Bind("phon") %>'>
        </asp:TextBox><br />
        active:
        <asp:TextBox ID="activeTextBox" runat="server" Text='<%# Bind("active") %>'>
        </asp:TextBox><br />
        did:
        <asp:TextBox ID="didTextBox" runat="server" Text='<%# Bind("did") %>'>
        </asp:TextBox><br />
        dname:
        <asp:TextBox ID="dnameTextBox" runat="server" Text='<%# Bind("dname") %>'>
        </asp:TextBox><br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="Update">
        </asp:LinkButton>
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel">
        </asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        <table style="width: 406px">
            <tr>
                <td style="width: 139px">
                    colleg id:
                </td>
                <td style="width: 108px">
                    <asp:TextBox ID="coidTextBox" runat="server" Text='<%# Bind("coid") %>'></asp:TextBox></td>
                <td style="width: 89px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="coidTextBox"
                        Display="Dynamic" ErrorMessage="enter colleg id" ValidationGroup="addst">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="coidTextBox"
                        Display="Dynamic" ErrorMessage="invalid colleg id" ValidationExpression="\d\d\d\d\d\d?\d?"
                        ValidationGroup="addst">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="coidTextBox"
                        Display="Dynamic" ErrorMessage="colleg id is exist try another one" OnServerValidate="CustomValidator1_ServerValidate"
                        ValidationGroup="addst">*</asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 139px">
                    first name</td>
                <td style="width: 108px">
                    <asp:TextBox ID="fnameTextBox" runat="server" OnTextChanged="fnameTextBox_TextChanged"
                        Text='<%# Bind("fname") %>'></asp:TextBox></td>
                <td style="width: 89px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="fnameTextBox"
                        Display="Dynamic" ErrorMessage="enter first name" ValidationGroup="addst">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 139px">
                    last name</td>
                <td style="width: 108px">
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox></td>
                <td style="width: 89px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="lnameTextBox"
                        Display="Dynamic" ErrorMessage="enter last name" ValidationGroup="addst">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 139px">
                    user name</td>
                <td style="width: 108px">
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>'></asp:TextBox></td>
                <td style="width: 89px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server" ControlToValidate="usernameTextBox"
                        Display="Dynamic" ErrorMessage="enter user name" ValidationGroup="addst">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="usernameTextBox"
                        Display="Dynamic" ErrorMessage="user name is exist try another one" OnServerValidate="CustomValidator2_ServerValidate"
                        ValidationGroup="addst">*</asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 139px">
                    password</td>
                <td style="width: 108px">
                    <asp:TextBox ID="passTextBox" runat="server" Text='<%# Bind("pass") %>' TextMode="Password"></asp:TextBox></td>
                <td style="width: 89px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="passTextBox"
                        Display="Dynamic" ErrorMessage="enter password" ValidationGroup="addst">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="conpass"
                        ControlToValidate="passTextBox" Display="Dynamic" ErrorMessage="confirm password not matched with password"
                        ValueToCompare="addst">*</asp:CompareValidator></td>
            </tr>
            <tr>
                <td style="width: 139px">
                    confirm password</td>
                <td style="width: 108px">
                    <asp:TextBox ID="conpass" runat="server" TextMode="Password"></asp:TextBox></td>
                <td style="width: 89px">
                </td>
            </tr>
            <tr>
                <td style="width: 139px">
                    sex</td>
                <td style="width: 108px">
                    <asp:ListBox ID="sex" runat="server" Rows="1" SelectedValue='<%# Bind("sex") %>'>
                        <asp:ListItem Selected="True">male</asp:ListItem>
                        <asp:ListItem>female</asp:ListItem>
                    </asp:ListBox></td>
                <td style="width: 89px">
                </td>
            </tr>
            <tr>
                <td style="width: 139px; height: 26px">
                    birthdate</td>
                <td style="width: 108px; height: 26px">
                    <asp:TextBox ID="birthdateTextBox" runat="server" Text='<%# Bind("birthdate") %>'></asp:TextBox></td>
                <td style="width: 89px; height: 26px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="birthdateTextBox"
                        Display="Dynamic" ErrorMessage="enter birth date" ValidationGroup="addst">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="birthdateTextBox"
                        Display="Dynamic" ErrorMessage="invalid birth date" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                        ValidationGroup="addst">*</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width: 139px">
                    email</td>
                <td style="width: 108px">
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'></asp:TextBox></td>
                <td style="width: 89px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="emailTextBox"
                        Display="Dynamic" ErrorMessage="enter email" ValidationGroup="addst">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="emailTextBox"
                        Display="Dynamic" ErrorMessage="invalid email adress" ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="addst">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="emailTextBox"
                        Display="Dynamic" ErrorMessage="email adress is exist try another one" OnServerValidate="CustomValidator3_ServerValidate"
                        ValidationGroup="addst">*</asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 139px">
                    phon</td>
                <td style="width: 108px">
                    <asp:TextBox ID="phonTextBox" runat="server" Text='<%# Bind("phon") %>'></asp:TextBox></td>
                <td style="width: 89px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="phonTextBox"
                        Display="Dynamic" ErrorMessage="enter phon number" ValidationGroup="addst">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator4" runat="server" ControlToValidate="phonTextBox"
                        Display="Dynamic" ErrorMessage="invalid phon number" ValidationExpression="\d{10}"
                        ValidationGroup="addst">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator4" runat="server" ControlToValidate="phonTextBox"
                        Display="Dynamic" ErrorMessage="phon number is exist" OnServerValidate="CustomValidator4_ServerValidate"
                        ValidationGroup="addst">*</asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 139px; height: 26px">
                    active</td>
                <td style="width: 108px; height: 26px">
                    <asp:ListBox ID="active" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                        <asp:ListItem Selected="True">active</asp:ListItem>
                        <asp:ListItem>not active</asp:ListItem>
                    </asp:ListBox></td>
                <td style="width: 89px; height: 26px">
                </td>
            </tr>
            <tr>
                <td style="width: 139px">
                    department</td>
                <td style="width: 108px">
                    <asp:ListBox ID="dept" runat="server" DataSourceID="SqlDataSource1" DataTextField="dname"
                        DataValueField="did" Rows="1" SelectedValue='<%# Bind("did") %>'></asp:ListBox><asp:SqlDataSource
                            ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT [did], [dname] FROM [dept] ORDER BY [dname]"></asp:SqlDataSource>
                </td>
                <td style="width: 89px">
                </td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            OnClientClick='return confirm ("do you want to add")' Text="Insert" ValidationGroup="addst"></asp:LinkButton>
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel"></asp:LinkButton>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ValidationGroup="addst" />
    </InsertItemTemplate>
    <ItemTemplate>
        sid:
        <asp:Label ID="sidLabel" runat="server" Text='<%# Eval("sid") %>'></asp:Label><br />
        coid:
        <asp:Label ID="coidLabel" runat="server" Text='<%# Bind("coid") %>'></asp:Label><br />
        fname:
        <asp:Label ID="fnameLabel" runat="server" Text='<%# Bind("fname") %>'></asp:Label><br />
        lname:
        <asp:Label ID="lnameLabel" runat="server" Text='<%# Bind("lname") %>'></asp:Label><br />
        username:
        <asp:Label ID="usernameLabel" runat="server" Text='<%# Bind("username") %>'></asp:Label><br />
        pass:
        <asp:Label ID="passLabel" runat="server" Text='<%# Bind("pass") %>'></asp:Label><br />
        sex:
        <asp:Label ID="sexLabel" runat="server" Text='<%# Bind("sex") %>'></asp:Label><br />
        birthdate:
        <asp:Label ID="birthdateLabel" runat="server" Text='<%# Bind("birthdate") %>'></asp:Label><br />
        email:
        <asp:Label ID="emailLabel" runat="server" Text='<%# Bind("email") %>'></asp:Label><br />
        phon:
        <asp:Label ID="phonLabel" runat="server" Text='<%# Bind("phon") %>'></asp:Label><br />
        active:
        <asp:Label ID="activeLabel" runat="server" Text='<%# Bind("active") %>'></asp:Label><br />
        did:
        <asp:Label ID="didLabel" runat="server" Text='<%# Bind("did") %>'></asp:Label><br />
        dname:
        <asp:Label ID="dnameLabel" runat="server" Text='<%# Bind("dname") %>'></asp:Label><br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit"></asp:LinkButton>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New"></asp:LinkButton>
    </ItemTemplate>
</asp:FormView>
