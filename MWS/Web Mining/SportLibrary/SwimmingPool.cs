using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SportLibrary
{
    public class SwimmingPool
    {
        private string poolName;
        private string location;
        private string accessStreet;
        private string condition;
        private string swimmingPoolDescription;
        private string swimmingPoolImage;
        private string services;
        
        public string PoolName
        {
            get { return poolName; }
            set { poolName = value; }
        }
        public string Location
        {
            get { return location; }
            set { location = value; }
        }
        public string AccessStreet
        {
            get { return accessStreet; }
            set { accessStreet = value; }
        }
        public string Condition
        {
            get { return condition; }
            set { condition = value; }
        }
        public string SwimmingPoolDescription
        {
            get { return swimmingPoolDescription; }
            set { swimmingPoolDescription = value; }
        }
        public string SwimmingPoolImage
        {
            get { return swimmingPoolImage; }
            set { swimmingPoolImage = value; }
        }
        public string Services
        {
            get { return services; }
            set { services = value; }
        }

    }
}
