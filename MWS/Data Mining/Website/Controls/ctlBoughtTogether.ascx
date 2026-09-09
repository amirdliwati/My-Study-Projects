<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ctlBoughtTogether.ascx.cs" Inherits="Controls_ctlBoughtTogether" %>
<fieldset><legend>Frequently Bought Together</legend>
    <asp:DataList ID="DataList1" runat="server" DataKeyField="BookID" 
        RepeatColumns="3" RepeatDirection="Horizontal" >
        <ItemStyle VerticalAlign="Top" />
        <ItemTemplate>
            <asp:HyperLink runat="server" ID="lnkBook" NavigateUrl='<%# Eval("BookID","~/Book.aspx?bid={0}") %>'>
            <asp:Label ID="BookTitleLabel" runat="server" Text='<%# Eval("BookTitle") %>' />
            <br />
            <asp:Image ID="BookIDLabel" Width="100px" runat="server" ImageUrl='<%# Eval("BookID","~/Images_book/{0}.jpg") %>' />
            </asp:HyperLink>
            <br />
            <asp:Label ID="ISBNLabel" runat="server" Text='<%# Eval("ISBN") %>' />
            <br />

            Price:
            <asp:Label ID="BookPriceLabel" runat="server" Text='<%# Eval("BookPrice","{0:c}") %>' />
            <br />
            Read Count:
            <asp:Label ID="ReadCountLabel" runat="server" Text='<%# Eval("ReadCount") %>' />
            <br />
            PublisherName:
            <asp:Label ID="PublisherNameLabel" runat="server" 
                Text='<%# Eval("PublisherName") %>' />
        </ItemTemplate>
    </asp:DataList>
</fieldset>