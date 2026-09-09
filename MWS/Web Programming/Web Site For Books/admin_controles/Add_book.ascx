<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Add_book.ascx.cs" Inherits="admin_controles_Add_book" %>
<style type="text/css">
    .style1
    {
        width: 71%;
        height: 513px;
        font-size: small;
    }
    .style2
    {
        width: 17px;
    }
    .style3
    {
        text-align: center;
        font-size: x-large;
        color: #0066FF;
    }
    .style4
    {
        text-align: center;
        font-size: xx-large;
        color: #0066FF;
    }
</style>

<table class="style1">
    <tr>
        <td class="style4" colspan="6">
            <em><strong>Add Book</strong></em></td>
    </tr>
    <tr>
        <td class="style3" colspan="6">
            2/3</td>
    </tr>
    <tr>
        <td>
            ISBN :</td>
        <td align="left">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td class="style2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
        <td>
            BookTitle :</td>
        <td align="left">
            <asp:TextBox ID="TextBox6" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator17" runat="server" 
                ControlToValidate="DropDownList2" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            BookThumbnail :</td>
        <td align="left">
            <asp:TextBox ID="TextBox3" runat="server" Height="33px"></asp:TextBox>
        </td>
        <td class="style2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                ControlToValidate="TextBox3" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
        <td>
            Publish Date :</td>
        <td align="left">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                ForeColor="#003399" Height="16px" Width="173px" 
                onselectionchanged="Calendar1_SelectionChanged">
                <DayHeaderStyle BackColor="#99CCCC" ForeColor="#336666" Height="1px" />
                <NextPrevStyle Font-Size="8pt" ForeColor="#CCCCFF" />
                <OtherMonthDayStyle ForeColor="#999999" />
                <SelectedDayStyle BackColor="#009999" Font-Bold="True" ForeColor="#CCFF99" />
                <SelectorStyle BackColor="#99CCCC" ForeColor="#336666" />
                <TitleStyle BackColor="#003399" BorderColor="#3366CC" BorderWidth="1px" 
                    Font-Bold="True" Font-Size="10pt" ForeColor="#CCCCFF" Height="25px" />
                <TodayDayStyle BackColor="#99CCCC" ForeColor="White" />
                <WeekendDayStyle BackColor="#CCCCFF" />
            </asp:Calendar>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td>
            Book Price :</td>
        <td align="left">
            <asp:TextBox ID="TextBox4" runat="server">0</asp:TextBox>
        </td>
        <td class="style2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator14" runat="server" 
                ControlToValidate="TextBox4" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
        <td>
            Abstract :</td>
        <td align="left">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator12" runat="server" 
                ControlToValidate="TextBox2" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Publisher Name :</td>
        <td align="left">
            <asp:DropDownList ID="DropDownList1" runat="server" 
                DataSourceID="publisher_name" DataTextField="PublisherName" 
                DataValueField="PublisherID" Height="27px" Width="125px">
            </asp:DropDownList>
        </td>
        <td class="style2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                ControlToValidate="DropDownList1" ForeColor="Red" ValidationGroup="ad">*</asp:RequiredFieldValidator>
        </td>
        <td>
            Read Count :</td>
        <td align="left">
            <asp:TextBox ID="TextBox7" runat="server">0</asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                ControlToValidate="TextBox7" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td>
            Keyword :</td>
        <td align="left">
            <asp:TextBox ID="TextBox5" runat="server" Height="74px" TextMode="MultiLine" 
                Width="139px">NO</asp:TextBox>
        </td>
        <td class="style2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                ControlToValidate="TextBox5" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
        <td>
            Category :</td>
        <td align="left">
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="Cato" 
                DataTextField="CategoryName" DataValueField="CategoryID" Height="60px" 
                Width="118px">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                ControlToValidate="DropDownList2" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="4">
            Book Cover :<asp:FileUpload ID="fileImage" runat="server" />
            </td>
        <td colspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                ControlToValidate="fileImage" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        &nbsp;<asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="text-align: center">
            <asp:Button ID="Button1" runat="server" Text="Save" Width="61px" 
                onclick="Button1_Click" ValidationGroup="ad" />
        </td>
        <td align="left" colspan="2" style="text-align: center">
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Saved" 
                Visible="False"></asp:Label>
        </td>
        <td colspan="2">
            <asp:Button ID="Button2" runat="server" onclick="Button2_Click" Text="Reset" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <asp:SqlDataSource ID="publisher_name" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT [PublisherID], [PublisherName] FROM [Publishers]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Cato" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
            <br />
        </td>
    </tr>
    </table>

