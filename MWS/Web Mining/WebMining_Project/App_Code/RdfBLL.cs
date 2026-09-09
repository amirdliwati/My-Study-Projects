using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using VDS.RDF.Query;
using VDS.RDF;

/// <summary>
/// Summary description for RdfBLL
/// </summary>
public static class RdfBLL
{
    public static DataTable CreateDataTableAs(SparqlResultSet Results)
    {
        DataTable DT = new DataTable();
        SparqlResult result= new SparqlResult();
       
        if (Results.Results.Count > 0)
        {
            result = Results.Results[0];




            for (int i = 0; i < result.Variables.ToList().Count; i++)

                if (result[i] != null)
                {
                    if (result[i].NodeType == NodeType.Literal)
                    {
                        String ColumnDataType;
                        if ((((VDS.RDF.BaseLiteralNode)((new List<KeyValuePair<string, VDS.RDF.INode>>(result))[i].Value))).DataType != null)
                        {
                            ColumnDataType = ((VDS.RDF.BaseLiteralNode)((new List<KeyValuePair<string, VDS.RDF.INode>>(result))[i].Value)).DataType.Fragment.Replace("#", "").ToUpper();
                        }
                        else
                        {
                            ColumnDataType = "STRING";
                        }

                        if ((ColumnDataType == "DATETIME") | (ColumnDataType == "DATE"))
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(DateTime));
                        else if (ColumnDataType == "TIME")
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(TimeSpan));
                        else if (ColumnDataType == "BOOLEAN")
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(Boolean));
                        else if ((ColumnDataType == "INTEGER") |
                                 (ColumnDataType == "INT") |
                                 (ColumnDataType == "NEGATIVEINTEGER") |
                                 (ColumnDataType == "POSITIVEINTEGER") |
                                 (ColumnDataType == "NONPOSITIVEINTEGER") |
                                 (ColumnDataType == "NONNEGATIVEINTEGER") |
                                 (ColumnDataType == "SHORT"))
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(Int16));
                        else if (ColumnDataType == "LONG")
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(Int64));
                        else if (ColumnDataType == "BYTE")
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(Byte));
                        else if (ColumnDataType == "DECIMAL")
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(Decimal));

                        else if (ColumnDataType == "DOUBLE")
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(Double));

                        else if (ColumnDataType == "FLOAT")
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(float));
                        else if (ColumnDataType == "STRING")
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(String));
                        else
                            DT.Columns.Add(result.Variables.ToList()[i], typeof(String));
                    }

                    else
                        DT.Columns.Add(result.Variables.ToList()[i], typeof(String));
                }
                else
                    DT.Columns.Add(result.Variables.ToList()[i], typeof(String));

        }
        else
        {

            for (int i = 0; i < Results.Variables.ToList().Count; i++)
            {
                DT.Columns.Add(Results.Variables.ToList()[i], typeof(String));
            }
        }

        return (DT);
    }


    public static DataTable FillDataTableFrom(SparqlResultSet Results)
    {
        DataTable DT = new DataTable();
        DT = CreateDataTableAs(Results);
        foreach (SparqlResult result in Results)
        {
            DataRow DR = DT.NewRow();
            for (int i = 0; i < result.Count; i++)
            {

                if (result[i] == null)
                    DR[i] = "";
                else if (result[i].NodeType == NodeType.Uri)
                    DR[i] = ((UriNode)result[i]).Uri;
                //.Fragment.ToString().Replace("#", "");
                //  DR[i] = ((UriNode)result[i]).Uri.ToString();
                else if (result[i].NodeType == NodeType.Blank)
                    DR[i] = ((BlankNode)result[i]).InternalID.ToString();
                else if (result[i].NodeType == NodeType.Literal)
                    DR[i] = ((LiteralNode)result[i]).Value.ToString();
            }

            DT.Rows.Add(DR);
        }

        return (DT);
    }
}