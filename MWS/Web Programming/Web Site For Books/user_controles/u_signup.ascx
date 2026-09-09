<%@ Control Language="C#" AutoEventWireup="true" CodeFile="u_signup.ascx.cs" Inherits="user_controles_u_signup" %>
<style type="text/css">

        .style1
        {
            width: 40%;
        height: 259px;
    }
        
        .style6
        {
            height: 23px;
        text-align: center;
        color: #0066FF;
        font-size: xx-large;
    }
        .style27
        {
        width: 148px;
        height: 26px;
    }
        .style54
        {
            height: 26px;
            width: 48px;
        }
        .style37
        {
            height: 26px;
            width: 36px;
        }
        .style55
        {
            width: 48px;
        margin-left: 80px;
    }
        .style38
        {
            width: 36px;
        }
        .style14
        {
            width: 148px;
            height: 17px;
        }
        .style56
        {
            height: 17px;
            width: 48px;
        }
        .style39
        {
            height: 17px;
            width: 36px;
        }
        .style53
        {
            height: 23px;
            width: 48px;
        }
        .style36
        {
            height: 23px;
            width: 36px;
        }
        .style47
        {
            height: 42px;
        }
        .style58
        {
            width: 48px;
            height: 42px;
        }
        .style51
        {
            width: 36px;
            height: 42px;
        }
        .style59
    {
        width: 148px;
    }
    .style60
    {
        height: 23px;
        width: 148px;
    }
    .style61
    {
        height: 42px;
        width: 148px;
    }
</style>

<table class="style1">
    <tr>
        <td class="style6" colspan="3">
            <strong><em>Registration</em></strong></td>
    </tr>
    <tr>
        <td class="style27">
            <asp:Label ID="Label4" runat="server" Text="Full Name"></asp:Label>
        </td>
        <td class="style54">
            <asp:TextBox ID="TextBox3" runat="server" Height="16px" 
                style="margin-left: 5px" Width="103px"></asp:TextBox>
        </td>
        <td class="style37">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                ControlToValidate="TextBox3" ToolTip="Please Insert Your Full Name" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style59">
            <asp:Label ID="Label5" runat="server" Text="User Name"></asp:Label>
        </td>
        <td class="style55">
            <asp:TextBox ID="TextBox4" runat="server" Height="16px" 
                style="margin-left: 5px" Width="103px"></asp:TextBox>
        </td>
        <td class="style38">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" 
                ControlToValidate="TextBox4" ToolTip="Please Insert Your User Name" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style14">
            <asp:Label ID="Label6" runat="server" Text="Password"></asp:Label>
        </td>
        <td class="style56">
            <asp:TextBox ID="TextBox5" runat="server" Height="16px" 
                style="margin-left: 5px" TextMode="Password" Width="103px"></asp:TextBox>
        </td>
        <td class="style39">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" 
                ControlToValidate="TextBox5" ToolTip="Please Insert Your Password" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
        </td>
    </tr>
    <tr>
        <td class="style60">
            <asp:Label ID="Label7" runat="server" Text="Confirm Password"></asp:Label>
        </td>
        <td class="style53">
            <asp:TextBox ID="TextBox6" runat="server" Height="16px" 
                style="margin-left: 5px" TextMode="Password" Width="103px"></asp:TextBox>
        </td>
        <td class="style36">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" 
                ControlToValidate="TextBox6" ToolTip="Please Conferm Your Password" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
            <asp:CompareValidator ID="CompareValidator1" runat="server" 
                ControlToCompare="TextBox5" ControlToValidate="TextBox6" 
                ToolTip="Please check Your Password" ValidationGroup="reg">*</asp:CompareValidator>
        </td>
    </tr>
    <tr>
        <td class="style59">
            <asp:Label ID="Label8" runat="server" Text="Email"></asp:Label>
        </td>
        <td class="style55">
            <asp:TextBox ID="TextBox7" runat="server" Height="16px" 
                style="margin-left: 5px" Width="103px"></asp:TextBox>
        </td>
        <td class="style38">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" 
                ControlToValidate="TextBox7" ToolTip="Please Insert Your Email" 
                ValidationGroup="reg">*</asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                ControlToValidate="TextBox7" ToolTip="Please Insert Valid Email" 
                ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                ValidationGroup="reg">*</asp:RegularExpressionValidator>
        </td>
    </tr>
    <tr>
        <td class="style59">
            Nationality</td>
        <td class="style55">
            <asp:DropDownList ID="DropDownList2" runat="server" DataSourceID="nationality" 
                DataTextField="NationalityName" DataValueField="NationalityID" Height="20px" 
                style="margin-left: 5px" Width="103px">
            </asp:DropDownList>
        </td>
        <td class="style38">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style59">
            The Gender</td>
        <td class="style55">
            <asp:DropDownList ID="DropDownList3" runat="server">
                <asp:ListItem Value="0">Male</asp:ListItem>
                <asp:ListItem Value="1">Female</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style38">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style59">
            BirthDate</td>
        <td class="style55">
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
        <td class="style38">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style59">
            Marital Status</td>
        <td class="style55">
            <asp:DropDownList ID="DropDownList4" runat="server">
                <asp:ListItem Value="0">Single</asp:ListItem>
                <asp:ListItem Value="1">Married</asp:ListItem>
                <asp:ListItem Value="2">Engaged</asp:ListItem>
                <asp:ListItem Value="3">Divorced</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style38">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style59">
            Children Count</td>
        <td class="style55">
            <asp:DropDownList ID="DropDownList5" runat="server">
                <asp:ListItem>0</asp:ListItem>
                <asp:ListItem>1</asp:ListItem>
                <asp:ListItem>2</asp:ListItem>
                <asp:ListItem>3</asp:ListItem>
                <asp:ListItem>4</asp:ListItem>
                <asp:ListItem>5</asp:ListItem>
                <asp:ListItem>6</asp:ListItem>
                <asp:ListItem>7</asp:ListItem>
                <asp:ListItem>8</asp:ListItem>
                <asp:ListItem>9</asp:ListItem>
                <asp:ListItem>10</asp:ListItem>
            </asp:DropDownList>
        </td>
        <td class="style38">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style59">
            Hoppies</td>
        <td class="style55">
            <asp:TextBox ID="TextBox8" runat="server" Height="89px" TextMode="MultiLine" 
                Width="209px">NO</asp:TextBox>
        </td>
        <td class="style38">
            &nbsp;</td>
    </tr>
    <tr>
        <td class="style61">
            <asp:Button ID="Button3" runat="server" Height="27px" onclick="Button3_Click" 
                Text="Save" Width="56px" />
        </td>
        <td class="style58">
            &nbsp;&nbsp;
            <br />
        </td>
        <td class="style51">
        </td>
    </tr>
    <tr>
        <td class="style47" colspan="3">
            <asp:Label ID="Label10" runat="server" ForeColor="Red" Visible="False">*</asp:Label>
            <asp:SqlDataSource ID="nationality" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT * FROM [Nationalities]"></asp:SqlDataSource>
            <asp:SqlDataSource ID="loginid" runat="server" 
                ConnectionString="<%$ ConnectionStrings:AWPConnectionString %>" 
                SelectCommand="SELECT MAX(loginID) + 1 AS Expr1 FROM login">
            </asp:SqlDataSource>
        </td>
    </tr>
</table>

