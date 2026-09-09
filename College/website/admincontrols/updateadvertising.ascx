<%@ Control Language="C#" AutoEventWireup="true" CodeFile="updateadvertising.ascx.cs" Inherits="admincontrols_updateadvertising" %>
<asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
    DeleteCommand="DELETE FROM advertising WHERE (adid = @adid)" InsertCommand="addadvertising"
    InsertCommandType="StoredProcedure" SelectCommand="SELECT titel, text, date, adid FROM advertising ORDER BY date"
    UpdateCommand="updateadvertising" UpdateCommandType="StoredProcedure">
    <DeleteParameters>
        <asp:Parameter Name="adid" />
    </DeleteParameters>
    <UpdateParameters>
        <asp:Parameter Name="titel" />
        <asp:Parameter Name="text" />
        <asp:Parameter Name="date" />
        <asp:Parameter Name="adid" />
    </UpdateParameters>
    <InsertParameters>
        <asp:Parameter Name="titel" Type="String" />
        <asp:Parameter Name="text" Type="String" />
        <asp:Parameter Name="date" Type="DateTime" />
    </InsertParameters>
</asp:SqlDataSource>
&nbsp;<asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False"
    DataKeyNames="adid" DataSourceID="SqlDataSource1" PageSize="1" Width="582px">
    <Columns>
        <asp:TemplateField ShowHeader="False">
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton5" runat="server" CausesValidation="False" CommandName="Delete"
                    OnClientClick='return confirm ("o you want to delete")' Text="Delete"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField ShowHeader="False">
            <EditItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="True" CommandName="Update"
                    OnClientClick='return confirm("do you want to update")' Text="Update" ValidationGroup="upad"></asp:LinkButton>
                <asp:LinkButton ID="LinkButton2" runat="server" CausesValidation="False" CommandName="Cancel"
                    Text="Cancel"></asp:LinkButton>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" CommandName="Edit"
                    Text="Edit"></asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="titel" SortExpression="titel">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox1" runat="server" Text='<%# Bind("titel") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upad">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label1" runat="server" Text='<%# Bind("titel") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="text" SortExpression="text">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox2" runat="server" Height="157px" Text='<%# Bind("text") %>'
                    TextMode="MultiLine" Width="257px"></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                    Display="Dynamic" ErrorMessage="RequiredFieldValidator" ValidationGroup="upad">*</asp:RequiredFieldValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label2" runat="server" Text='<%# Bind("text") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="date" SortExpression="date">
            <EditItemTemplate>
                <asp:TextBox ID="TextBox3" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:TextBox>
                <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="TextBox3"
                    ErrorMessage="RequiredFieldValidator" ValidationGroup="upad">*</asp:RequiredFieldValidator>
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" ControlToValidate="TextBox3"
                    Display="Dynamic" ErrorMessage="RegularExpressionValidator" ValidationExpression="\d\d?[/]\d\d?[/]\d\d\d\d"
                    ValidationGroup="upad">*</asp:RegularExpressionValidator>
            </EditItemTemplate>
            <ItemTemplate>
                <asp:Label ID="Label3" runat="server" Text='<%# Bind("date", "{0:d}") %>'></asp:Label>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</asp:GridView>
