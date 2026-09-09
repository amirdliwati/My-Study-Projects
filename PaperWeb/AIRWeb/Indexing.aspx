<%@ Page Title="" Language="C#" MasterPageFile="~/Site1.Master" AutoEventWireup="true"
    CodeBehind="Indexing.aspx.cs" Inherits="AIRWeb.Indexing" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <style type="text/css">
        .style11
        {
            color: #FFFFCC;
            font-size: large;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" runat="server">
        <ContentTemplate>
            <div class="style3">
                <br />
                <strong>
                    <asp:Label ID="Label1" runat="server" CssClass="style11" Text="Choose Type of Indexing:"></asp:Label>
                    <br />
                </strong>&nbsp;<div>
                    <asp:RadioButtonList ID="RadioButtonList1" runat="server" RepeatDirection="Horizontal"
                        Style="font-family: Andalus; font-size: large; font-weight: 700; color: #FFFFCC;"
                        RepeatLayout="Flow">
                        <asp:ListItem Selected="True">English</asp:ListItem>
                        <asp:ListItem>Arabic</asp:ListItem>
                    </asp:RadioButtonList>
                </div>
                &nbsp;&nbsp;&nbsp;&nbsp;
                <asp:UpdateProgress ID="UpdateProgress1" runat="server" DynamicLayout=false>
                    <ProgressTemplate>
                        <img src="Images/1.gif" alt="Images/1.gif" style="width: 246px; height: 18px" />
                    </ProgressTemplate>
                </asp:UpdateProgress>
                <p>
                    <asp:Button ID="Button1" runat="server" class="form-control" 
                        OnClick="Button2_Click" Text="Start Indexing" Width="246px" />
                </p>
                <p>
                    <asp:Label ID="Label2" runat="server"></asp:Label>
                </p>
                <br />
                <p>
                </p>
                <p>
                </p>
                <p>
                </p>
            </div>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
