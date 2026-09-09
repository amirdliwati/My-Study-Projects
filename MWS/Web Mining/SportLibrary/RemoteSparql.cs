using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Net;
using System.IO;

namespace SportLibrary
{
    public class RemoteSparql
    {
        private string request(string req)
        {
            string str;
            HttpWebRequest httpWebRequest = (HttpWebRequest)WebRequest.Create(req);
            HttpWebResponse httpWebResponse = (HttpWebResponse)httpWebRequest.GetResponse();
            Stream stream = httpWebResponse.GetResponseStream();
            StreamReader streamReader = new StreamReader(stream, Encoding.UTF8);
            str = streamReader.ReadToEnd();
            httpWebResponse.Close();
            streamReader.Close();
            stream.Close();
            return str;
        }

        private StrData cells(string s)
        {
            StrData strdata = new StrData();
            string str, str1;
            s += "<td></td>";
            str = s.Substring(s.IndexOf("<td>") + 4);
            str1 = str.Substring(0, str.IndexOf("</td>"));
            strdata.LStr.Add(str1);
            try
            {
                while (true)
                {
                    str = str.Substring(str.IndexOf("<td>") + 4);
                    str1 = str.Substring(0, str.IndexOf("</td>"));
                    strdata.LStr.Add(str1);
                }
            }
            catch (Exception e)
            {
            }
            return strdata;
        }

        private List<StrData> FinalReq(string q)
        {
            string str, str1, str2;
            List<StrData> sdList = new List<StrData>();
            str = request(q);
            str += "<tr></tr>";
            str1 = str.Substring(str.IndexOf("<tr>") + 4);
            str2 = str1.Substring(0, str1.IndexOf("</tr>"));
            sdList.Add(cells(str2));
            str1 = str1.Substring(str1.IndexOf("<tr>") + 4);
            try
            {
                while (true)
                {
                    str2 = str1.Substring(0, str1.IndexOf("</tr>"));
                    sdList.Add(cells(str2));
                    str1 = str1.Substring(str1.IndexOf("<tr>") + 4);
                }
            }
            catch (Exception err)
            {
            }
            return sdList;
        }

        public List<FootBall> FootBallDBpedia(string q)
        {
            List<FootBall> tsList = new List<FootBall>();
            List<StrData> sdList = FinalReq(q);
            FootBall football = new FootBall();
            Filter filter = new Filter();
            for (int i = 0; i < sdList.Count; i++)
            {
                try
                {
                    if (football.Name != filter.stringFilter(sdList[i].LStr[1]))
                    {
                        football = new FootBall();
                        football.Resource = sdList[i].LStr[0];
                        football.Name = filter.stringFilter(sdList[i].LStr[1]);
                        football.Abstract = filter.stringFilter(sdList[i].LStr[2]);
                        football.BirthDate = sdList[i].LStr[3];
                        football.Height = sdList[i].LStr[4];
                        football.Position = filter.httpFilter(sdList[i].LStr[5]);
                        football.Thumbnail = filter.httpFilter(sdList[i].LStr[6]);

                        tsList.Add(football);
                    }
                }
                catch (Exception) { }
            }

            return tsList;
        }
        public List<PediaSwimmers> SwimmerDBpedia(string q)
        {
            List<PediaSwimmers> tsList = new List<PediaSwimmers>();
            List<StrData> sdList = FinalReq(q);
            PediaSwimmers swimmer = new PediaSwimmers();
            Filter filter = new Filter();
            for (int i = 0; i < sdList.Count; i++)
            {
                try
                {
                    if (swimmer.Name != filter.stringFilter(sdList[i].LStr[1]))
                    {
                        swimmer = new PediaSwimmers();
                        swimmer.Resource = sdList[i].LStr[0];
                        swimmer.Name = filter.stringFilter(sdList[i].LStr[1]);
                        swimmer.Abstract = filter.stringFilter(sdList[i].LStr[2]);
                        swimmer.BirthDate = sdList[i].LStr[3];
                        swimmer.Height = sdList[i].LStr[4];
                        swimmer.Weight = Convert.ToDouble(sdList[i].LStr[5]) / 1000;
                        swimmer.Position = filter.stringFilter(sdList[i].LStr[6]);

                        tsList.Add(swimmer);
                    }
                }
                catch (Exception) { }
            }

            return tsList;
        }
        public List<PediaBasketBall> BasketBallDBpedia(string q)
        {
            List<PediaBasketBall> tsList = new List<PediaBasketBall>();
            List<StrData> sdList = FinalReq(q);
            PediaBasketBall player = new PediaBasketBall();
            Filter filter = new Filter();
            for (int i = 0; i < sdList.Count; i++)
            {
                try
                {
                    if (player.Name != filter.stringFilter(sdList[i].LStr[1]))
                    {
                        player = new PediaBasketBall();
                        player.Resource = sdList[i].LStr[0];
                        player.Name = filter.stringFilter(sdList[i].LStr[1]);
                        player.Abstract = filter.stringFilter(sdList[i].LStr[2]);
                        player.BirthDate = sdList[i].LStr[3];
                        tsList.Add(player);
                    }
                }
                catch (Exception) { }
            }

            return tsList;
        }

    }

    public class StrData
    {
        public List<String> LStr;
        public StrData()
        {
            LStr = new List<string>();
        }
    }

    public class Filter
    {
        public string httpFilter(string s)
        {
            string str = s.Replace("http", "https");
            return str;
        }

        public string stringFilter(string s)
        {
            string str = s.Replace("\"", "");
            str = str.Replace("@en", "");
            str = str.Replace("@EN", "");
            return str;
        }

        public string epochsFilter(string s)
        {
            if (s.IndexOf("http") >= 0)
            {
                int i = s.LastIndexOf("/") + 1;
                return s.Substring(i);
            }
            else
                return stringFilter(s);
        }

        public string serviceFilter(string s)
        {
            string str = s;
            if (str.IndexOf("#") >= 0)
            {
                int i = s.IndexOf("#") + 1;
                str = s.Substring(i);
                str = str.Replace(">", "");
            }
            return str;
        }

        public string builtFilter(string s)
        {
            if (s.IndexOf("http") >= 0)
                return "";
            else
                return stringFilter(s);
        }


    }

    public class FootBall
    {
        private string name;
        private string resource;
        private string abstrat;
        private string birthDate;
        private string height;
        private string position;
        private string thumbnail;

        public FootBall() { }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Resource
        {
            get { return resource; }
            set { resource = value; }
        }
        public string Abstract
        {
            get { return abstrat; }
            set { abstrat = value; }
        }
        public string BirthDate
        {
            get { return birthDate; }
            set { birthDate = value; }
        }
        public string Height
        {
            get { return height; }
            set { height = value; }
        }
        public string Position
        {
            get { return position; }
            set { position = value; }
        }
        public string Thumbnail
        {
            get { return thumbnail; }
            set { thumbnail = value; }
        }
    }

    public class PediaSwimmers
    {
        private string name;
        private string resource;
        private string abstrat;
        private string birthDate;
        private string height;
        private double weight;
        private string description;

        public PediaSwimmers() { }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Resource
        {
            get { return resource; }
            set { resource = value; }
        }
        public string Abstract
        {
            get { return abstrat; }
            set { abstrat = value; }
        }
        public string BirthDate
        {
            get { return birthDate; }
            set { birthDate = value; }
        }
        public string Height
        {
            get { return height; }
            set { height = value; }
        }
        public double Weight
        {
            get { return weight; }
            set { weight = value; }
        }
        public string Position
        {
            get { return description; }
            set { description = value; }
        }
    }

    public class PediaBasketBall
    {
        private string name;
        private string resource;
        private string abstrat;
        private string birthDate;

        public PediaBasketBall() { }

        public string Name
        {
            get { return name; }
            set { name = value; }
        }
        public string Resource
        {
            get { return resource; }
            set { resource = value; }
        }
        public string Abstract
        {
            get { return abstrat; }
            set { abstrat = value; }
        }
        public string BirthDate
        {
            get { return birthDate; }
            set { birthDate = value; }
        }
    }
}


