using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using System.ComponentModel;
using VDS.RDF;
using System.Web.Hosting;
using VDS.RDF.Query;
using SportLibrary;

/// <summary>
/// Summary description for Inference
/// </summary>
[DataObject]
public class Inference
{
	public Inference()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    private string ConnectionString = @"~\App_Data\SportsInSyria.rdf";
    DataTable DT = new DataTable();

    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<Triples> AllInfer()
    {
        Graph g = new Graph();
        g.LoadFromFile(HostingEnvironment.MapPath(ConnectionString));
        String S = @"
            PREFIX base: <http://www.owl-ontologies.com/news.owl#>
            PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            CONSTRUCT   
                {
                    ?p rdf:type ?upper1type.
                    ?p rdf:type ?upper2type.     
                }
            WHERE
                {
                    ?p rdf:type ?ctype.
                    ?ctype    rdfs:subClassOf ?upper1type.
                    ?upper1type rdfs:subClassOf ?upper2type.
                }
            ";

        Graph infergraph2 = new Graph();
        infergraph2 = QueryBLL.ExecuteConstruct(S);
        TripleStore store = new TripleStore();

        store.Add(infergraph2);


        Object results = store.ExecuteQuery(@"PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            PREFIX base: <http://www.syrianSports.com/Syntax#>
            SELECT   *
            WHERE
                {
                    ?subject ?predicate ?object.
                }
                ");

        if (results is SparqlResultSet)
        {

            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        
        List<Triples> lst = new List<Triples>(from dr in DT.AsEnumerable() select (GetTriplesRow(dr)));
        return lst;
    }
    private Triples GetTriplesRow(DataRow dr)
    {
        Triples ss = new Triples(dr["subject"].ToString(),
            dr["predicate"].ToString(),
            dr["object"].ToString());
        return ss;
    }

    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<Persons> PersonInfer()
    {
        Graph g = new Graph();
        g.LoadFromFile(HostingEnvironment.MapPath(ConnectionString));
        String S = @"
            PREFIX base: <http://www.owl-ontologies.com/news.owl#>
            PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            CONSTRUCT   
                {
                    ?p rdf:type ?upper1type.
                    ?p rdf:type ?upper2type.     
                }
            WHERE
                {
                    ?p rdf:type ?ctype.
                    ?ctype    rdfs:subClassOf ?upper1type.
                    ?upper1type rdfs:subClassOf ?upper2type.
                }
            ";

        Graph infergraph2 = new Graph();
        infergraph2 = QueryBLL.ExecuteConstruct(S);
        TripleStore store = new TripleStore();

        store.Add(infergraph2);


        Object results = store.ExecuteQuery(@"PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            PREFIX base: <http://www.syrianSports.com/Syntax#>
            SELECT   ?Person
            WHERE
                {
                    ?Person rdf:type base:Person.
                }
                ");

        if (results is SparqlResultSet)
        {

            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }

        List<Persons> lst = new List<Persons>(from dr in DT.AsEnumerable() select (GetPersonRow(dr)));
        return lst;
    }
    private Persons GetPersonRow(DataRow dr)
    {
        Persons ss = new Persons(dr["Person"].ToString());
        return ss;
    }

    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<Mammals> MammalInfer()
    {
        Graph g = new Graph();
        g.LoadFromFile(HostingEnvironment.MapPath(ConnectionString));
        String S = @"
            PREFIX base: <http://www.owl-ontologies.com/news.owl#>
            PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            CONSTRUCT   
                {
                    ?p rdf:type ?upper1type.
                    ?p rdf:type ?upper2type.     
                }
            WHERE
                {
                    ?p rdf:type ?ctype.
                    ?ctype    rdfs:subClassOf ?upper1type.
                    ?upper1type rdfs:subClassOf ?upper2type.
                }
            ";

        Graph infergraph2 = new Graph();
        infergraph2 = QueryBLL.ExecuteConstruct(S);
        TripleStore store = new TripleStore();

        store.Add(infergraph2);


        Object results = store.ExecuteQuery(@"PREFIX rdf: <http://www.w3.org/1999/02/22-rdf-syntax-ns#>
            PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>
            PREFIX base: <http://www.syrianSports.com/Syntax#>
            SELECT   ?mammal
            WHERE
                {
                    ?mammal rdf:type base:mammal.
                }
                ");

        if (results is SparqlResultSet)
        {

            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }

        List<Mammals> lst = new List<Mammals>(from dr in DT.AsEnumerable() select (GetMammalRow(dr)));
        return lst;
    }
    private Mammals GetMammalRow(DataRow dr)
    {
        Mammals ss = new Mammals(dr["mammal"].ToString());
        return ss;
    }

}