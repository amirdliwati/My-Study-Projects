using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace SportLibrary
{
    public class Team
    {
        private string teamName;
        private int wonMatchs;
        private int failMatchs;

        public string TeamName
        {
            get { return teamName; }
            set { teamName = value; }
        }

        public int WonMatchs
        {
            get { return wonMatchs; }
            set { wonMatchs = value; }
        }

        public int FailMatchs
        {
            get { return failMatchs; }
            set { failMatchs = value; }
        }


        public Team(string teamName, int wonMatchs, int failMatchs)
        {
            this.teamName = teamName;
            this.wonMatchs = wonMatchs;
            this.failMatchs = failMatchs;
        }

        public Team() { }
    }
}
