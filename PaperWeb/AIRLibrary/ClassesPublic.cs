using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;
using System.Collections;
using AIRLibrary;
using System.Web.Configuration;
using System.Web;
using System.IO;

namespace AIRLibrary
{
    public class ClassesPublic
    {

        private string connectionString1;
        string path;
        public ClassesPublic()
        {
            //connectionString1 = "Data Source=AMIR-PC;Initial Catalog=my_data;Integrated Security=True";
            connectionString1 = WebConfigurationManager.ConnectionStrings["ConSTR"].ConnectionString;
            path = System.Web.Hosting.HostingEnvironment.MapPath("~/Data/");      
            
        }


        public string GetDocValue(string doc_name)
        {
            string ValueDoc;
            SqlConnection con = new SqlConnection(connectionString1);
            SqlCommand cmd = new SqlCommand("GetDocValue", con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.Parameters.Add(new SqlParameter("@doc_name", SqlDbType.NVarChar));
            cmd.Parameters["@doc_name"].Value = doc_name;
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                ValueDoc = reader[1].ToString();
                    reader.Close();
                    return ValueDoc;

            }
            catch (SqlException err)
            {
                throw new ApplicationException("Data error." + err);
            }
            finally
            {

                con.Close();
            }
        }

        public int GetDocCount()
        {
            int docCount;
            SqlConnection con = new SqlConnection(connectionString1);
            SqlCommand cmd = new SqlCommand("CountDoc", con);
            cmd.CommandType = CommandType.StoredProcedure;
            try
            {
                con.Open();
                SqlDataReader reader = cmd.ExecuteReader();
                reader.Read();
                docCount = Convert.ToInt32(reader[0]);
                reader.Close();
                return docCount;

            }
            catch (SqlException err)
            {
                throw new ApplicationException("Data error." + err);
            }
            finally
            {

                con.Close();
            }
        }

        public bool DeleteDoc()
        {
            bool status = false;
            SqlConnection con = new SqlConnection(connectionString1);
            SqlCommand cmd = new SqlCommand("DeleteDoc", con);
            cmd.CommandType = CommandType.StoredProcedure;

            try
            {
                con.Open();
                cmd.ExecuteNonQuery();
            }
            catch (SqlException err)
            {

                throw new ApplicationException("Data error." + err);
            }
            finally
            {
                con.Close();
                status = true;
            }
            return status;

        }

        public bool AddDocuments()
        {
            DirectoryInfo dir = new DirectoryInfo(path);
            FileInfo[] imageFiles = dir.GetFiles();
            
            bool status = true;
            for (int i = 0; i < imageFiles.Length; i++)
            {
                GetWordsFromDoc getword = new GetWordsFromDoc();
                string MyTerms = getword.GetWords(path + imageFiles[i].ToString());
                
                SqlConnection con = new SqlConnection(connectionString1);
                SqlCommand cmd = new SqlCommand("AddValueDoc", con);
                cmd.CommandType = CommandType.StoredProcedure;
                cmd.Parameters.Add(new SqlParameter("@doc_name", SqlDbType.NVarChar));
                cmd.Parameters.Add(new SqlParameter("@doc_value", SqlDbType.NVarChar));

                try
                {
                    con.Open();

                    cmd.Parameters["@doc_name"].Value = imageFiles[i].ToString();
                    cmd.Parameters["@doc_value"].Value = MyTerms;
                    cmd.ExecuteNonQuery();
                    

                }
                catch (SqlException err)
                {
                    throw new ApplicationException("Data error." + err);
                }
                finally
                {
                    con.Close();

                }

            }

            return status;
        }

    }
}
