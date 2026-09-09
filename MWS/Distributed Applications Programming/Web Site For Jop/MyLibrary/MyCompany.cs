using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Data.SqlClient;
using System.Data;

namespace MyLibrary
{
    [Serializable]
   public class MyCompany
    {
        public int i, ID, RequiredExperienceYears;
        public string Title, RequiredEducationLevel, DiplomaTitle;
        public decimal Salary;        
        
    }
}
