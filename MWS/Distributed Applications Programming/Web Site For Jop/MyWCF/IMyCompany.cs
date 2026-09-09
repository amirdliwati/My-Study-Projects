using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ServiceModel;
using System.Data.SqlClient;
using System.Data;

namespace MyWCF
{
    [ServiceContract]
  public interface IMyCompany
    {
        [OperationContract]
        DataTable GetJobsForCompany();
        [OperationContract]
        bool AddJobForCompany(MyCompany e);
        [OperationContract]
        bool AddDiplomaForCandidate(MyCompany e);
        [OperationContract]
        bool AddCompany(MyCompany e);
        [OperationContract]
        bool SignUp(MyCompany e);
        [OperationContract]
        List<MyCompany> GetJobForCandidates(int id);
        [OperationContract]
        List<MyCompany> GetCandidatesForJob(int id);        
        [OperationContract]
        List<MyCompany> GetCandidate();
        [OperationContract]
        List<MyCompany> GetJobs();


    }
}
