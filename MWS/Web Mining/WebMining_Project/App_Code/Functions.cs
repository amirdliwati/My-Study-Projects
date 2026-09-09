using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using SportLibrary;
using VDS.RDF;
using VDS.RDF.Query;
using System.ComponentModel;

/// <summary>
/// Summary description for Functions
/// </summary>
/// 
[DataObject]
public class Functions
{
	public Functions()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    private string ConnectionString = @"~\App_Data\SportsInSyria.rdf";
    DataTable DT = new DataTable();

    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<Team> GetTeams()
    {
        TripleStore store = new TripleStore();
        Graph g1 = new Graph();
        g1.LoadFromFile(HostingEnvironment.MapPath(ConnectionString));
        store.Add(g1);

        Object results = store.ExecuteQuery(@"PREFIX s:<http://www.syrianSports.com/Syntax#>
        SELECT ?TeamName ?WonMatchs ?FailMatchs 
        WHERE 
        {
            ?s s:TeamName ?TeamName;
            s:WonMatchs ?WonMatchs ;
            s:FailMatchs ?FailMatchs.
        } ");

        if (results is SparqlResultSet)
        {
            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        List<Team> lst = new List<Team>(from dr in DT.AsEnumerable() select (GetTeamDTRow(dr)));
        return lst;
    }
    private Team GetTeamDTRow(DataRow dr)
    {
        Team team = new Team(dr["TeamName"].ToString(),
            Convert.ToInt32(dr["WonMatchs"].ToString()),
            Convert.ToInt32(dr["FailMatchs"].ToString()));
        return team;
    }

    /////////
    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<SwimmingPool> GetSwimmingPools()
    {
        SwimmingPool s = new SwimmingPool();
        
        TripleStore store = new TripleStore();
        Graph g1 = new Graph();
        g1.LoadFromFile(HostingEnvironment.MapPath(ConnectionString));
        store.Add(g1);
        Object results = store.ExecuteQuery(@"PREFIX s:<http://www.syrianSports.com/Syntax#>
            SELECT  ?PoolName ?Location ?AccessStreet ?Condition ?SwimmingPoolDescription ?SwimmingPoolImage ?Services
            WHERE 
            {
                ?p s:PoolName ?PoolName.
                ?p s:Location ?Location.
                ?p s:AccessStreet  ?AccessStreet.
                ?p s:Condition ?Condition.
                ?p s:SwimmingPoolDescription ?SwimmingPoolDescription.
                ?p s:SwimmingPoolImage ?SwimmingPoolImage.
                ?p s:Services ?Services.
            }");

        if (results is SparqlResultSet)
        {
            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        List<SwimmingPool> lst = new List<SwimmingPool>(from drow in DT.AsEnumerable() select (GetSwimmingPoolDTRow(drow)));
        return lst;
    }
    private SwimmingPool GetSwimmingPoolDTRow(DataRow dr)
    {
        SwimmingPool sp = new SwimmingPool();
        sp.PoolName = dr["PoolName"].ToString();
        sp.Location = dr["Location"].ToString();
        sp.AccessStreet = dr["AccessStreet"].ToString();
        sp.Condition = dr["Condition"].ToString();
        sp.SwimmingPoolDescription = dr["SwimmingPoolDescription"].ToString();
        sp.SwimmingPoolImage = dr["SwimmingPoolImage"].ToString();
        sp.Services = dr["Services"].ToString();
        return sp;
    }

    //////////
    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<Swimmer> GetAllSwimmers()
    {
        TripleStore store = new TripleStore();
        Graph g1 = new Graph();
        g1.LoadFromFile(HostingEnvironment.MapPath(ConnectionString));
        store.Add(g1);
        Object results = store.ExecuteQuery(@"PREFIX s:<http://www.syrianSports.com/Syntax#>
        SELECT *
        WHERE 
        {
            ?s
            s:EngName ?EngName ;
            s:ArName ?ArName;
            s:BirthDate ?BirthDate;
            s:Abstract ?Abstract;
            s:City ?City;
            s:SwimmerImage ?SwimmerImage;
            s:Awards ?Awards.
        }");

        if (results is SparqlResultSet)
        {
            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        List<Swimmer> lst = new List<Swimmer>(from drow in DT.AsEnumerable()select (GetSwimmerDataTableRow(drow)));
        return lst;
    }
    private Swimmer GetSwimmerDataTableRow(DataRow dr)
    {
        Swimmer swimmer = new Swimmer();
        swimmer.EngName = dr["EngName"].ToString();
        swimmer.ArName = dr["ArName"].ToString();
        swimmer.BirthDate = dr["BirthDate"].ToString();
        swimmer.City = dr["City"].ToString();
        swimmer.Abstract = dr["Abstract"].ToString();
        swimmer.SwimmerImage = dr["SwimmerImage"].ToString();
        swimmer.Awards = dr["Awards"].ToString();
        return swimmer;
    }

    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public DataTable GetSwimmerTeam(string swimmer)
    {
        TripleStore store = new TripleStore();
        Graph g1 = new Graph();
        g1.LoadFromFile(HostingEnvironment.MapPath(ConnectionString));
        store.Add(g1);
        string command = @"PREFIX s:<http://www.syrianSports.com/Syntax#>
            SELECT  ?teamname
            WHERE 
            {
                s:" + swimmer + @" s:SwimmerTeam ?team.
                ?team s:TeamName ?teamname;
            }";

        Object results = store.ExecuteQuery(command);

        if (results is SparqlResultSet)
        {
            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        return DT;
    }
    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public DataTable GetSwimInPool(string swimmer)
    {
        TripleStore store = new TripleStore();
        Graph g1 = new Graph();
        g1.LoadFromFile(HostingEnvironment.MapPath(ConnectionString));
        store.Add(g1);
        string command = @"PREFIX s:<http://www.syrianSports.com/Syntax#>
            SELECT  ?Pool
            WHERE 
            {
                s:" + swimmer + @" s:SwimIn ?P.
                ?P  s:PoolName ?Pool;
            }";
        Object results = store.ExecuteQuery(command);

        if (results is SparqlResultSet)
        {
            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        return DT;
    }
}