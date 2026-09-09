using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using Sedna.Net;
using System.Xml;
using System.Xml.XPath;
using SednaTest;
using System.Net.Sockets;
using System.IO;
namespace Employee
{
    public partial class Form1 : Form
    {      NetworkStream stream =null;
                StreamReader input1 = null;
                StreamWriter output1 = null;
        SednaSession session = null;
        public Form1()
        {

            InitializeComponent();
        }

        private void button2_Click(object sender, EventArgs e)
        {
            Uploadtable form = new Uploadtable(session);
            form.ShowDialog(this);
            session.CommitTransaction();
        }

        private void Form1_Load(object sender, EventArgs e)
        {
            Login();
     
        }

        private void Init_Component()
        {
            //***************************************************************
            string result = "";
            try
            {
                string s = "doc('department.xml')/Departments/Department";
                QueryResult res = session.Execute(s);
                if (res == null)
                    output.Text = "Executed 1 successfully";
                else
                {
                    result = res.GetCompleteResult();
                    output.Text = result;
                }


                XmlDocument doc = new XmlDocument();
                string nod = "<s>" + result + "</s>";
                doc.LoadXml(nod);
                comboBox2.Items.Clear();
                comboBox3.Items.Clear();
                comboBox4.Items.Clear();

                foreach (XmlNode node in doc.SelectNodes("//Department"))
                {

                    comboBox2.Items.Add(node.ChildNodes[1].InnerText);
                    comboBox3.Items.Add(node.ChildNodes[1].InnerText);
                    comboBox4.Items.Add(node.ChildNodes[1].InnerText);
                }

            }
            catch (Exception ex)
            {
         
                MessageBox.Show("there is error in select Department");
            }

        }

        private void LoadEmployee()
        {
            dataGridView2.Rows.Clear();

            string result = "";
            try
            {
                string s = "doc('Employee.xml')/Employees/Employee";
                QueryResult res = session.Execute(s);
                if (res == null)
                    output.Text = "Executed 1 successfully";
                else
                {
                    result = res.GetCompleteResult();
                    output.Text = result;
                }

                session.CommitTransaction();

                XmlDocument doc = new XmlDocument();
                string nod = "<s>" + result + "</s>";
                doc.LoadXml(nod);
                //doc.CreateNode()
                String[] res1 = new String[5];
                foreach (XmlNode node in doc.SelectNodes("//Employee"))
                {
                    res1[0] = node.ChildNodes[0].InnerText;
                    res1[1] = node.ChildNodes[1].InnerText;
                    res1[2] = node.ChildNodes[2].InnerText;
                    res1[3] = node.ChildNodes[3].InnerText;
                    res1[4] = node.ChildNodes[4].InnerText;
                    dataGridView2.Rows.Add(res1);
                }

            }
            catch (Exception ex)
            {
               
                MessageBox.Show("there is error in select all courses");
            }
        }

        void Login()
        {
            Login login = new Login();
            if (login.ShowDialog(this) == DialogResult.OK)
                session = login.GetSession();
            else
                Application.Exit();
        }

        private void button3_Click(object sender, EventArgs e)
        {
            Init_Component();
            LoadEmployee();
            string result = "";
            try
            {
                string s = "doc('department.xml')/Departments/Department";
                output1.WriteLine(s);
                output1.Flush();
                QueryResult res = session.Execute(s);
                if (res == null)
                    output.Text = "Executed 1 successfully";
                else
                {
                    result =res.GetCompleteResult();
                    output.Text = result;
                }
                // if (session.InTransaction && AlwaysCommitCheckbox.Checked)
                session.CommitTransaction();

                XmlDocument doc = new XmlDocument();
                string nod = "<s>" + result + "</s>";
                doc.LoadXml(nod);
               
                dataGridView1.Rows.Clear();
                String[] res1 = new String[2];
                foreach (XmlNode node in doc.SelectNodes("//Department"))
                {
                    res1[0] = node.ChildNodes[0].InnerText;
                    res1[1] = node.ChildNodes[1].InnerText;
                    dataGridView1.Rows.Add(res1);
                }
                MessageBox.Show("تمت علملية التحديث بنجاح");


            }
            catch (Exception ex)
            {
           
                MessageBox.Show("there is error in select all Department");
            }
                



            }
        



        private void button1_Click(object sender, EventArgs e)
        {
            insert_new_department(textBox1.Text, textBox2.Text);
        }

        void insert_new_department(string cid, string cname)
        {
            string s = "update insert <Department>" +
               "<id>" + cid + "</id>" +
               "<name>" + cname + "</name>" +

               "</Department> into doc('department.xml')/Departments";
            try
            {
                output1.WriteLine(s);
                output1.Flush();

                if (input1.ReadLine() == "ok")
                {
                    output.Text = "Executed successfully";
                    MessageBox.Show("تمت عملية الإضافة على السيرفر بنجاح");
                }
                else
                    output.Text = "Not Ok";
           
            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
                MessageBox.Show("حدث خطأ بعملية الإضافة");
            }
        }

        private void ReportError(string p, Exception ex)
        {
            string message = Environment.NewLine + ex.Message + " (" + ex.GetType().Name + ")";
            MessageBox.Show(this, message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error);
            output.Text = "ERROR: " + message;

        }

        private void button4_Click(object sender, EventArgs e)
        {

            string s = "";
            try
            {
                string metadata = session.Execute("RETRIEVE METADATA FOR DOCUMENTS").GetCompleteResult();
                System.Xml.XmlDocument doc = new System.Xml.XmlDocument();
                doc.LoadXml(metadata);
                foreach (System.Xml.XmlElement elem in doc.SelectNodes("//Document"))
                    s += elem.Attributes["name"].Value + "     ";

                output.Text = s;
            }
            catch (Exception ex)
            {
                ReportError("Unable to retrieve metadata for database", ex);
            }
        }

        int index_grid3_show = 0;
        private void dataGridView1_MouseClick(object sender, MouseEventArgs e)
        {
            if (dataGridView1.Rows.Count > 0)
            {
                dataGridView1.Rows[index_grid3_show].DefaultCellStyle.BackColor = Color.White;
                index_grid3_show = dataGridView1.CurrentRow.Index;
                dataGridView1.Rows[index_grid3_show].DefaultCellStyle.BackColor = Color.Yellow;
                dataGridView1[dataGridView1.CurrentCell.ColumnIndex, dataGridView1.CurrentRow.Index].Selected = false;
                dataGridView1.Rows[1].Cells[1].Selected = false;
            }
        }

        private void dataGridView1_MouseDoubleClick(object sender, MouseEventArgs e)
        {
            if (dataGridView1.Rows.Count > 0)
            {
                int index_del_grid1 = dataGridView1.CurrentRow.Index;
                dataGridView1.Rows[index_del_grid1].DefaultCellStyle.BackColor = Color.Red;
                button5.Enabled = true;
            }
        }

//******************************حذف قسم****************************************************
        void delete_department(string sid)
        {
            string s = "update delete doc('department.xml')/Departments/Department[id/text()='" + sid + "']";
            try
            {
                output1.WriteLine(s);
                output1.Flush();
           
                QueryResult res = session.Execute(s);
                if (input1.ReadLine() == "ok")
                {
                    output.Text = "Executed successfully";
                    MessageBox.Show("تمت عملية الحذف على السيرفر بنجاح");
                }
                else
                    output.Text = "Not Ok";
               
            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
                MessageBox.Show("هذا الرقم غير موجود أصلا تأكد منه من فضلك");
            }

        }

        private void button5_Click(object sender, EventArgs e)
        {

            string content = dataGridView1[0, dataGridView1.CurrentRow.Index].Value.ToString();
            MessageBox.Show(content);
            delete_department(content);
        }

        private void label7_Click(object sender, EventArgs e)
        {

        }
        //**************************إضافة موظف************************************
        private void button6_Click(object sender, EventArgs e)
        {
            string s1 = "update insert <Employee>" +
               "<id>" + textBox3.Text + "</id>" +
               "<name>" + textBox4.Text + "</name>" +
               "<address>" + textBox7.Text + "</address>" +
               "<birth>" + dateTimePicker1.Value.Year + "</birth>" +
               "<qaid>" + textBox6.Text + "</qaid>" +
               "</Employee> into doc('Employee.xml')/Employees";
            //*****************************************************************

            string s2 = "update insert <Emp_In>" +

               "<id>" + textBox3.Text + "</id>" +
               "<id_inf>" + textBox5.Text + "</id_inf>" +
               "<date>" + dateTimePicker2.Value.Year + "</date>" +
               "<salary>" + textBox8.Text + "</salary>" +
               "<department>" + comboBox2.Text + "</department>" +
               "</Emp_In> into doc('Emp_Information.xml')/Informations";

            try
            {

                output1.WriteLine(s1);
                output1.Flush();
               if (input1.ReadLine() == "ok")
                {
                    output.Text = "Executed successfully";
                    MessageBox.Show("تمت عملية الإضافة على السيرفر بنجاح");
                }
               output1.WriteLine(s2);
               output1.Flush();
               input1.ReadLine();


                LoadEmployee();
            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
                MessageBox.Show("حدث خطأ بعملية الإضافة");
            }
        }
        //***********************إضافة إجازة لموظف*****************************
        private void button8_Click(object sender, EventArgs e)
        {
            string id = dataGridView2[0, dataGridView2.CurrentRow.Index].Value.ToString();
         
            string s1 = "update insert <break>" +
             "<emp_id>" + id + "</emp_id>" +
             "<br_id>" + comboBox1.Text + "</br_id>" +
             "<date>" + dateTimePicker4.Value.Year + "/" + dateTimePicker4.Value.Month + "/" + dateTimePicker4.Value.Day + "</date>" +
             "<nday>" + textBox10.Text + "</nday>" +
             "<reason>" + textBox11.Text + "</reason>" +
             "</break> into doc('Emp_Break.xml')/breaks";

            try
            {

                output1.WriteLine(s1);
                output1.Flush();
                if (input1.ReadLine() == "ok")
                {
                    output.Text = "Executed successfully";
                    MessageBox.Show("تمت عملية الإضافة على السيرفر بنجاح");
                }
               

            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
                MessageBox.Show("حدث خطأ بعملية الإضافة");
            }

        }
//**********************************تغير لون ***************************************
        private void dataGridView2_MouseClick(object sender, MouseEventArgs e)
        {
            button11.Enabled = true;
            button8.Enabled = true; button7.Enabled = true;
            if (dataGridView2.Rows.Count > 0)
            {
                dataGridView2.Rows[index_grid3_show].DefaultCellStyle.BackColor = Color.White;
                index_grid3_show = dataGridView2.CurrentRow.Index;
                dataGridView2.Rows[index_grid3_show].DefaultCellStyle.BackColor = Color.Yellow;
                dataGridView2[dataGridView2.CurrentCell.ColumnIndex, dataGridView2.CurrentRow.Index].Selected = false;
                dataGridView2.Rows[1].Cells[1].Selected = false;
            }
        }
        //***********************************إضافة قسم لموظف********************************************
        private void button7_Click(object sender, EventArgs e)
        {
            string id = dataGridView2[0, dataGridView2.CurrentRow.Index].Value.ToString();
            string s1 = "update insert <emp_department>" +
            "<emp_id>" + id+ "</emp_id>" +
            "<department>" + comboBox3.Text + "</department>" +
            "<date>" + dateTimePicker3.Value.Year + "/" + dateTimePicker3.Value.Month + "/" + dateTimePicker3.Value.Day + "</date>" +
            "</emp_department> into doc('Emp_Departments.xml')/emp_departments";

            try
            {
               
                output1.WriteLine(s1);
                output1.Flush();
                if (input1.ReadLine() == "ok")
                {
                    output.Text = "Executed successfully";
                    MessageBox.Show("تمت عملية الإضافة على السيرفر بنجاح");
                }
               


            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
                MessageBox.Show("حدث خطأ بعملية الإضافة");
            }
        }
        //*********************صفحة عرض موظف **********************************************************
        private void dataGridView2_CellDoubleClick(object sender, DataGridViewCellEventArgs e)
        {
            string id = dataGridView2[0, dataGridView2.CurrentRow.Index].Value.ToString();
          
            try
            {
                string employee = Select_Employee(id);

                XmlDocument doc = new XmlDocument();
                string nod = "<s>" + employee + "</s>";
                doc.LoadXml(nod);
                XmlNode node = doc.SelectSingleNode("//Employee[./id/text()='" + id + "']");
                label29.Text = node.ChildNodes[1].InnerText;
                label30.Text = node.ChildNodes[3].InnerText;
                label31.Text = node.ChildNodes[2].InnerText;
                label32.Text = node.ChildNodes[4].InnerText;

                //*************************************************************************
                // res = null;
                string result="";
                string s = "doc('Emp_Information.xml')/Informations/Emp_In[id/text()='" + id + "']";
                QueryResult res = session.Execute(s);
                if (res == null)
                    output.Text = "Executed 1 successfully";

                else
                {
                    result = res.GetCompleteResult();
                    output.Text = result;
                }

                session.CommitTransaction();

                XmlDocument doc1 = new XmlDocument();
                nod = "<s>" + result + "</s>";
                doc1.LoadXml(nod);
                XmlNode node1 = doc1.SelectSingleNode("//Emp_In[./id/text()='" + id + "']");

                label33.Text = node1.ChildNodes[1].InnerText;
                label34.Text = label29.Text;

                label35.Text = node1.ChildNodes[2].InnerText;
                label38.Text = node1.ChildNodes[3].InnerText;

                label36.Text = node1.ChildNodes[4].InnerText;

                //***************************************************************************
                s = "doc('Emp_Departments.xml')/emp_departments/emp_department[emp_id/text()='" + id + "']";
                res = session.Execute(s);
                if (res == null)
                    output.Text = "Executed 1 successfully";

                else
                {
                    result = res.GetCompleteResult();
                    output.Text = result;
                }

                session.CommitTransaction();

                doc1 = new XmlDocument();
                nod = "<s>" + result + "</s>";

                doc1.LoadXml(nod);
                string[] dep = new string[6];
                dataGridView4.Rows.Clear();
                foreach (XmlNode n in doc1.SelectNodes("//emp_department"))
                {

                    dep[0] = n.ChildNodes[1].InnerText;
                    dep[1] = n.ChildNodes[2].InnerText;
                    dataGridView4.Rows.Add(dep);
                }


                //**************************************************************
                s = "doc('Emp_Break.xml')/breaks/break[emp_id/text()='" + id + "']";
                res = session.Execute(s);
                if (res == null)
                    output.Text = "Executed 1 successfully";

                else
                {
                    result = res.GetCompleteResult();
                    output.Text = result;
                }

                session.CommitTransaction();

                doc1 = new XmlDocument();
                nod = "<s>" + result + "</s>";
                doc1.LoadXml(nod);


                dataGridView3.Rows.Clear();
                string[] tire = new string[3];

                foreach (XmlNode n in doc1.SelectNodes("//break"))
                {
                    MessageBox.Show(n.ChildNodes[1].InnerText);
                    tire[0] = n.ChildNodes[2].InnerText;
                    tire[1] = n.ChildNodes[3].InnerText;
                    tire[2] = n.ChildNodes[4].InnerText;

                    dataGridView3.Rows.Add(tire);
                }


           //     textBox9.Text = nod;




                tabControl1.SelectedTab = tabPage3;
            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
                MessageBox.Show("حدث خطأ بعملية الإضافة");
            }
        }
        //*****************************سحب موظف من خلال الرقم*********************
        private string Select_Employee(string  id)
        {
            string result = "";
             string s = "doc('Employee.xml')/Employees/Employee[id/text()='" + id + "']";
            QueryResult res = session.Execute(s);
            if (res == null)
                output.Text = "Executed 1 successfully";

            else
            {
                result = res.GetCompleteResult();
                output.Text = result;
            }
            MessageBox.Show(result);

            session.CommitTransaction();
            return result;
        }

        private void label18_Click(object sender, EventArgs e)
        {

        }
//*************************************عرض إجازات موظف*********************************************
        private void button9_Click(object sender, EventArgs e)
        {


            string result = "";
            string s = "doc('Emp_Break.xml')/breaks/break[emp_id/text()='" + textBox12.Text + "']";
            QueryResult res = session.Execute(s);
            if (res == null)
                output.Text = "Executed 1 successfully";

            else
            {
                result = res.GetCompleteResult();
                output.Text = result;
            }

            session.CommitTransaction();

            XmlDocument doc1 = new XmlDocument();
            string nod = "<s>" + result + "</s>";
            doc1.LoadXml(nod);


            dataGridView5.Rows.Clear();
            string[] tire = new string[4];
            if (checkBox1.Checked == false)
            {
                foreach (XmlNode n in doc1.SelectNodes("//break"))
                {

                    string[] date1 = n.ChildNodes[2].InnerText.Split('/');

                    if (((int.Parse(date1[2]) > dateTimePicker5.Value.Day) && (int.Parse(date1[2]) < dateTimePicker6.Value.Day)))
                    {
                        tire[0] = n.ChildNodes[1].InnerText;

                        tire[1] = n.ChildNodes[2].InnerText;
                        tire[2] = n.ChildNodes[3].InnerText;
                        tire[3] = n.ChildNodes[4].InnerText;
                        dataGridView5.Rows.Add(tire);
                    }
                }
            }
            else
            {
                foreach (XmlNode n in doc1.SelectNodes("//break"))
                {

                    string[] date1 = n.ChildNodes[2].InnerText.Split('/');

                    tire[0] = n.ChildNodes[1].InnerText;

                    tire[1] = n.ChildNodes[2].InnerText;
                    tire[2] = n.ChildNodes[3].InnerText;
                    tire[3] = n.ChildNodes[4].InnerText;
                    dataGridView5.Rows.Add(tire);


                }
            }
        }
//*********************************************************************************************
        public void button10_Click(object sender, EventArgs e)
        {
            string s=query_department(comboBox4.Text);
            
      
        }

        public string query_department(string p)
        {
            string result = ""; 
            string s = "doc('Emp_Information.xml')/Informations/Emp_In";
            QueryResult res = session.Execute(s);

           if (res == null)
                output.Text = "Executed 1 successfully";

         else
            {
                result = res.GetCompleteResult();
                output.Text = result;
            }


            XmlDocument doc1 = new XmlDocument();
            string nod = "<s>" + result + "</s>";
            MessageBox.Show(nod);
            doc1.LoadXml(nod);
            string[] dep = new string[6];
            dataGridView6.Rows.Clear();
            
            foreach (XmlNode n in doc1.SelectNodes("//Emp_In"))
            {
                if (n.ChildNodes[4].InnerText == p)
                {
                    dep[0] = n.ChildNodes[1].InnerText;
                    dep[1] = n.ChildNodes[2].InnerText;

                    dep[2] = n.ChildNodes[3].InnerText;

                
                    dataGridView6.Rows.Add(dep);
                }
            }

      return nod;
        }


        private void button11_Click(object sender, EventArgs e)
        {
            int max = 0;
            string result = "";
            string s = "doc('Emp_Information.xml')/Informations/Emp_In";
            QueryResult res = session.Execute(s);
            if (res == null)
                output.Text = "Executed 1 successfully";

            else
            {
                result = res.GetCompleteResult();
                output.Text = result;
            }

            session.CommitTransaction();

            XmlDocument doc1 = new XmlDocument();
            string nod = "<s>" + result + "</s>";
            doc1.LoadXml(nod);
            string[] dep = new string[6];
            dataGridView6.Rows.Clear();

            foreach (XmlNode n in doc1.SelectNodes("//Emp_In"))
            {

                dep[0] = n.ChildNodes[1].InnerText;
                dep[1] = n.ChildNodes[2].InnerText;
                dep[2] = n.ChildNodes[3].InnerText;
                if (int.Parse(n.ChildNodes[3].InnerText) > max)
                    max = int.Parse(n.ChildNodes[3].InnerText);

                dep[3] = n.ChildNodes[4].InnerText;
                MessageBox.Show("maX SALARY" + max);
                dataGridView6.Rows.Add(dep);
            }
         
        }

        private void checkBox1_CheckedChanged(object sender, EventArgs e)
        {
         
            if (checkBox1.Checked == true)
            {
                dateTimePicker5.Enabled = false;
                dateTimePicker6.Enabled = false;
            }
            if (checkBox1.Checked == false)
            {
                dateTimePicker5.Enabled = true;
                dateTimePicker6.Enabled = true;
            }
        }
//*****************************************************************************************
        private void button11_Click_1(object sender, EventArgs e)
        {
            string id = dataGridView2[0, dataGridView2.CurrentRow.Index].Value.ToString();

            string s = "update insert <emp_salary>" +
               "<emp_id>" + id + "</emp_id>" +
               "<value>" + textBox13.Text + "</value>" +
               "<date>" + dateTimePicker7.Value.Year+"/"+dateTimePicker7.Value.Month+"/"+dateTimePicker7.Value.Day+"</date>" +
               "</emp_salary> into doc('Emp_Salary.xml')/emp_salarys";
            try
            {
                QueryResult res = session.Execute(s);
                if (res == null)
                {
                    output.Text = "Executed successfully";
                    MessageBox.Show("تمت عملية إضافة الراتب بنجاح ");
                }
                else
                    output.Text = res.GetCompleteResult();

                session.CommitTransaction();
            }
            catch (Exception ex)
            {
                ReportError("Unable to execute query or update", ex);
                MessageBox.Show("حدث خطأ بعملية الإضافة");
            }
        }
//*********************************************استعلام عن الإضافات**********************************************
        private void button12_Click(object sender, EventArgs e)
        {
            string result = "";
            string s = "doc('Emp_Salary.xml')/emp_salarys/emp_salary[emp_id/text()='" + textBox12.Text + "']";
         

             QueryResult res = session.Execute(s);
            if (res == null)
                output.Text = "Executed 1 successfully";

            else
                {
                  result = res.GetCompleteResult();
                output.Text = result;
            }
            MessageBox.Show(result);
           session.CommitTransaction();

            XmlDocument doc1 = new XmlDocument();
            string nod = "<s>" + result + "</s>";
            doc1.LoadXml(nod);

            int Final_Salary = 0;

            dataGridView7.Rows.Clear();
            string[] tire = new string[2];
            foreach (XmlNode n in doc1.SelectNodes("//emp_salary"))
                {
                    try {

                      
                        Final_Salary += Int32.Parse(n.ChildNodes[1].InnerText);
        
                    
                    }
                    catch(Exception e222){}
                    

                        tire[0] = n.ChildNodes[1].InnerText;
                        tire[1] = n.ChildNodes[2].InnerText;
                     
                        dataGridView7.Rows.Add(tire);
                    }
               

            //**************************استعلام عن الراتب الصافي لموظف********************
             result = "";
             s = "doc('Emp_Information.xml')/Informations/Emp_In[id/text()='" +textBox12.Text+ "']";
             res = session.Execute(s);
            if (res == null)
                output.Text = "Executed 1 successfully";

            else
            {
                result = res.GetCompleteResult();
                output.Text = result;
            }
        
            XmlDocument doc = new XmlDocument();
            nod = "<s>" + result + "</s>";
            doc.LoadXml(nod);
            XmlNode node = doc.SelectSingleNode("//Emp_In[./id/text()='" + textBox12.Text + "']");
            try { Final_Salary += Int32.Parse(node.ChildNodes[3].InnerText);
            }
            catch (Exception e222) { }
            textBox14.Text = Final_Salary.ToString();
 
            }
//*********************************************************************************************
        private void button13_Click(object sender, EventArgs e)
        {
           try { string hostname = "localhost";
                TcpClient c = new TcpClient(hostname, 9999);
                MessageBox.Show("connected Succeeded ");
                NetworkStream stream = c.GetStream();
                input1 = new StreamReader(stream);
                output1 = new StreamWriter(stream);
                this.panel8.Visible = true;
                this.panel7.Visible = false;
            
                

               
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message);

                Console.ReadLine();
            }
        }
        }

    }
