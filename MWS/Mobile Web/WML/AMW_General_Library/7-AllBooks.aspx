<%@ Page Language="C#" AutoEventWireup="true" CodeFile="7-AllBooks.aspx.cs" Inherits="_7_AllBooks" %>

<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">

<wml>
<head>


</head>
<card>

<% 
       Response.ContentType = "text/vnd.wap.wml";
       string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
       System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);

       string query = "select * from [Book] ";
       System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);
       
       try
       {
           con.Open();
           System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
           Response.Write("<b><big>" + "All Books</big></b> <br/><table><tr><td><b><i>Title</i></b></td><td><b><i>Type</i></b></td><td><b><i>Price</i></b></td></tr>");
           while (reader.Read())
           {
               Response.Write("<tr><td><anchor><go method='post' href='8-BookInfo.aspx'><postfield name='Id' value='" + reader[0].ToString() + "'/></go>" + reader[1].ToString() + "</anchor></td><td>" + reader[2].ToString() + "</td><td>" + reader[3].ToString() + "</td></tr>");
           }
           reader.Close();
       }
       catch (Exception err)
       {
           Response.Write(err.Message);
       }
       finally
       {
           Response.Write("</table>");
           con.Close();
       }

    
        %>
</card>
</wml>
