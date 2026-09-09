<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updateteacher.ascx.cs" Inherits="admincontrols_updateteacher" %>
<asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" DataKeyNames="tid"
    DataSourceID="SqlDataSource1" Width="672px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("do you want to update")' Text="Update" ValidationGroup="upte"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="first name" SortExpression="fname">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("fname") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upte">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("fname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="last name" SortExpression="lname">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Text='<%# Bind("lname") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upte">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("lname") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="user name" SortExpression="username">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("username") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upte">*</asp:RequiredFieldValidator>
                <asp:CustomValidator ID="CustomValidator1" runat="server" ControlToValidate="TextBox3"
                    Display="Dynamic" ErrorMessage="CustomValidator" ValidationGroup="upte" OnServerValidate="CustomValidator1_ServerValidate">*</asp:CustomValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("username") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="sex" SortExpression="sex">
            <EditItemTemplate>
                &nbsp;<asp:ListBox ID="sex" runat="server" Rows="1" SelectedValue='<%# Bind("sex") %>'>
                    <asp:ListItem>male</asp:ListItem>
                    <asp:ListItem>female</asp:ListItem>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("sex") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="birth date" SortExpression="birthdate">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox5" runat="server" Text='<%# Bind("birthdate", "{0:d}") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox5"
                    Display="Dynamic" ErrorMessage="enter first name" ValidationGroup="upte">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox5"
                        Display="Dynamic" ErrorMessage="invalid date" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                        ValidationGroup="upte">*</asp:RegularExpressionValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label5" runat="server" Text='<%# Bind("birthdate", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="email" SortExpression="email">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox6" runat="server" Text='<%# Bind("email") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox6"
                    Display="Dynamic" ErrorMessage="enter email adress" ValidationGroup="upte">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox6"
                        Display="Dynamic" ErrorMessage="invalid email " ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                        ValidationGroup="upte">*</asp:RegularExpressionValidator><asp:CustomValidator ID="CustomValidator3"
                            runat="server" ControlToValidate="TextBox6" Display="Dynamic" ErrorMessage="email adress is exist"
                            OnServerValidate="CustomValidator3_ServerValidate" ValidationGroup="upte">*</asp:CustomValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label6" runat="server" Text='<%# Bind("email") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="phon" SortExpression="phon">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox7" runat="server" Text='<%# Bind("phon") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox7"
                    Display="Dynamic" ErrorMessage="enter phon number" ValidationGroup="upte">*</asp:RequiredFieldValidator><asp:RegularExpressionValidator
                        ID="RegularExpressionValidator3" runat="server" ControlToValidate="TextBox7"
                        Display="Dynamic" ErrorMessage="invalid phon" ValidationExpression="\d{10}" ValidationGroup="upte">*</asp:RegularExpressionValidator><asp:CustomValidator
                            ID="CustomValidator2" runat="server" ControlToValidate="TextBox7" Display="Dynamic"
                            ErrorMessage="phon number is exist" OnServerValidate="CustomValidator2_ServerValidate"
                            ValidationGroup="upte">*</asp:CustomValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label7" runat="server" Text='<%# Bind("phon") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="active" SortExpression="active">
            <EditItemTemplate>
                &nbsp;<asp:ListBox ID="active" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                    <asp:ListItem Selected="True">active</asp:ListItem>
                    <asp:ListItem>not active</asp:ListItem>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label8" runat="server" Text='<%# Bind("active") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    SelectCommand="SELECT tid, fname, lname, username, sex, birthdate, email, phon, active FROM teacher"
    UpdateCommand="UPDATE teacher SET fname = @fname, lname = @lname, username = @username, sex = @sex, birthdate = @birthdate, email = @email, phon = @phon, active = @active WHERE (tid = @tid)">
    <UpdateParameters>
        <asp:Parameter Name="fname" />
        <asp:Parameter Name="lname" />
        <asp:Parameter Name="username" />
        <asp:Parameter Name="sex" />
        <asp:Parameter Name="birthdate" />
        <asp:Parameter Name="email" />
        <asp:Parameter Name="phon" />
        <asp:Parameter Name="active" />
        <asp:Parameter Name="tid" />
    </UpdateParameters>
</asp:SqlDataSource>
