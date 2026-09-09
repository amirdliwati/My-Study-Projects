<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addteacher.ascx.cs" Inherits="admincontrols_addteacher" %>
<asp:FormView ID="FormView1" runat="server" DataKeyNames="tid" DataSourceID="SqlDataSource1"
    DefaultMode="Insert">
    <EditItemTemplate>
        tid:
        <asp:Label ID="tidLabel1" runat="server" Text='<%# Eval("tid") %>'></asp:Label><br />
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
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="Update">
        </asp:LinkButton>
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel">
        </asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        <table style="width: 411px">
            <tr>
                <td style="width: 100px">
                    first name</td>
                <td style="width: 100px">
                    <asp:TextBox ID="fnameTextBox" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="fnameTextBox"
                        Display="Dynamic" ErrorMessage="enter first name" ValidationGroup="addte">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px; height: 26px;">
                    last name</td>
                <td style="width: 100px; height: 26px;">
                    <asp:TextBox ID="lnameTextBox" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox></td>
                <td style="width: 100px; height: 26px;">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="lnameTextBox"
                        Display="Dynamic" ErrorMessage="enter last name" ValidationGroup="addte">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    user name</td>
                <td style="width: 100px">
                    <asp:TextBox ID="usernameTextBox" runat="server" Text='<%# Bind("username") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="usernameTextBox"
                        Display="Dynamic" ErrorMessage="enter user name" ValidationGroup="addte">*</asp:RequiredFieldValidator>
                    <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="usernameTextBox"
                        Display="Dynamic" ErrorMessage="user name is exist " OnServerValidate="CustomValidator1_ServerValidate"
                        ValidationGroup="addte">*</asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    password</td>
                <td style="width: 100px">
                    <asp:TextBox ID="passTextBox" runat="server" Text='<%# Bind("pass") %>' TextMode="Password"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="birthdateTextBox"
                        Display="Dynamic" ErrorMessage="enter birth date" ValidationGroup="addte">*</asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ControlToCompare="passTextBox"
                        ControlToValidate="conpas" Display="Dynamic" ErrorMessage="password and cofirm password not matched"
                        ValueToCompare="addte">*</asp:CompareValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    confirm password</td>
                <td style="width: 100px">
                    <asp:TextBox ID="conpas" runat="server" TextMode="Password"></asp:TextBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    sex</td>
                <td style="width: 100px">
                    <asp:ListBox ID="sex" runat="server" Rows="1" SelectedValue='<%# Bind("sex") %>'>
                        <asp:ListItem Selected="True">male</asp:ListItem>
                        <asp:ListItem>female</asp:ListItem>
                    </asp:ListBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    birth date</td>
                <td style="width: 100px">
                    <asp:TextBox ID="birthdateTextBox" runat="server" Text='<%# Bind("birthdate") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="fnameTextBox"
                        Display="Dynamic" ErrorMessage="enter first name" ValidationGroup="addte">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="birthdateTextBox"
                        Display="Dynamic" ErrorMessage="invalid date" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                        ValidationGroup="addte">*</asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td style="width: 100px; height: 40px">
                    email</td>
                <td style="width: 100px; height: 40px">
                    <asp:TextBox ID="emailTextBox" runat="server" Text='<%# Bind("email") %>'></asp:TextBox></td>
                <td style="width: 100px; height: 40px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="emailTextBox"
                        Display="Dynamic" ErrorMessage="enter email adress" ValidationGroup="addte">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="emailTextBox"
                        Display="Dynamic" ErrorMessage="invalid email " ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="addte">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator3" runat="server" ControlToValidate="emailTextBox"
                        Display="Dynamic" ErrorMessage="email adress is exist" OnServerValidate="CustomValidator3_ServerValidate"
                        ValidationGroup="addte">*</asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    phon</td>
                <td style="width: 100px">
                    <asp:TextBox ID="phonTextBox" runat="server" Text='<%# Bind("phon") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="phonTextBox"
                        Display="Dynamic" ErrorMessage="enter phon number" ValidationGroup="addte">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" ControlToValidate="phonTextBox"
                        Display="Dynamic" ErrorMessage="invalid phon" ValidationExpression="\d{10}" ValidationGroup="addte">*</asp:RegularExpressionValidator>
                    <asp:CustomValidator ID="CustomValidator2" runat="server" ControlToValidate="phonTextBox"
                        Display="Dynamic" ErrorMessage="phon number is exist" OnServerValidate="CustomValidator2_ServerValidate"
                        ValidationGroup="addte">*</asp:CustomValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    active</td>
                <td style="width: 100px">
                    <asp:ListBox ID="active" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                        <asp:ListItem Selected="True">active</asp:ListItem>
                        <asp:ListItem>not active</asp:ListItem>
                    </asp:ListBox></td>
                <td style="width: 100px">
                </td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            OnClientClick='return confirm ("do you want to add")' Text="Insert" ValidationGroup="addte"></asp:LinkButton>
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel"></asp:LinkButton>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ValidationGroup="addte" />
    </InsertItemTemplate>
    <ItemTemplate>
        tid:
        <asp:Label ID="tidLabel" runat="server" Text='<%# Eval("tid") %>'></asp:Label><br />
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
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New"></asp:LinkButton>
    </ItemTemplate>
</asp:FormView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="addteacher"
    SelectCommand="addadvertising" InsertCommandType="StoredProcedure" SelectCommandType="StoredProcedure">
    <InsertParameters>
        <asp:Parameter Name="fname" />
        <asp:Parameter Name="lname" />
        <asp:Parameter Name="username" />
        <asp:Parameter Name="pass" />
        <asp:Parameter Name="sex" />
        <asp:Parameter Name="birthdate" />
        <asp:Parameter Name="email" />
        <asp:Parameter Name="phon" />
        <asp:Parameter Name="active" />
    </InsertParameters>
    <SelectParameters>
        <asp:Parameter Name="titel" Type="String" />
        <asp:Parameter Name="text" Type="String" />
        <asp:Parameter Name="date" Type="DateTime" />
    </SelectParameters>
</asp:SqlDataSource>
