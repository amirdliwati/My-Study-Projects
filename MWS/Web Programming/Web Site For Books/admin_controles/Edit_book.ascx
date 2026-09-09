<%@ Control Language="C#" AutoEventWireup="true" CodeFile="Edit_book.ascx.cs" Inherits="admin_controles_Edit_book" %>
<style type="text/css">
    .style1
    {
        width: 75%;
        height: 182px;
        font-size: small;
    }
    .style3
    {
        text-align: center;
        font-size: x-large;
        color: #0066FF;
    }
    .style2
    {
    }
    .style4
    {
    }
    .style8
    {
        height: 236px;
    }
    .style18
    {
        height: 14px;
    }
    .style19
    {
        height: 17px;
    }
    .style22
    {
        height: 10px;
    }
    .style23
    {
        height: 60px;
    }
    .style24
    {
        height: 22px;
    }
    .style25
    {
        height: 40px;
    }
</style>

<table class="style1">
    <tr>
        <td class="style3" colspan="6">
            Edit <em><strong>Book</strong></em></td>
    </tr>
    <tr>
        <td class="style4">
            &nbsp;</td>
        <td align="left">
            Insert Book Name :</td>
        <td class="style2" colspan="3">
            <asp:DropDownList ID="DropDownList3" runat="server" 
                DataSourceID="select_book_name" DataTextField="ISBN" DataValueField="BookID" 
                Height="16px" onselectedindexchanged="DropDownList3_SelectedIndexChanged" 
                Width="145px" AutoPostBack="True" AppendDataBoundItems="True">
            </asp:DropDownList>
        </td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4">
            &nbsp;</td>
        <td align="left">
            &nbsp;</td>
        <td class="style2" colspan="3">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4">
            ISBN :</td>
        <td align="left">
            <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                ControlToValidate="TextBox1" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
        <td>
            Bookitle :</td>
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
        <td class="style4">
            Book Cover :</td>
        <td align="left">
            <asp:Image ID="img1" runat="server" Height="129px" ImageAlign="Middle" 
                Width="140px" />
        </td>
        <td>
            &nbsp;</td>
        <td>
            Publish Date :</td>
        <td align="left">
            <asp:Calendar ID="Calendar1" runat="server" BackColor="White" 
                BorderColor="#3366CC" BorderWidth="1px" CellPadding="1" 
                DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" 
                ForeColor="#003399" Height="16px" Width="173px">
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
        <td class="style4" colspan="2">
            <asp:FileUpload ID="fileImage" runat="server" />
        </td>
        <td class="style2" colspan="2">
            <asp:Label ID="Label2" runat="server" ForeColor="Red"></asp:Label>
        </td>
        <td align="left">
            &nbsp;</td>
        <td>
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style4">
            Book Price :</td>
        <td align="left">
            <asp:TextBox ID="TextBox4" runat="server"></asp:TextBox>
        </td>
        <td>
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
        <td class="style4">
            Publisher Name :</td>
        <td align="left">
            <asp:DropDownList ID="DropDownList1" runat="server" Height="27px" Width="125px" 
                DataSourceID="publisher_name" DataTextField="PublisherName" 
                DataValueField="PublisherID" AppendDataBoundItems="True">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator16" runat="server" 
                ControlToValidate="DropDownList1" ForeColor="Red" ValidationGroup="ad">*</asp:RequiredFieldValidator>
        </td>
        <td>
            Read Count :</td>
        <td align="left">
            <asp:TextBox ID="TextBox7" runat="server"></asp:TextBox>
           
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator19" runat="server" 
                ControlToValidate="TextBox7" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style4">
            BookThumbnail :</td>
        <td align="left">
            <asp:TextBox ID="TextBox3" runat="server" Height="24px"></asp:TextBox>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator13" runat="server" 
                ControlToValidate="TextBox3" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
        <td>
            Category :</td>
        <td align="left">
            <asp:DropDownList ID="DropDownList2" runat="server" Height="37px" 
                Width="118px" DataSourceID="Cato" DataTextField="CategoryName" 
                DataValueField="CategoryID">
            </asp:DropDownList>
        </td>
        <td>
            <asp:RequiredFieldValidator ID="RequiredFieldValidator20" runat="server" 
                ControlToValidate="DropDownList2" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style4" rowspan="2">
            Keyword :</td>
        <td align="left" rowspan="2">
            <asp:TextBox ID="TextBox5" runat="server" Height="74px" TextMode="MultiLine" 
                Width="139px"></asp:TextBox>
        </td>
        <td rowspan="2">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator15" runat="server" 
                ControlToValidate="TextBox5" ForeColor="Red" ValidationGroup="ad" 
                ToolTip="Null !!!">*</asp:RequiredFieldValidator>
        </td>
        <td rowspan="2">
            Authors :</td>
        <td align="left">
            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                DataKeyNames="BookAuthorID" DataSourceID="Author_name" Height="105px" 
                Width="155px">
                <Columns>
                    <asp:BoundField DataField="AuthorName" HeaderText="AuthorName" 
                        SortExpression="AuthorName" />
                    <asp:BoundField DataField="BookID" HeaderText="BookID" SortExpression="BookID" 
                        Visible="False" />
                    <asp:BoundField DataField="AuthorID" HeaderText="AuthorID" 
                        SortExpression="AuthorID" Visible="False" />
                    <asp:BoundField DataField="BookAuthorID" HeaderText="BookAuthorID" 
                        InsertVisible="False" ReadOnly="True" SortExpression="BookAuthorID" 
                        Visible="False" />
                    <asp:TemplateField>
                        <ItemTemplate>
                            <asp:LinkButton ID="LinkButton1" runat="server" CausesValidation="False" 
                                CommandName="Delete" 
                                onclientclick="return confirm (&quot;o you want to delete&quot;)">Delete</asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </asp:GridView>
        </td>
        <td rowspan="2">
            &nbsp;</td>
    </tr>
    <tr>
        <td align="center">
            <asp:LinkButton ID="LinkButton2" runat="server" onclick="LinkButton2_Click" 
                style="text-align: center">Add OR Edit</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="text-align: center" class="style25">
            <asp:Button ID="Button1" runat="server" Text="Update" Width="61px" 
                onclick="Button1_Click" ValidationGroup="ad" />
            <asp:Label ID="Label1" runat="server" ForeColor="Red" Text="Updated" 
                Visible="False"></asp:Label>
        </td>
        <td align="left" colspan="4" style="text-align: center" class="style25">
            <asp:Button ID="Button2" runat="server" Text="Delete" onclick="Button2_Click" 
                onclientclick="return confirm (&quot;o you want to delete&quot;)" />
            <asp:Label ID="Label3" runat="server" ForeColor="Red" Text="Deleted" 
                Visible="False"></asp:Label>
        </td>
    </tr>
    <tr>
        <td align="left" colspan="2" style="text-align: center" class="style8">
            <asp:SqlDataSource ID="select_book_name" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT [BookID], [ISBN] FROM [Books]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="publisher_name" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT [PublisherID], [PublisherName] FROM [Publishers]">
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="Cato" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT * FROM [Categories]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="Author_name" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                DeleteCommand="DELETE FROM BookAuthors WHERE (BookAuthorID = @BookAuthorID)" 
                SelectCommand="SELECT Authors.AuthorName, BookAuthors.BookID, BookAuthors.AuthorID, BookAuthors.BookAuthorID FROM Authors INNER JOIN BookAuthors ON Authors.AuthorID = BookAuthors.AuthorID WHERE (BookAuthors.BookID = @BookID)">
                <DeleteParameters>
                    <asp:ControlParameter ControlID="GridView1" Name="BookAuthorID" 
                        PropertyName="SelectedValue" />
                </DeleteParameters>
                <SelectParameters>
                    <asp:ControlParameter ControlID="DropDownList3" DefaultValue="" Name="BookID" 
                        PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <br />
                <asp:SqlDataSource ID="nationlity" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT * FROM [Nationalities]">
                </asp:SqlDataSource>
                <asp:SqlDataSource ID="Author_name0" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT [AuthorID], [AuthorName] FROM [Authors]"></asp:SqlDataSource>
        </td>
        <td align="left" colspan="4" style="text-align: center" class="style8">
            <asp:Panel ID="Panel1" runat="server" Height="221px" Visible="False">
                <table class="style1">
                    <tr>
                        <td class="style22" valign="top">
                            <asp:RadioButtonList ID="RadioButtonList1" runat="server" AutoPostBack="True" 
                Height="29px" onselectedindexchanged="RadioButtonList1_SelectedIndexChanged" 
                Width="135px">
                                <asp:ListItem>Select Author</asp:ListItem>
                                <asp:ListItem>Add Author</asp:ListItem>
                            </asp:RadioButtonList>
                        </td>
                        <td class="style22" valign="top">
                            <asp:DropDownList ID="DropDownList4" runat="server" AppendDataBoundItems="True" 
                                AutoPostBack="True" DataSourceID="Author_name0" DataTextField="AuthorName" 
                                DataValueField="AuthorID" Height="19px" 
                                onselectedindexchanged="DropDownList4_SelectedIndexChanged" Visible="False" 
                                Width="135px">
                            </asp:DropDownList>
                        </td>
                        <td class="style22" valign="top">
                        </td>
                    </tr>
                    <tr>
                        <td class="style19" valign="top">
                            Author Name :</td>
                        <td class="style19" valign="top">
                            &nbsp;<asp:TextBox ID="TextBox8" runat="server"></asp:TextBox>
                            &nbsp;</td>
                        <td class="style19" valign="top">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator21" runat="server" 
                ControlToValidate="TextBox1" ForeColor="Red" ToolTip="Author Name Is Null" 
                ValidationGroup="RE">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style18" valign="top">
                            Nationality :</td>
                        <td class="style18" valign="top">
                            &nbsp;&nbsp;<asp:DropDownList ID="DropDownList5" runat="server" DataSourceID="nationlity" 
                DataTextField="NationalityName" DataValueField="NationalityID">
                            </asp:DropDownList>
                        </td>
                        <td class="style18" valign="top">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                ControlToValidate="DropDownList1" ForeColor="Red" 
                ToolTip="Nationality Is Null" ValidationGroup="RE">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style23" valign="top">
                            Author Description :</td>
                        <td class="style23" valign="top">
                            &nbsp;<asp:TextBox ID="TextBox9" runat="server" Height="64px" TextMode="MultiLine" 
                Width="147px">NO</asp:TextBox>
                            &nbsp;</td>
                        <td class="style23" valign="top">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox2" ForeColor="Red" ToolTip=" Is Null" 
                ValidationGroup="RE">*</asp:RequiredFieldValidator>
                        </td>
                    </tr>
                    <tr>
                        <td class="style24" valign="top">
                            <asp:Button ID="Button4" runat="server" onclick="Button4_Click" Text="Add" 
                ValidationGroup="RE" Visible="False" />
                            <asp:Button ID="Button5" runat="server" onclick="Button5_Click" Text="Select" 
                Visible="False" />
                        </td>
                        <td align="center" class="style24" valign="top">
                            <asp:Label ID="Label4" runat="server" ForeColor="Red" Visible="False">Saved</asp:Label>
                            &nbsp;<asp:Button ID="Button3" runat="server" onclick="Button3_Click" 
                                Text="Resete" />
                        </td>
                        <td class="style24" valign="top">
                        </td>
                    </tr>
                </table>
            </asp:Panel>
            <br />
            <asp:LinkButton ID="LinkButton3" runat="server" onclick="LinkButton3_Click" 
                Visible="False">Hide This Option</asp:LinkButton>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            &nbsp;</td>
    </tr>
    </table>


