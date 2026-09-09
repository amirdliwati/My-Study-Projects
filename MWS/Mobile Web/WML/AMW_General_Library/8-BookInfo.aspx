<%@ Page Language="C#" AutoEventWireup="true" CodeFile="8-BookInfo.aspx.cs" Inherits="_8_BookInfo" %>

<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">

<wml>
<head>

</head>
<card id="info" >
<% 
    Response.ContentType = "text/vnd.wap.wml";
    string Id = Request["Id"];
    string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
    System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);
    string sql = "select Book.Title ,Book.Type ,Book.Price ,Publisher.PName ,Author.Fname from Book INNER JOIN Publisher ON Publisher.Id=Book.pubId INNER JOIN Author ON Author.Id=Book.AuthorId where Book.Id='" + Id + "'";
            
    System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(sql, con);
    try
    {
        con.Open();
        System.Data.SqlClient.SqlDataReader reader = cmd.ExecuteReader();
        if (reader.Read())
        {
            Response.Write("<b>Book Title :</b> " + reader[0].ToString() + "<br/><b>Book Type :</b> " + reader[1].ToString() + "<br/><b>Book Price :</b> " + reader[2].ToString() + "<br/><b><big>   Publisher Name : </big></b><br/>" + reader[3].ToString() + "<br/><b>Author Name :</b> " + reader[4].ToString() + "<br/>");
            Response.Write("<anchor><b>Go to previous page.</b> <br /> <prev /></anchor>");
            reader.Close();
        }
        else
        {
            Response.Write("Sorry, You cann't show details about this Book.<br /><br />");
            Response.Write("<anchor><b>Go to previous page.</b> <br /> <prev /></anchor>");
        }
    }
    catch (Exception err)
    {
        Response.Write(err.Message);
    }
    finally
    {
        con.Close();
    }  
    
           
    %>
         
</card>

</wml>