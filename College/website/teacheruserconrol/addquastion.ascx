<%@ Control Language="C#" AutoEventWireup="true" CodeFile="addquastion.ascx.cs" Inherits="teacheruserconrol_addquastion" %>
<table style="width: 621px">
    <tr>
        <td style="width: 126px">
            quastion text</td>
        <td style="width: 100px">
            <asp:TextBox ID="TextBox1" runat="server" Height="178px" TextMode="MultiLine" Width="235px"></asp:TextBox></td>
        <td style="width: 104px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="TextBox1"
                Display="Dynamic" ErrorMessage="enter quastion text" ValidationGroup="addqu">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 126px">
            quastion
                    type</td>
        <td style="width: 100px">
            <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListBox1_SelectedIndexChanged"
                Rows="1">
                <asp:ListItem Selected="True">not written</asp:ListItem>
                <asp:ListItem>written</asp:ListItem>
            </asp:ListBox></td>
        <td style="width: 104px">
        </td>
    </tr>
    <tr>
        <td style="width: 126px">
                    multy</td>
        <td style="width: 100px">
            <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListBox2_SelectedIndexChanged"
                Rows="1">
                <asp:ListItem Selected="True">single</asp:ListItem>
                <asp:ListItem>multy</asp:ListItem>
            </asp:ListBox></td>
        <td style="width: 104px">
        </td>
    </tr>
    <tr>
        <td style="width: 126px">
            quastion
                    grade</td>
        <td style="width: 100px">
            <asp:TextBox ID="TextBox2" runat="server"></asp:TextBox></td>
        <td style="width: 104px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="TextBox2"
                Display="Dynamic" ErrorMessage="enter quastion grade" ValidationGroup="addqu">*</asp:RequiredFieldValidator>
            <asp:RangeValidator ID="RangeValidator1" runat="server" ControlToValidate="TextBox2"
                Display="Dynamic" ErrorMessage="invalid quastion grade" ValidationGroup="addqu" MaximumValue="100" MinimumValue="0" Type="Integer">*</asp:RangeValidator></td>
    </tr>
    <tr>
        <td style="width: 126px">
                    subject</td>
        <td style="width: 100px">
            <asp:ListBox ID="ListBox3" runat="server" DataSourceID="SqlDataSource1" DataTextField="suname"
                DataValueField="suid" Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource1"
                    runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT subject.suid, subject.suname FROM subject INNER JOIN teacher_subject ON subject.suid = teacher_subject.suid WHERE (teacher_subject.active = 'active') AND &#13;&#10;(subject.active = 'active') AND (teacher_subject.tid = @tid) ORDER BY subject.suname">
                    <SelectParameters>
                        <asp:SessionParameter Name="tid" SessionField="id" />
                    </SelectParameters>
                </asp:SqlDataSource>
        </td>
        <td style="width: 104px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ListBox3"
                Display="Dynamic" ErrorMessage="choos subject" ValidationGroup="addqu">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 126px">
            first answer text</td>
        <td style="width: 100px">
            <asp:TextBox ID="TextBox3" runat="server" Height="152px" TextMode="MultiLine" Width="240px"></asp:TextBox></td>
        <td style="width: 104px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server" ControlToValidate="TextBox3"
                ErrorMessage="enter first answer text" ValidationGroup="addqu">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 126px">
            true</td>
        <td style="width: 100px">
            <asp:RadioButton ID="RadioButton1" runat="server" AutoPostBack="True" Checked="True"
                OnCheckedChanged="RadioButton1_CheckedChanged" Text="true" GroupName="1" /></td>
        <td style="width: 104px">
        </td>
    </tr>
    <tr>
        <td style="width: 126px">
            second answer text</td>
        <td style="width: 100px">
            <asp:TextBox ID="TextBox4" runat="server" Height="152px" TextMode="MultiLine" Width="240px"></asp:TextBox></td>
        <td style="width: 104px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server" ControlToValidate="TextBox4"
                ErrorMessage="enter first second text" ValidationGroup="addqu">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 126px">
            true</td>
        <td style="width: 100px">
            <asp:RadioButton ID="RadioButton2" runat="server" AutoPostBack="True" Text="true" GroupName="1" /></td>
        <td style="width: 104px">
        </td>
    </tr>
    <tr>
        <td style="width: 126px">
            third answer text</td>
        <td style="width: 100px">
            <asp:TextBox ID="TextBox5" runat="server" Height="152px" TextMode="MultiLine" Width="240px"></asp:TextBox></td>
        <td style="width: 104px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server" ControlToValidate="TextBox5"
                ErrorMessage="enter third answer text" ValidationGroup="addqu">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 126px; height: 22px">
            true</td>
        <td style="width: 100px; height: 22px">
            <asp:RadioButton ID="RadioButton3" runat="server" AutoPostBack="True" Text="true" /></td>
        <td style="width: 104px; height: 22px">
        </td>
    </tr>
    <tr>
        <td style="width: 126px">
            fourth answer text</td>
        <td style="width: 100px">
            <asp:TextBox ID="TextBox6" runat="server" Height="152px" TextMode="MultiLine" Width="240px"></asp:TextBox></td>
        <td style="width: 104px">
            <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server" ControlToValidate="TextBox6"
                ErrorMessage="enter fourth answer text" ValidationGroup="addqu">*</asp:RequiredFieldValidator></td>
    </tr>
    <tr>
        <td style="width: 126px">
            true</td>
        <td style="width: 100px">
            <asp:RadioButton ID="RadioButton4" runat="server" AutoPostBack="True" Text="true" GroupName="1" /></td>
        <td style="width: 104px">
        </td>
    </tr>
    <tr>
        <td style="width: 126px">
            <asp:Button ID="Button1" runat="server" Text="add" ValidationGroup="addqu" OnClick="Button1_Click" /></td>
        <td style="width: 100px">
        </td>
        <td style="width: 104px">
        </td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:Label ID="Label1" runat="server" Text="Label" Visible="False"></asp:Label></td>
    </tr>
    <tr>
        <td colspan="3">
            <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                ValidationGroup="addqu" />
        </td>
    </tr>
</table>
