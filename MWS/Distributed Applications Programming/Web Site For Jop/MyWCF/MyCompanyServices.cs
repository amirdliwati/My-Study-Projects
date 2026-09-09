using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace MyWCF
{
    class MyCompanyServices : IMyCompany
    {

        public bool AddJobForCompany(MyCompany e)
        {
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("INSERT INTO Job (companyId, title, salary, requiredEducationLevel, requiredExperienceYears) VALUES (@companyId, @title, @salary, @requiredEducationLevel, @requiredExperienceYears)", mycon);            
            SqlParameter p = new SqlParameter("@companyId", Convert.ToInt32(e.ID));
            SqlParameter p1 = new SqlParameter("@title", Convert.ToString(e.Title));
            SqlParameter p2 = new SqlParameter("@salary", Convert.ToDecimal(e.Salary));
            SqlParameter p3 = new SqlParameter("@requiredEducationLevel", Convert.ToString(e.RequiredEducationLevel));
            SqlParameter p4 = new SqlParameter("@requiredExperienceYears", Convert.ToInt32(e.RequiredExperienceYears));
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p);
            com.Parameters.Add(p1);
            com.Parameters.Add(p2);
            com.Parameters.Add(p3);
            com.Parameters.Add(p4);
            SqlDataReader myreder = com.ExecuteReader();           
                mycon.Close();
                return true;                    
        }

        public bool AddDiplomaForCandidate(MyCompany e)
        {
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("INSERT INTO Diploma (candidateId, diplomaTitle) VALUES (@candidateId, @diplomaTitle)", mycon);
            SqlParameter p = new SqlParameter("@candidateId", Convert.ToInt32(e.ID));
            SqlParameter p1 = new SqlParameter("@diplomaTitle", Convert.ToString(e.DiplomaTitle));
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p);
            com.Parameters.Add(p1);
            SqlDataReader myreder = com.ExecuteReader();
            mycon.Close();
            return true;
        }

        public bool AddCompany(MyCompany e)
        {
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("INSERT INTO Company (cName, tel, login, password) VALUES (@cName, @tel, @login, @password)", mycon);
            SqlParameter p = new SqlParameter("@cName", Convert.ToString(e.FullName));
            SqlParameter p1 = new SqlParameter("@tel", Convert.ToInt64(e.tel));
            SqlParameter p2 = new SqlParameter("@login", Convert.ToString(e.login));
            SqlParameter p3 = new SqlParameter("@password", Convert.ToString(e.password));
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p);
            com.Parameters.Add(p1);
            com.Parameters.Add(p2);
            com.Parameters.Add(p3);
            SqlDataReader myreder = com.ExecuteReader();
            mycon.Close();
            return true; 
        }

        public bool SignUp(MyCompany e)
        {
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("INSERT INTO Candidate (login, password, fullName, tel , experienceYears) VALUES (@login, @password, @fullName, @tel , @experienceYears)", mycon);
            SqlParameter p = new SqlParameter("@login", Convert.ToString(e.login));
            SqlParameter p1 = new SqlParameter("@password", Convert.ToString(e.password));
            SqlParameter p2 = new SqlParameter("@fullName", Convert.ToString(e.FullName));
            SqlParameter p3 = new SqlParameter("@tel", Convert.ToInt32(e.tel));
            SqlParameter p4 = new SqlParameter("@experienceYears", Convert.ToInt32(e.experienceYears));
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p);
            com.Parameters.Add(p1);
            com.Parameters.Add(p2);
            com.Parameters.Add(p3);
            com.Parameters.Add(p4);
            SqlDataReader myreder = com.ExecuteReader();
            mycon.Close();
            return true; 
        }

        DataTable IMyCompany.GetJobsForCompany()
        {
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("select * from Job", mycon);
            com.CommandType = CommandType.Text;
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataTable dt = new DataTable();
            da.Fill(dt);
            mycon.Close();
            return dt;
        }

        public List<MyCompany> GetCandidate()
        {
            List<MyCompany> candidates = new List<MyCompany>();
            MyCompany m = new MyCompany();
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("SELECT fullName , experienceYears  FROM Candidate", mycon);
            com.CommandType = CommandType.Text;
            SqlDataReader myreder = com.ExecuteReader();
            if (myreder.HasRows == true)
            {
                while (myreder.Read())
                {
                    m = new MyCompany(myreder[0].ToString() , myreder.GetInt32(1));
                    candidates.Add(m);
                }
                mycon.Close();
                return candidates;
            }
            else
            {
                myreder.Close();
                mycon.Close();
                return null;
            }

            
        }

        public List<MyCompany> GetJobs()
        {
            List<MyCompany> candidates = new List<MyCompany>();
            MyCompany m = new MyCompany();
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("SELECT title , requiredExperienceYears  FROM Job", mycon);
            com.CommandType = CommandType.Text;
            SqlDataReader myreder = com.ExecuteReader();
            if (myreder.HasRows == true)
            {
                while (myreder.Read())
                {
                    m = new MyCompany(myreder[0].ToString(), myreder.GetInt32(1));
                    candidates.Add(m);
                }
                mycon.Close();
                return candidates;
            }
            else
            {
                myreder.Close();
                mycon.Close();
                return null;
            }
        }

        public List<MyCompany> GetJobForCandidates(int id)
        {
            List<MyCompany> candidates = new List<MyCompany>();
            MyCompany m = new MyCompany();
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("SELECT * FROM Job where requiredExperienceYears = @requiredExperienceYears ", mycon);
            SqlParameter p1 = new SqlParameter("@requiredExperienceYears", Convert.ToInt32(id));
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p1);
            SqlDataReader myreder = com.ExecuteReader();
            if (myreder.HasRows == true)
            {
                while (myreder.Read())
                {
                    m = new MyCompany(myreder.GetInt32(0), myreder.GetInt32(1), myreder[2].ToString(), myreder.GetDecimal(3), myreder[4].ToString(), myreder.GetInt32(5));
                    candidates.Add(m);
                }
                mycon.Close();
                return candidates;
            }
            else
            {
                myreder.Close();
                mycon.Close();
                return null;
            }
        }

        public List<MyCompany> GetCandidatesForJob(int id)
        {
            List<MyCompany> candidates = new List<MyCompany>();
            MyCompany m = new MyCompany();
            SqlConnection mycon = new SqlConnection(ConectionDB.x);
            mycon.Open();
            SqlCommand com = new SqlCommand("SELECT fullName FROM Candidate where experienceYears = @experienceYears ", mycon);
            SqlParameter p1 = new SqlParameter("@experienceYears", Convert.ToInt32(id));
            com.CommandType = CommandType.Text;
            com.Parameters.Add(p1);
            SqlDataReader myreder = com.ExecuteReader();
            if (myreder.HasRows == true)
            {
                while (myreder.Read())
                {
                    m = new MyCompany(myreder[0].ToString());
                    candidates.Add(m);
                }
                mycon.Close();
                return candidates;
            }
            else
            {
                myreder.Close();
                mycon.Close();
                return null;
            }
        }
    }
}





