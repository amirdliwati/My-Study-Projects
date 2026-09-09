using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using VDS.RDF;
using System.ComponentModel;
using VDS.RDF.Query;
using VDS.RDF.Parsing;

/// <summary>
/// Summary description for QueryBLL
/// </summary>
[System.ComponentModel.DataObject]
public static class QueryBLL
{

    public static DataTable ExecuteSelect(String Query)
    {

        TripleStore store = new TripleStore();

        Graph g1 = new Graph();
        g1.LoadFromFile(HttpContext.Current.Server.MapPath(@"App_Data\SportsInSyria.rdf"));

        store.Add(g1);

        DataTable DT = new DataTable();

        Object results = store.ExecuteQuery(Query);

        if (results is SparqlResultSet)
        {

            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        return DT;
    }
 
    public static DataTable ExecuteSelect(String Query, Graph graph)
    {

        TripleStore store = new TripleStore();


        store.Add(graph);

        DataTable DT = new DataTable();

        Object results = store.ExecuteQuery(Query);

        if (results is SparqlResultSet)
        {

            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        return DT;
    }

    public static DataTable ExecuteDescribe(String Query)
    {

        TripleStore store = new TripleStore();

        Graph g1 = new Graph();
        g1.LoadFromFile(HttpContext.Current.Server.MapPath(@"App_Data\SportsInSyria.rdf"));

        store.Add(g1);

        DataTable DT = new DataTable();

        Object results = store.ExecuteQuery(Query);

        if (results is SparqlResultSet)
        {

            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        return DT;
    }
    public static Graph ExecuteConstruct(String Query)
    {

        TripleStore store = new TripleStore();

        Graph g1 = new Graph();
        g1.LoadFromFile(HttpContext.Current.Server.MapPath(@"App_Data\SportsInSyria.rdf"));

        store.Add(g1);

       // DataTable DT = new DataTable();
       // SparqlQueryParser sparqlparser = new SparqlQueryParser();
       // SparqlQuery sparqlQuery = sparqlparser.ParseFromString(Query);
        Object results = store.ExecuteQuery(Query);
        return (Graph)  results;
    }
    public static TripleCollection ExecuteConstruct1(String Query)
    {

        TripleStore store = new TripleStore();

        Graph g1 = new Graph();
        g1.LoadFromFile(HttpContext.Current.Server.MapPath(@"App_Data\SportsInSyria.rdf"));

        store.Add(g1);

        TripleCollection TC = new TripleCollection();

        Object results = store.ExecuteQuery(Query);

        if (results is SparqlResultSet)
        {

            SparqlResultSet rset = (SparqlResultSet)results;
            TC = (TripleCollection)rset.ToTripleCollection(null);
            //DT = RdfBLL.FillDataTableFrom(rset);
        }
         
        return TC;
    }

    public static Boolean ExecuteAsk(String Query)
    {

        TripleStore store = new TripleStore();

        Graph g1 = new Graph();
        g1.LoadFromFile(HttpContext.Current.Server.MapPath(@"App_Data\SportsInSyria.rdf"));

        store.Add(g1);

        Object results = store.ExecuteQuery(Query);

        return  ((SparqlResultSet)results).Result ;
    }
    
}