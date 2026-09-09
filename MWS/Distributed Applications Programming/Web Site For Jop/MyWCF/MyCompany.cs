using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Serialization;

namespace MyWCF
{
    [DataContract]
  public class MyCompany
    {
        [DataMember]
        public int i, ID, RequiredExperienceYears, experienceYears, tel;
        [DataMember]
        public string Title, RequiredEducationLevel, DiplomaTitle, FullName, login, password;
        [DataMember]
        public decimal Salary;    
        public MyCompany()
        {
        }
        public MyCompany(string p, int p_2)
        {
            this.FullName = p;
            this.experienceYears = p_2;
        }
        public MyCompany(int p, int p_2, string p_3, decimal p_4, string p_5, int p_6)
        {
            this.ID = p;
            this.i = p_2;
            this.Title = p_3;
            this.Salary = p_4;
            this.RequiredEducationLevel = p_5;
            this.RequiredExperienceYears = p_6;
        }
        public MyCompany(string p)
        {
            this.FullName = p;
        }
      
    }
}
