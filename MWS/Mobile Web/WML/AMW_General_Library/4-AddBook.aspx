<%@ Page Language="C#" AutoEventWireup="true" CodeFile="4-AddBook.aspx.cs" Inherits="_4_AddBook" %>

<?xml version="1.0"?>

<!DOCTYPE wml PUBLIC "-//WAPFORUM//DTD WML 1.1//EN" "http://www.WAPforum.org/DTD/wml_1.1.xml">
<% 
    Response.ContentType = "text/vnd.wap.wml";
%>
<wml>
<head>


</head>
<card >
<% 
        string Title = Request["Title"]; ;
        string Type = Request["Type"]; ;
        int Price = Convert.ToInt32(Request["Price"]);
        int pubId = Convert.ToInt32(Request["pubId"]);
        int AuthorId = Convert.ToInt32(Request["AuthorId"]);

        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
        
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);

        string query = "insert into Book (Title,Type,Price,pubId,AuthorId) values (@Title, @Type, @Price, @pubId, @AuthorId) ";
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);

        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Title", System.Data.SqlDbType.NVarChar, 20));
        cmd.Parameters["@Title"].Value = Title;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Type", System.Data.SqlDbType.NVarChar, 20));
        cmd.Parameters["@Type"].Value = Type;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@Price", System.Data.SqlDbType.Int,4));
        cmd.Parameters["@Price"].Value = Price;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@pubId", System.Data.SqlDbType.Int,4));
        cmd.Parameters["@pubId"].Value = pubId;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@AuthorId", System.Data.SqlDbType.Int,4));
        cmd.Parameters["@AuthorId"].Value = AuthorId;
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("Book Added Succefully.<br/>");
        }
        catch (Exception err)
        {
            Response.Write(err.Message);
        }
        finally
        {
            con.Close();
            Response.Write("<anchor>go to previous page <prev /></anchor>");
        }
        %>
</card>
</wml>
