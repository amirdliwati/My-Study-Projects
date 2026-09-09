using System;
using System.Collections.Generic;
using System.Text;
using Sedna.Net;
using System.IO;
using System.Windows.Forms;
using System.Xml;

namespace SednaTest
{
    class doc
    {
        const string DocsFolder = "Docs";
        const string XMLDataFolder = "XMLData";
        public const string xmlFileName = "mydata.xml";

        public static string xmlFilePath = Application.StartupPath + "\\" + XMLDataFolder;
        public static string docsPath = Application.StartupPath + "\\" + DocsFolder;

        public static SednaSession session = null;

        private int ID=-1;
        
        public int id
        {
            get { return ID; }
        }
        private string DOC_NAME = "";
        public string doc_name
        {
            get { return DOC_NAME; }
            set { DOC_NAME = value; }
        }
        public string doc_info = "";
        public string issue_info = "";
        public DateTime DOC_DATE;
        public DateTime doc_date
        {
            get { return DOC_DATE; }
            set { DOC_DATE = value; }
        }

        private string old_folder_name;
        private string FOLDER_NAME = "";
        public string folder_name
        {
            get { return FOLDER_NAME; }
            set { FOLDER_NAME = value; }
        }


        private string FILE_NAME = "";
        public string file_name
        {
            get { return FILE_NAME; }
        }

        public string FileFullName
        {
            get
            {
                return docsPath + "\\" + folder_name + "\\" + file_name;
            }
        }

        string Qtxt;
        QueryResult Qres;

        public doc()
        {
        }

        public doc(int doc_id)
        {
            try
            {
                Qtxt = "doc('mydata.xml')/documents/document[ID=" + doc_id + "]";
                Qres = session.Execute(Qtxt);

                loadFromXML(Qres.GetCompleteResult());
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
        private void loadFromXML(string xmlData)
        {
            XmlDocument XMLdoc = new XmlDocument();
            XMLdoc.LoadXml(xmlData);


            ID = int.Parse(XMLdoc.FirstChild["ID"].InnerText);

            doc_name = XMLdoc.FirstChild["name_doc"].InnerText;
            doc_info = XMLdoc.FirstChild["info_doc1"].InnerText;
            issue_info = XMLdoc.FirstChild["info_doc2"].InnerText;
            folder_name = XMLdoc.FirstChild["name_folder"].InnerText;
            doc_date = DateTime.Parse(XMLdoc.FirstChild["date_doc"].InnerText);
            FILE_NAME = XMLdoc.FirstChild["path_doc"].InnerText;

            old_folder_name = folder_name;
        }

        public static void Delete(int id)
        {
            doc d = new doc(id);
            File.Delete(d.FileFullName);
            string s = "update delete doc('mydata.xml')/documents/document[ID=" + d.id + "]";
            QueryResult res = session.Execute(s);
        }

        public void Save(string source_file_path)
        {
            try
            {

                if (id != -1)
                {
                    //session.BeginTransaction();

                    Qtxt = "update delete doc('mydata.xml')/documents/document[ID=" + id + "]";
                    Qres = session.Execute(Qtxt);
                }

                string pathfolder = docsPath + "\\" + folder_name;

                if (source_file_path != "")
                {
                    string old_pathimg = docsPath + "\\" + old_folder_name + "\\" + file_name;
                    if (File.Exists(old_pathimg))
                        File.Delete(old_pathimg);

                    FileInfo f = new FileInfo(source_file_path);
                    string pathimg = pathfolder + "\\" + f.Name;
                    f.CopyTo(pathimg);
                    FILE_NAME = f.Name;
                }
                else if(id != -1 && folder_name != old_folder_name)
                {
                    string old_pathimg = docsPath + "\\" + old_folder_name + "\\" + file_name;
                    string new_pathimg = docsPath + "\\" + folder_name + "\\" + file_name;
                    if (File.Exists(old_pathimg))
                        File.Move(old_pathimg, new_pathimg);
                }

                int doc_id = id;

                if (doc_id == -1)
                {
                    // Get Max(ID) (auto id)
                    Qtxt = "max(doc('mydata.xml')//ID)";
                    Qres = session.Execute(Qtxt);
                    doc_id = int.Parse(Qres.GetCompleteResult()) + 1;
                }

                Qtxt = "UPDATE insert  <document><ID>" + doc_id + "</ID>" +
                    "<name_doc>" + doc_name + "</name_doc>" +
                    "<info_doc1>" + doc_info + "</info_doc1>" +
                    "<info_doc2>" + issue_info + "</info_doc2>" +
                    "<name_folder>" + folder_name + "</name_folder>" +
                    "<date_doc>" + doc_date + "</date_doc>" +
                    "<path_doc>" + file_name + "</path_doc>" +
                    "</document> into doc('mydata.xml')/documents";
                Qres = session.Execute(Qtxt);

                if (session.InTransaction)
                    session.CommitTransaction();
            }
            catch (Exception ex)
            {
                if (session.InTransaction)
                    session.RollbackTransaction();
                throw ex;
                //ReportError("Unable to execute query or update", ex);
            }
        }
        public static List<doc> Search(string docName)
        {
            List<doc> c= new List<doc>();

            string s = "doc('mydata.xml')/documents/document[contains(upper-case(./name_doc/text()), '" + docName.ToUpper() + "')]";
            QueryResult res = session.Execute(s);
            
            res.GetCompleteResult();

            XmlDocument xmlDoc = new XmlDocument();
            string nod ="<s>" + res.GetCompleteResult() +"</s>"; 
            xmlDoc.LoadXml(nod);
            //XmlNode node = doc.SelectSingleNode("//document[name_doc/text()= '" + txtFind.Text + "' ]");


            foreach (XmlNode n in xmlDoc.ChildNodes[0].ChildNodes)
            {
                doc x = new doc();
                x.loadFromXML(n.OuterXml);
                
                c.Add(x);
            }

            return c;
        }
    }
}
