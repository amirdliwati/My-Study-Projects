<%@ Page Language="C#" AutoEventWireup="true" CodeFile="exam.aspx.cs" Inherits="exam" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>Untitled Page</title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        &nbsp;
        <asp:Panel ID="Panel1" runat="server" Height="50px" Width="125px">
            <table>
                <tr>
                    <td style="width: 100px">
                        subject</td>
                    <td style="width: 100px">
                        <asp:ListBox ID="ListBox1" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource1"
                            DataTextField="suname" DataValueField="suid" Rows="1"></asp:ListBox><asp:SqlDataSource
                                ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT subject.suid, subject.suname FROM subject INNER JOIN subject_student ON subject.suid = subject_student.suid WHERE (subject.active = 'active') AND (subject_student.active = 'active') AND (subject_student.sid = @sid)">
                                <SelectParameters>
                                    <asp:SessionParameter Name="sid" SessionField="id" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                    </td>
                    <td style="width: 100px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" ControlToValidate="ListBox1"
                            Display="Dynamic" ErrorMessage="choos subject" ValidationGroup="stex">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        exam</td>
                    <td style="width: 100px">
                        <asp:ListBox ID="ListBox2" runat="server" AutoPostBack="True" DataSourceID="SqlDataSource2"
                            DataTextField="exname" DataValueField="exid" Rows="1"></asp:ListBox><asp:SqlDataSource
                                ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                                SelectCommand="SELECT exam.exname, exam.exid FROM exam INNER JOIN subject ON exam.suid = subject.suid WHERE (exam.active = 'active') AND (subject.suid = @sid) ORDER BY exam.exname">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBox1" Name="sid" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                    </td>
                    <td style="width: 100px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="ListBox2"
                            Display="Dynamic" ErrorMessage="choos exam" ValidationGroup="stex">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                        exam form</td>
                    <td style="width: 100px">
                        <asp:ListBox ID="ListBox3" runat="server" DataSourceID="SqlDataSource3" DataTextField="formname"
                            DataValueField="efid" Rows="1"></asp:ListBox><asp:SqlDataSource ID="SqlDataSource3"
                                runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>" SelectCommand="SELECT examform.efid, examform.formname FROM examform INNER JOIN exam ON examform.exid = exam.exid WHERE (examform.active = 'active') AND (exam.exid = @exid) ORDER BY examform.formname">
                                <SelectParameters>
                                    <asp:ControlParameter ControlID="ListBox2" Name="exid" PropertyName="SelectedValue" />
                                </SelectParameters>
                            </asp:SqlDataSource>
                    </td>
                    <td style="width: 100px">
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" ControlToValidate="ListBox3"
                            Display="Dynamic" ErrorMessage="choos form" ValidationGroup="stex">*</asp:RequiredFieldValidator></td>
                </tr>
                <tr>
                    <td style="width: 100px">
                    </td>
                    <td style="width: 100px">
                        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" Text="start" ValidationGroup="stex" /></td>
                    <td style="width: 100px">
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ShowMessageBox="True"
                            ValidationGroup="stex" />
                    </td>
                </tr>
                <tr>
                    <td colspan="3">
                    </td>
                </tr>
            </table>
        </asp:Panel>
        <asp:Panel ID="Panel2" runat="server" Height="50px" Visible="False" Width="125px">
            &nbsp;<table style="width: 683px; height: 159px">
                <tr>
                    <td rowspan="7" style="width: 55px">
                        <asp:ListBox ID="ListBox4" runat="server" AutoPostBack="True" OnSelectedIndexChanged="ListBox4_SelectedIndexChanged"
                            Width="47px"></asp:ListBox></td>
                    <td colspan="2" style="text-align: left">
                        <asp:FormView ID="FormView1" runat="server" DataSourceID="SqlDataSource4">
                            <EditItemTemplate>
                                qtext:
                                <asp:TextBox ID="qtextTextBox" runat="server" Text='<%# Bind("qtext") %>'>
                        </asp:TextBox><br />
                                <asp:LinkButton ID="UpdateButton" runat="server" CausesValidation="True" CommandName="Update"
                                    Text="Update">
                        </asp:LinkButton>
                                <asp:LinkButton ID="UpdateCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel">
                        </asp:LinkButton>
                            </EditItemTemplate>
                            <InsertItemTemplate>
                                qtext:
                                <asp:TextBox ID="qtextTextBox" runat="server" Text='<%# Bind("qtext") %>'>
                        </asp:TextBox><br />
                                <asp:LinkButton ID="InsertButton" runat="server" CausesValidation="True" CommandName="Insert"
                                    Text="Insert">
                        </asp:LinkButton>
                                <asp:LinkButton ID="InsertCancelButton" runat="server" CausesValidation="False" CommandName="Cancel"
                                    Text="Cancel">
                        </asp:LinkButton>
                            </InsertItemTemplate>
                            <ItemTemplate>
                                &nbsp;<table style="width: 100%">
                                    <tr>
                                        <td style="width: 100px">
                                            quastion text</td>
                                        <td style="width: 100px">
                                <asp:Label ID="qtextLabel" runat="server" Text='<%# Bind("qtext") %>'></asp:Label></td>
                                    </tr>
                                    <tr>
                                        <td style="width: 100px">
                                            quastion mark</td>
                                        <td style="width: 100px">
                                            <asp:Label ID="Label2" runat="server" Text='<%# Eval("qgrade") %>'></asp:Label></td>
                                    </tr>
                                </table>
                                <br />
                            </ItemTemplate>
                        </asp:FormView>
                    </td>
                </tr>
                <tr>
                    <td colspan="2" rowspan="2" style="text-align: left">
                        <asp:RadioButtonList ID="RadioButtonList1" runat="server" DataSourceID="SqlDataSource5"
                            DataTextField="antext" DataValueField="anid" Visible="False">
                        </asp:RadioButtonList></td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td colspan="2" rowspan="2" style="text-align: left">
                        <asp:CheckBoxList ID="CheckBoxList1" runat="server" DataSourceID="SqlDataSource5"
                            DataTextField="antext" DataValueField="anid" Visible="False">
                        </asp:CheckBoxList></td>
                </tr>
                <tr>
                </tr>
                <tr>
                    <td colspan="2" rowspan="1" style="text-align: left">
                        <asp:TextBox ID="TextBox1" runat="server" Height="203px" TextMode="MultiLine" Visible="False"
                            Width="298px"></asp:TextBox></td>
                </tr>
                <tr>
                    <td colspan="2" rowspan="1" style="text-align: left">
                        <asp:Button ID="Button2" runat="server" OnClick="Button2_Click" Text="answer" />
                        <asp:Label ID="Label1" runat="server" Text="Label"></asp:Label></td>
                </tr>
                <tr>
                    <td rowspan="1" style="width: 55px; height: 45px">
                    </td>
                    <td colspan="2" rowspan="1" style="height: 45px; text-align: left">
                        &nbsp;<asp:Button ID="Button4" runat="server" OnClick="Button4_Click" Text="submit" /><br />
                    </td>
                </tr>
            </table>
            <br />
            <asp:SqlDataSource ID="SqlDataSource4" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT qtext, qgrade FROM quastion WHERE (qid = @qid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox4" Name="qid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            <asp:SqlDataSource ID="SqlDataSource5" runat="server" ConnectionString="<%$ ConnectionStrings:ConnectionString %>"
                SelectCommand="SELECT anid, antext FROM anser WHERE (qid = @qid)">
                <SelectParameters>
                    <asp:ControlParameter ControlID="ListBox4" Name="qid" PropertyName="SelectedValue" />
                </SelectParameters>
            </asp:SqlDataSource>
            &nbsp;
        </asp:Panel>
            <asp:Panel ID="Panel3" runat="server" Height="50px" Visible="False" Width="125px">
                &nbsp;<asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">log out</asp:LinkButton></asp:Panel>
    
    </div>
    </form>
</body>
</html>
