<%@ Control Language="C#" AutoEventWireup="true" CodeFile="clupsubject.ascx.cs" Inherits="admincontrols_clupsubject" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    InsertCommand="INSERT INTO clupsubject(subtitel, subtext, date, active, suid) VALUES (@subtitel, @subtext, @date, @active, @suid)"
    SelectCommand="SELECT cbid, subtitel, subtext, date, active, suid FROM clupsubject ORDER BY date"
    UpdateCommand="UPDATE clupsubject SET subtitel = @subtitel, subtext = @subtext, date = @date, active = @active, suid = @suid WHERE (cbid = @cbid)">
    <UpdateParameters>
        <asp:Parameter Name="subtitel" />
        <asp:Parameter Name="subtext" />
        <asp:Parameter Name="date" />
        <asp:Parameter Name="active" />
        <asp:Parameter Name="suid" />
        <asp:Parameter Name="cbid" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="subtitel" />
        <asp:Parameter Name="subtext" />
        <asp:Parameter Name="date" />
        <asp:Parameter Name="active" />
        <asp:Parameter Name="suid" />
    </InsertParameters>
</asp:SqlDataSource>
<br />
<asp:FormView ID="FormView1" runat="server" DataKeyNames="cbid" DataSourceID="SqlDataSource1"
    DefaultMode="Insert" Height="248px" Width="278px">
    <EditItemTemplate>
        cbid:
        <asp:Label ID="cbidLabel1" runat="server" Text='<%# Eval("cbid") %>'></asp:Label><br />
        subtitel:
        <asp:TextBox ID="subtitelTextBox" runat="server" Text='<%# Bind("subtitel") %>'>
        </asp:TextBox><br />
        subtext:
        <asp:TextBox ID="subtextTextBox" runat="server" Text='<%# Bind("subtext") %>'>
        </asp:TextBox><br />
        date:
        <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>'>
        </asp:TextBox><br />
        active:
        <asp:TextBox ID="activeTextBox" runat="server" Text='<%# Bind("active") %>'>
        </asp:TextBox><br />
        suid:
        <asp:TextBox ID="suidTextBox" runat="server" Text='<%# Bind("suid") %>'>
        </asp:TextBox><br />
        <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
            Text="Update">
        </asp:LinkButton>
        <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel">
        </asp:LinkButton>
    </EditItemTemplate>
    <InsertItemTemplate>
        insert subject
        <br />
        <table style="width: 371px">
            <tr>
                <td style="width: 100px">
                    subtitel</td>
                <td style="width: 100px">
                    <asp:TextBox ID="subtitelTextBox" runat="server" Text='<%# Bind("subtitel") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="subtitelTextBox"
                        Display="Dynamic" ErrorMessage="enter titel" ValidationGroup="adcs">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    subtext</td>
                <td style="width: 100px">
                    <asp:TextBox ID="subtextTextBox" runat="server" Height="152px" Text='<%# Bind("subtext") %>'
                        TextMode="MultiLine" Width="244px"></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="subtextTextBox"
                        Display="Dynamic" ErrorMessage="enter text" ValidationGroup="adcs">*</asp:RequiredFieldValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    date</td>
                <td style="width: 100px">
                    <asp:TextBox ID="dateTextBox" runat="server" Text='<%# Bind("date") %>'></asp:TextBox></td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="dateTextBox"
                        Display="Dynamic" ErrorMessage="enter date" ValidationGroup="adcs">*</asp:RequiredFieldValidator>
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="dateTextBox"
                        Display="Dynamic" ErrorMessage="invalid date" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                        ValidationGroup="adcs">*</asp:RegularExpressionValidator></td>
            </tr>
            <tr>
                <td style="width: 100px">
                    active</td>
                <td style="width: 100px">
                    <asp:ListBox ID="ListBox2" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                        <asp:ListItem Selected="True">active</asp:ListItem>
                        <asp:ListItem>not active</asp:ListItem>
                    </asp:ListBox></td>
                <td style="width: 100px">
                </td>
            </tr>
            <tr>
                <td style="width: 100px">
                    subject</td>
                <td style="width: 100px">
                    <asp:ListBox ID="ListBox1" runat="server" DataSourceID="SqlDataSource1" DataTextField="suname"
                        DataValueField="suid" Rows="1" SelectedValue='<%# Bind("suid") %>'></asp:ListBox><asp:SqlDataSource
                            ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                            SelectCommand="SELECT suid, suname FROM subject WHERE (active = 'active') AND (suname <> '') ORDER BY suname">
                        </asp:SqlDataSource>
                </td>
                <td style="width: 100px">
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="ListBox1"
                        Display="Dynamic" ErrorMessage="choos subject" ValidationGroup="adcs">*</asp:RequiredFieldValidator></td>
            </tr>
        </table>
        <br />
        <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
            OnClientClick='return confirm("are you sure")' Text="Insert" ValidationGroup="adcs"></asp:LinkButton>
        <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
            Text="Cancel"></asp:LinkButton>
        <br />
        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
            ValidationGroup="adcs" />
    </InsertItemTemplate>
    <ItemTemplate>
        cbid:
        <asp:Label ID="cbidLabel" runat="server" Text='<%# Eval("cbid") %>'></asp:Label><br />
        subtitel:
        <asp:Label ID="subtitelLabel" runat="server" Text='<%# Bind("subtitel") %>'></asp:Label><br />
        subtext:
        <asp:Label ID="subtextLabel" runat="server" Text='<%# Bind("subtext") %>'></asp:Label><br />
        date:
        <asp:Label ID="dateLabel" runat="server" Text='<%# Bind("date") %>'></asp:Label><br />
        active:
        <asp:Label ID="activeLabel" runat="server" Text='<%# Bind("active") %>'></asp:Label><br />
        suid:
        <asp:Label ID="suidLabel" runat="server" Text='<%# Bind("suid") %>'></asp:Label><br />
        <asp:LinkButton ID="EditButton" runat="server" CausesValidation="False" CommandName="Edit"
            Text="Edit"></asp:LinkButton>
        <asp:LinkButton ID="NewButton" runat="server" CausesValidation="False" CommandName="New"
            Text="New"></asp:LinkButton>
    </ItemTemplate>
</asp:FormView>
<br />
<br />
<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="cbid" DataSourceID="SqlDataSource1" PageSize="5">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("are you sure")' Text="Update" ValidationGroup="upsc"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="subject titel" SortExpression="subtitel">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("subtitel") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox1"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upcs">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("subtitel") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="subject text" SortExpression="subtext">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Height="119px" Text='<%# Bind("subtext") %>'
                    TextMode="MultiLine" Width="246px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upcs">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("subtext") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="date" SortExpression="date">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox3"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upcs">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" ControlToValidate="TextBox3"
                    Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                    ValidationGroup="upcs">*</asp:RegularExpressionValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="active" SortExpression="active">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox3" runat="server" Rows="1" SelectedValue='<%# Bind("active") %>'>
                    <asp:ListItem Selected="True">active</asp:ListItem>
                    <asp:ListItem>not active</asp:ListItem>
                </asp:ListBox>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label4" runat="server" Text='<%# Bind("active") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="subject" SortExpression="suid">
            <EditItemTemplate>
                <asp:ListBox ID="ListBox4" runat="server" DataSourceID="SqlDataSource1" DataTextField="suname"
                    DataValueField="suid" Rows="1" SelectedValue='<%# Bind("suid") %>'></asp:ListBox><asp:SqlDataSource
                        ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                        SelectCommand="SELECT suid, suname FROM subject WHERE (active = 'active') AND (suname <> '') ORDER BY suname">
                    </asp:SqlDataSource>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:ListBox ID="ListBox4" runat="server" DataSourceID="SqlDataSource1" DataTextField="suname"
                    DataValueField="suid" Enabled="False" Rows="1" SelectedValue='<%# Bind("suid") %>'>
                </asp:ListBox><asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                    SelectCommand="SELECT suid, suname FROM subject"></asp:SqlDataSource>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
