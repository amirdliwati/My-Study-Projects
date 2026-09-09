<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlCustomerInfo.ascx.cs" Inherits="Controls_ctlCustomerInfo" %>
<fieldset><legend>Customer Info</legend>
<asp:HiddenField runat="server" ID="CustomerID" />
<asp:DetailsView ID="DetailsView1" runat="server"
    AutoGenerateRows="False" DataKeyNames="CustomerID" DataSourceID="odsCustomers">
    <Fields>
        <asp:BoundField DataField="CustomerID" HeaderText="CustomerID" 
            InsertVisible="False" ReadOnly="True" SortExpression="CustomerID" 
            Visible="False" />
        <asp:BoundField DataField="CustomerName" HeaderText="Name" 
            SortExpression="CustomerName" />
        <asp:BoundField DataField="CustomerEmail" HeaderText="Email" 
            SortExpression="CustomerEmail" />
        <asp:BoundField DataField="BirthDate" HeaderText="Birth Date"  DataFormatString="{0:dd-MM-yyyy}"
            SortExpression="BirthDate" />
        <asp:TemplateField HeaderText="Gender" SortExpression="GenderID">

            <ItemTemplate>
                <asp:DropDownList ID="lstGender" runat="server" SelectedValue='<%# Eval("GenderID") %>'
                    Enabled="false" Width="100%">
                    <asp:ListItem Value="0">Male</asp:ListItem>
                    <asp:ListItem Value="1">Female</asp:ListItem>
                </asp:DropDownList>

            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Nationality" SortExpression="NationalityID">
            <ItemTemplate>
                <asp:DropDownList ID="lstNationality" runat="server" DataSourceID="odsNationalities" 
                    SelectedValue='<%# Eval("NationalityID") %>' Enabled="false" Width="100%"
                    DataTextField="NationalityName" DataValueField="NationalityID">
                </asp:DropDownList>
                <asp:ObjectDataSource ID="odsNationalities" runat="server" 
                    OldValuesParameterFormatString="original_{0}" SelectMethod="GetData" 
                    TypeName="AWPDataSetTableAdapters.NationalitiesTableAdapter">
                </asp:ObjectDataSource>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="Maritital Status" 
            SortExpression="MarititalStatusID">
            <ItemTemplate>
                <asp:DropDownList ID="DropDownList4" runat="server"
                    SelectedValue='<%# Bind("MarititalStatusID") %>' Enabled="false" Width="100%">
                    <asp:ListItem Value="0">Single</asp:ListItem>
                    <asp:ListItem Value="1">Married</asp:ListItem>
                    <asp:ListItem Value="2">Engaged</asp:ListItem>
                    <asp:ListItem Value="3">Divorced</asp:ListItem>
                </asp:DropDownList>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:BoundField DataField="ChildrenCount" HeaderText="Children Count" 
            SortExpression="ChildrenCount" />
        <asp:BoundField DataField="loginID" HeaderText="loginID" 
            SortExpression="loginID" Visible="False" />
        <asp:BoundField DataField="CustomerHoppy" HeaderText="Hoppy" 
            SortExpression="CustomerHoppy" />
    </Fields>
</asp:DetailsView>
<asp:ObjectDataSource ID="odsCustomers" runat="server" 
    OldValuesParameterFormatString="original_{0}" 
    SelectMethod="GetDataByCustomerID" 
    TypeName="AWPDataSetTableAdapters.CustomersTableAdapter">
    <SelectParameters>
        <asp:ControlParameter Name="CustomerID" ControlID="CustomerID" PropertyName="Value"
            Type="Int32" />
    </SelectParameters>
</asp:ObjectDataSource>
</fieldset>