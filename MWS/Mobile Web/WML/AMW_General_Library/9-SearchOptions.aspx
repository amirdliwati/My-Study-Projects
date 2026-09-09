<%@ Page Language="C#" AutoEventWireup="true" CodeFile="9-SearchOptions.aspx.cs" Inherits="_9_SearchOptions" %>
<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">

<% 
    Response.ContentType = "text/vnd.wap.wml";
%>

<wml>
<head>


</head>
<card id="Search">
    <big><b>Search for a/an:</b></big>
    <br />
    <anchor>
        <go method='post' href='#Search4BookF'>
        </go>1. Book
        </anchor><br />
        <anchor>
        <go method='post' href='#Search4PublisherF'>
        </go>2. Publisher
        </anchor><br />
        <anchor>
        <go method='post' href='#Search4AuthorF'>
        </go>3. Author
        </anchor> <br/><br/>
</card>

<card id="Search4BookF" title="Search for a Book">
        <b> Search : </b> <br />
Book Title :<input type="text" name="Title" maxlength="20"/> <br />

           <do type="accept" label="Search">
            <go href="10-Search4Book.aspx" method="post">
            <postfield name="Title" value="$Title" />
            </go>
            </do>
</card>

<card id="Search4PublisherF"title="Search for a Publisher">
        <b> Search : </b> <br />
Publisher Name :<input type="text" name="PName" maxlength="20"/> <br />

           <do type="accept" label="Search">
            <go href="11-Search4Publisher.aspx" method="post">
            <postfield name="PName" value="$PName" />
            </go>
            </do>
</card>

<card id="Search4AuthorF"title="Search for an Author">
        <b> Search : </b> <br />
Author Name :<input type="text" name="FLname" maxlength="20"/> <br />

           <do type="accept" label="Search">
            <go href="12-Search4Author.aspx" method="post">
            <postfield name="FLname" value="$FLname" />
            </go>
            </do>
</card>

</wml>
