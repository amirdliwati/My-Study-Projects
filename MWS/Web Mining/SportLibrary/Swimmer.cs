using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SportLibrary
{
    public class Swimmer
    {
        private string engName;
        private string arName;
        private string birthDate;
        private string city;
        private string abstrct;
        private SwimmingPool swimIn;
        private Team swimmerTeam;
        private string swimmerImage;
        private string awards;

        public string EngName
        {
            get { return engName; }
            set { engName = value; }
        }
        public string ArName
        {
            get { return arName; }
            set { arName = value; }
        }
        public string BirthDate
        {
            get { return birthDate; }
            set { birthDate = value; }
        }
        public string City
        {
            get { return city; }
            set { city = value; }
        }
        public string Abstract
        {
            get { return abstrct; }
            set { abstrct = value; }
        }
        public SwimmingPool SwimIn
        {
            get { return swimIn; }
            set { swimIn = value; }
        }
        public Team SwimmerTeam
        {
            get { return swimmerTeam; }
            set { swimmerTeam = value; }
        }
        public string SwimmerImage
        {
            get { return swimmerImage; }
            set { swimmerImage = value; }
        }
        public string Awards
        {
            get { return awards; }
            set { awards = value; }
        }
    }
}
