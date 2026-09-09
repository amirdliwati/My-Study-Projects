using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;


namespace MyLibrary
{
   public interface IMyCompany
    {

        DataTable GetJobsForCompany(int id);
        DataTable GetDiplomForCandidate(int id);
        DataTable getdata();


    }
}
