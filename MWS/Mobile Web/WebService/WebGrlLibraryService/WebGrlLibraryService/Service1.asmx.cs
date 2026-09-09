using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Services;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;

namespace WebGrlLibraryService
{
    /// <summary>
    /// Summary description for Service1
    /// </summary>
    [WebService(Namespace = "http://tempuri.org/")]
    [WebServiceBinding(ConformsTo = WsiProfiles.BasicProfile1_1)]
    [System.ComponentModel.ToolboxItem(false)]
    // To allow this Web Service to be called from script, using ASP.NET AJAX, uncomment the following line. 
    // [System.Web.Script.Services.ScriptService]
    public class Service1 : System.Web.Services.WebService
    {

        private string connectionString;

        public Service1()
        {
            connectionString = ConfigurationManager.ConnectionStrings["GrlLibrary"].ConnectionString;
            //Uncomment the following line if using designed components 
            //InitializeComponent(); 
        }

        public Service1(string connectionString)
        {
            this.connectionString = connectionString;
        }


        [WebMethod]
        public int verifylogin(string Usename, string password)
        {
            int userId = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("VerifyLogin", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("@Username", SqlDbType.NVarChar, 250));
            cmd.Parameters["@Username"].Value = Usename;
            cmd.Parameters.Add(new SqlParameter("@password", SqlDbType.NVarChar, 250));
            cmd.Parameters["@password"].Value = password;



            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();

                if (reader.Read())
                {
                    userId = Convert.ToInt32(reader[0]);
                }
                reader.Close();
            }
            catch
            {
                throw new ApplicationException("Data error.");
            }
            finally
            {
                con.Close();
            }


            return userId;
        }

        [WebMethod]
        public int? signup(string Username, string password, string FName, string LName)
        {
            int? ok = 0;
            SqlConnection conchk = new SqlConnection(connectionString);
            SqlCommand cmdchk = new SqlCommand("ChkName", conchk);
            cmdchk.CommandType = CommandType.StoredProcedure;

            cmdchk.Parameters.Add(new SqlParameter("Username", SqlDbType.NVarChar, 250));
            cmdchk.Parameters["Username"].Value = Username;
            try
            {
                conchk.Open();
                SqlDataReader readerchk = cmdchk.ExecuteReader();

                if (readerchk.Read())
                {
                    readerchk.Close();
                    return ok;
                }
                else
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    SqlCommand cmd = new SqlCommand("SignUp", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("Username", SqlDbType.NVarChar, 250));
                    cmd.Parameters["Username"].Value = Username;
                    cmd.Parameters.Add(new SqlParameter("password", SqlDbType.NVarChar, 250));
                    cmd.Parameters["password"].Value = password;
                    cmd.Parameters.Add(new SqlParameter("FName", SqlDbType.NVarChar, 250));
                    cmd.Parameters["FName"].Value = FName;
                    cmd.Parameters.Add(new SqlParameter("LName", SqlDbType.NVarChar, 250));
                    cmd.Parameters["LName"].Value = LName;

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        //return (int)cmd.Parameters["Iid"].Value;
                        return 1;
                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            finally
            {
                conchk.Close();
            }
        }

        [WebMethod]
        public int? AddBook(string Title, string Type, int Price, int pubId, int AuthorId)
        {
            int? ok = 0;
            SqlConnection conchk = new SqlConnection(connectionString);
            SqlCommand cmdchk = new SqlCommand("ChkNameBook", conchk);
            cmdchk.CommandType = CommandType.StoredProcedure;

            cmdchk.Parameters.Add(new SqlParameter("Title", SqlDbType.NVarChar, 250));
            cmdchk.Parameters["Title"].Value = Title;
            try
            {
                conchk.Open();
                SqlDataReader readerchk = cmdchk.ExecuteReader();

                if (readerchk.Read())
                {
                    readerchk.Close();
                    return ok;
                }
                else
                {
                    SqlConnection con = new SqlConnection(connectionString);
                    SqlCommand cmd = new SqlCommand("AddBook", con);
                    cmd.CommandType = CommandType.StoredProcedure;

                    cmd.Parameters.Add(new SqlParameter("Title", SqlDbType.NVarChar, 250));
                    cmd.Parameters["Title"].Value = Title;
                    cmd.Parameters.Add(new SqlParameter("Type", SqlDbType.NVarChar, 250));
                    cmd.Parameters["Type"].Value = Type;
                    cmd.Parameters.Add(new SqlParameter("Price", SqlDbType.NVarChar, 250));
                    cmd.Parameters["Price"].Value = Price;
                    cmd.Parameters.Add(new SqlParameter("pubId", SqlDbType.Int));
                    cmd.Parameters["pubId"].Value = pubId;
                    cmd.Parameters.Add(new SqlParameter("AuthorId", SqlDbType.Int));
                    cmd.Parameters["AuthorId"].Value = AuthorId;
                    cmd.Parameters.Add(new SqlParameter("Id", SqlDbType.Int));
                    cmd.Parameters["Id"].Direction = ParameterDirection.Output;

                    try
                    {
                        con.Open();
                        cmd.ExecuteNonQuery();
                        return (int)cmd.Parameters["Id"].Value;

                    }
                    finally
                    {
                        con.Close();
                    }
                }
            }
            finally
            {
                conchk.Close();
            }
        }

        [WebMethod]
        public int? AddAuthor(string Fname, string Lname, string Country, string City, string Address)
        {

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("AddAuthor", con);
            cmd.CommandType = CommandType.StoredProcedure;

            cmd.Parameters.Add(new SqlParameter("Fname", SqlDbType.NVarChar, 250));
            cmd.Parameters["Fname"].Value = Fname;
            cmd.Parameters.Add(new SqlParameter("Lname", SqlDbType.NVarChar, 250));
            cmd.Parameters["Lname"].Value = Lname;
            cmd.Parameters.Add(new SqlParameter("Country", SqlDbType.NVarChar, 250));
            cmd.Parameters["Country"].Value = Country;
            cmd.Parameters.Add(new SqlParameter("City", SqlDbType.NVarChar, 250));
            cmd.Parameters["City"].Value = City;
            cmd.Parameters.Add(new SqlParameter("Address", SqlDbType.NVarChar, 250));
            cmd.Parameters["Address"].Value = Address;
            cmd.Parameters.Add(new SqlParameter("Id", SqlDbType.Int));
            cmd.Parameters["Id"].Direction = ParameterDirection.Output;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["Id"].Value;

            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public int? AddPublisher(string PName, string City)
        {

            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("AddPublisher", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("PName", SqlDbType.NVarChar, 250));
            cmd.Parameters["PName"].Value = PName;
            cmd.Parameters.Add(new SqlParameter("City", SqlDbType.NVarChar, 250));
            cmd.Parameters["City"].Value = City;
            cmd.Parameters.Add(new SqlParameter("Id", SqlDbType.Int));
            cmd.Parameters["Id"].Direction = ParameterDirection.Output;


            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
                return (int)cmd.Parameters["Id"].Value;

            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetAllBook()
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("AllBook", con);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add(reader[1].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetAllAuthor()
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetAllAuthor", con);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add(reader[1].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetAllPublisher()
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("AllPublisher", con);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add(reader[1].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetDetailsBookByTitle(string Title)
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetDetailsBookByTitle", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("Title", System.Data.SqlDbType.NVarChar, 250));
            cmd.Parameters["Title"].Value = Title;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add(reader[1].ToString() + "@" + reader[2].ToString() + "@" + reader[3].ToString() + "@" + reader[4].ToString() + "@" + reader[5].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetDetailsListBookByTitle(string Title)
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetDetailsListBookByTitle", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@Title", System.Data.SqlDbType.NVarChar, 250));
            cmd.Parameters["@Title"].Value = Title;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add(reader[0].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetDetailsListAuthor(string Name)
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetDetailsListAuthor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("Name", System.Data.SqlDbType.NVarChar, 250));
            cmd.Parameters["Name"].Value = Name;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add(reader[0].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetDetailsListPublisher(string Name)
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetDetailsListPublisher", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("Name", System.Data.SqlDbType.NVarChar, 250));
            cmd.Parameters["Name"].Value = Name;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add(reader[0].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetBookForAuthor(string Name)
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetBookForAuthor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("Name", System.Data.SqlDbType.NVarChar));
            cmd.Parameters["Name"].Value = Name;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add("@" + reader[0].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public List<string> GetBookForPublisher(string Name)
        {
            List<string> Lst = new List<string>();
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetBookForPublisher", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("Name", System.Data.SqlDbType.NVarChar));
            cmd.Parameters["Name"].Value = Name;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    Lst.Add("@" + reader[0].ToString());
                }
                reader.Close();
                return Lst;
            }
            finally
            {
                con.Close();
            }

        }

        [WebMethod]
        public int GetIdauthor(string Name)
        {
            int userId = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetIdauthor", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("Name", System.Data.SqlDbType.NVarChar, 250));
            cmd.Parameters["Name"].Value = Name;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    userId = Convert.ToInt32(reader[0]);
                }
                reader.Close();
                
            }
            finally
            {
                con.Close();
            }

            return userId;
        }

        [WebMethod]
        public int GetIdpublisher(string Name)
        {
            int userId = 0;
            SqlConnection con = new SqlConnection(connectionString);
            SqlCommand cmd = new SqlCommand("GetIdpublisher", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("Name", System.Data.SqlDbType.NVarChar, 250));
            cmd.Parameters["Name"].Value = Name;

            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                while (reader.Read())
                {
                    userId = Convert.ToInt32(reader[0]);
                }
                reader.Close();
                
            }
            finally
            {
                con.Close();
            }

            return userId;
        }

    }
}
