<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true"
    CodeBehind="Default.aspx.cs" Inherits="MyWeb._Default" %>

<asp:Content ID="HeaderContent" runat="server" ContentPlaceHolderID="HeadContent">
    <style type="text/css">
        .style1
        {
            text-align: center;
            text-decoration: underline;
            color: #0066FF;
        }
    </style>
</asp:Content>
<asp:Content ID="BodyContent" runat="server" ContentPlaceHolderID="MainContent">
    <h2>
        Welcome you!
    </h2>
    <p>
        Enter User Name :&nbsp;
        <asp:TextBox ID="TextBox1" runat="server"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ControlToValidate="TextBox1" ErrorMessage="NULL!!!" ForeColor="Red" 
            ValidationGroup="Lo">*</asp:RequiredFieldValidator>
    </p>
    <p>
        &nbsp;Enter Password :&nbsp;&nbsp; 
        <asp:TextBox ID="TextBox2" runat="server" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ControlToValidate="TextBox2" ErrorMessage="NULL!!!" ForeColor="Red" 
            ValidationGroup="Lo">*</asp:RequiredFieldValidator>
    </p>
    <p>
        <asp:Button ID="Button1" runat="server" onclick="Button1_Click" Text="LogIn" 
            ValidationGroup="Lo" />
    &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Label ID="Label1" runat="server"></asp:Label>
    </p>
    <p>
        <span style="font-size:11.0pt;line-height:115%;
font-family:&quot;Calibri&quot;,&quot;sans-serif&quot;;mso-fareast-font-family:Calibri;mso-bidi-font-family:
Arial;mso-ansi-language:EN-US;mso-fareast-language:EN-US;mso-bidi-language:
AR-SY"> To&nbsp; sign up&nbsp; Click Here
        <asp:LinkButton ID="LinkButton1" runat="server" PostBackUrl="~/sign up.aspx">Sign Up</asp:LinkButton>
        </span>&nbsp;.
    </p>
    <p class="style1">
        <strong><em>MWS Project For ADP</em></strong></p>
</asp:Content>
