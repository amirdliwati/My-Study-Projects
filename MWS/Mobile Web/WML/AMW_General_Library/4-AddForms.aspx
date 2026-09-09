<%@ Page Language="C#" AutoEventWireup="true" CodeFile="4-AddForms.aspx.cs" Inherits="_4_AddForms" %>
<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">

<% 
    Response.ContentType = "text/vnd.wap.wml";
%>

<wml>
<head>


</head>
<card id="AddBook" title="Add Book">
    <% 
        int userId = Convert.ToInt32(Request["userId"]);
        %>
        <b> Add New Book </b> <br />
Title :<input type="text" name="Title" maxlength="20"/> <br />
Type  :<input type="text" name="Type" maxlength="20"/> <br />
Price :<input type="text" name="Price" /> <br />
Publisher : <select name="pubId">
<%
    string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);

    string query = "select * from [Publisher]";
    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);
    
    con.Open();
    System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
    try
    {
        while (reader.Read())
        {
            Response.Write("<option value=" + reader[0].ToString() + ">" + reader[1].ToString() + "</option>");
        }
    }
    catch (Exception err)
    {
        Response.Write(err.Message);
    }
    finally
    {
        reader.Close();
        con.Close();
    }
        
        
     %>

</select> <br />

Author :  <select name="AuthorId">
<%
    string ConnectionString1 = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
    System.Data.SqlClient.SqlConnection con1 = new System.Data.SqlClient.SqlConnection(ConnectionString1);

    string query1 = "select * from [Author]";
    System.Data.SqlClient.SqlCommand cmd1 = new System.Data.SqlClient.SqlCommand(query1, con1);
    
    con1.Open();
    System.Data.SqlClient.SqlDataReader reader1 = cmd1.ExecuteReader();
    try
    {
        while (reader1.Read())
        {
            Response.Write("<option value=" + reader1[0].ToString() + ">" + reader1[1].ToString() + " " + reader1[2].ToString() + "</option>");
        }
    }
    catch (Exception err)
    {
        Response.Write(err.Message);
    }
    finally
    {
        reader1.Close();
        con1.Close();
    }
        
        
     %>
</select><br />


           <do type="accept" label="Add Book">
            <go href="4-AddBook.aspx" method="post">
            <postfield name="Title" value="$Title" />
            <postfield name="Type" value="$Type" />
            <postfield name="Price" value="$Price" />
            <postfield name="pubId" value="$pubId" />
            <postfield name="AuthorId" value="$AuthorId" />
            </go>
            
            </do>



</card>

<card id="AddPublisher" title="Add Publisher">
        <b> Add New Publisher </b> <br />
Name :<input type="text" name="PName" maxlength="50"/> <br />
City  :<input type="text" name="City" maxlength="20"/> <br />


           <do type="accept" label="Add Publisher">
            <go href="5-AddPublisher.aspx" method="post">
            <postfield name="PName" value="$PName" />
            <postfield name="City" value="$City" />
            </go>
            
            </do>
</card>

<card id="AddAuthor" title="Add Author">
        <b> Add New Author </b> <br />
First Name :<input type="text" name="Fname" maxlength="20"/> <br />
Last Name  :<input type="text" name="Lname" maxlength="20"/> <br />
Country    :<input type="text" name="Country" maxlength="20"/> <br />
City       :<input type="text" name="City" maxlength="20"/> <br />
Address    :<input type="text" name="Address" maxlength="40"/> <br />


           <do type="accept" label="Add Author">
            <go href="6-AddAuthor.aspx" method="post">
            <postfield name="Fname" value="$Fname" />
            <postfield name="Lname" value="$Lname" />
            <postfield name="Country" value="$Country" />
            <postfield name="City" value="$City" />
            <postfield name="Address" value="$Address" />
            </go>
            </do>
</card>
</wml>
