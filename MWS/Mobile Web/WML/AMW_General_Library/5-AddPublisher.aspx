<%@ Page Language="C#" AutoEventWireup="true" CodeFile="5-AddPublisher.aspx.cs" Inherits="_5_AddPublisher" %>

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
        string PName = Request["PName"]; ;
        string City = Request["City"]; ;

        string ConnectionString = System.Configuration.ConfigurationManager.ConnectionStrings["GrlLibCon"].ConnectionString;
        
        System.Data.SqlClient.SqlConnection con = new System.Data.SqlClient.SqlConnection(ConnectionString);

        string query = "insert into Publisher (PName,City) values (@PName, @City) ";
        System.Data.SqlClient.SqlCommand cmd = new System.Data.SqlClient.SqlCommand(query, con);

        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@PName", System.Data.SqlDbType.NVarChar, 50));
        cmd.Parameters["@PName"].Value = PName;
        cmd.Parameters.Add(new System.Data.SqlClient.SqlParameter("@City", System.Data.SqlDbType.NVarChar, 20));
        cmd.Parameters["@City"].Value = City;
        
        try
        {
            con.Open();
            cmd.ExecuteNonQuery();
            Response.Write("Publisher Added Succefully.<br/>");
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
