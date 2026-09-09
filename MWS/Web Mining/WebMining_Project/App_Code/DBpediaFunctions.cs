using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data;
using VDS.RDF.Query;
using System.ComponentModel;
using SportLibrary;

/// <summary>
/// Summary description for DBpediaFunctions
/// </summary>
[DataObject]
public class DBpediaFunctions
{
	public DBpediaFunctions()
	{
		//
		// TODO: Add constructor logic here
		//
	}

    // إن مكتبة dotnetrdf تقوم بارسال الاستعلام و استقبال النتائج ك xml 1.0 عبر
    // QueryWithResultSet و لكن موقع http://dbpedia.org/sparql أصبح يعيد XML 1.1 
    // لذلك أبقينا عليها كمثال برمجي عن الاستخدام الصحيح و قمنا بالتعامل بطريقة أخرى 
    //
    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public DataTable footballersEx()
    {
        SparqlRemoteEndpoint endpoint = new SparqlRemoteEndpoint(new Uri("http://dbpedia.org/sparql"), "http://dbpedia.org");

        SparqlResultSet results = endpoint.QueryWithResultSet(
        @"PREFIX skos: <http://www.w3.org/2004/02/skos/core#>   
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>   
        PREFIX  foaf:  <http://xmlns.com/foaf/0.1/> 
        PREFIX  ont:  <http://dbpedia.org/ontology/>
        PREFIX  dcterms:  <http://purl.org/dc/terms/>

        SELECT DISTINCT  ?p ?Name ?abstract ?BirthDate  ?Position ?thumbnail 
        WHERE {
                ?p dcterms:subject <http://dbpedia.org/resource/Category:Syrian_footballers>.
                ?p rdfs:label ?Name.
                FILTER(lang(?Name) = 'en' ).
                ?p dbpedia-owl:abstract ?abstract.
                FILTER(lang(?abstract) = 'en' ).
                ?p dbpprop:birthDate ?BirthDate.
                ?p dbpedia-owl:height ?height.
                ?p dbpedia-owl:position ?Position.
                ?p dbpedia-owl:thumbnail ?thumbnail.

              }ORDER BY (?Name )");

        DataTable DT = new DataTable();
        if (results is SparqlResultSet)
        {
            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        return DT;
    }

    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public DataTable SwimmersEx()
    {
        SparqlRemoteEndpoint endpoint = new SparqlRemoteEndpoint(new Uri("http://dbpedia.org/sparql"), "http://dbpedia.org");

        SparqlResultSet results = endpoint.QueryWithResultSet(
        @"PREFIX skos: <http://www.w3.org/2004/02/skos/core#>   
        PREFIX rdfs: <http://www.w3.org/2000/01/rdf-schema#>   
        PREFIX  foaf:  <http://xmlns.com/foaf/0.1/> 
        PREFIX  ont:  <http://dbpedia.org/ontology/>

        SELECT DISTINCT   *
        WHERE {    
             ?p dcterms:subject <http://dbpedia.org/resource/Category:Syrian_swimmers>.   
             ?p rdfs:label ?Name.
             FILTER (lang(?Name) = 'en' ).
             ?p dbpedia-owl:abstract ?abstract.
             FILTER(lang(?abstract) = 'en' ).
             ?p dbpprop:birthDate ?BirthDate.
             ?p dbpedia-owl:height ?height.
             ?p dbpedia-owl:weight ?weight.
             OPTIONAL {?p dbpprop:shortDescription ?Description.}
    
              }ORDER BY (?Name )");

        DataTable DT = new DataTable();
        if (results is SparqlResultSet)
        {
            SparqlResultSet rset = (SparqlResultSet)results;
            DT = RdfBLL.FillDataTableFrom(rset);
        }
        return DT;
    }
  
    /////

    /////
    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<FootBall> getFootball()
    {
        List<FootBall> RSList = new List<FootBall>();
        RemoteSparql dbPedia = new RemoteSparql();
        RSList = dbPedia.FootBallDBpedia("http://dbpedia.org/sparql?default-graph-uri=http%3A%2F%2Fdbpedia.org&query=PREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E+++%0D%0A++++++++PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E+++%0D%0A++++++++PREFIX++foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0D%0A++++++++PREFIX++ont%3A++%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0D%0A++++++++PREFIX++dcterms%3A++%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0A%0D%0A%0D%0ASELECT+DISTINCT++%3Fp+%3FName+%3Fabstract+%3FBirthDate+%3Fheight+%3FPosition+%3Fthumbnail+%0D%0AWHERE+%7B%0D%0A++++++++%3Fp+dcterms%3Asubject+%3Chttp%3A%2F%2Fdbpedia.org%2Fresource%2FCategory%3ASyrian_footballers%3E.%0D%0A++++++++%3Fp+rdfs%3Alabel+%3FName.%0D%0A++++++++FILTER%28lang%28%3FName%29+%3D+%27en%27+%29.%0D%0A++++++++%3Fp+dbpedia-owl%3Aabstract+%3Fabstract.%0D%0A++++++++FILTER%28lang%28%3Fabstract%29+%3D+%27en%27+%29.%0D%0A++++++++%3Fp+dbpprop%3AbirthDate+%3FBirthDate.%0D%0A++++++++%3Fp+dbpedia-owl%3Aheight+%3Fheight.%0D%0A++++++++%3Fp+dbpedia-owl%3Aposition+%3FPosition.%0D%0A++++++++%3Fp+dbpedia-owl%3Athumbnail+%3Fthumbnail.%0D%0A%0D%0A++++++%7DORDER+BY+%28%3FName+%29%0D%0A%0D%0A++++++++%0D%0A%0D%0A&format=text%2Fhtml&timeout=30000&debug=on");

        for (int i = 0; i < RSList.Count; i++)
        {
            {
                RSList[i].BirthDate = RSList[i].BirthDate.Substring(0, 10);
                if (RSList[i].Thumbnail.Trim() != "")
                {
                    int x = RSList[i].Thumbnail.IndexOf("href");
                    int y = RSList[i].Thumbnail.IndexOf(">");
                    RSList[i].Thumbnail = RSList[i].Thumbnail.Substring(x + 6, y - (x + 6 + 1));
                }
                if (RSList[i].Position.Trim() != "")
                {
                    int x = RSList[i].Position.IndexOf("href");
                    int y = RSList[i].Position.IndexOf(">");
                    RSList[i].Position = RSList[i].Position.Substring(x + 35, y - (x + 35 + 1));
                }
            }
        }
        return RSList;
    }

    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<PediaSwimmers> getSwimmers()
    {
        List<PediaSwimmers> RSList = new List<PediaSwimmers>();
        RemoteSparql dbPedia = new RemoteSparql();
        RSList = dbPedia.SwimmerDBpedia("http://dbpedia.org/sparql?default-graph-uri=http%3A%2F%2Fdbpedia.org&query=PREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E+++%0D%0APREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E+++%0D%0APREFIX++foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0D%0APREFIX++ont%3A++%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0D%0A%0D%0ASELECT+DISTINCT+++*%0D%0AWHERE+%7B++++%0D%0A+++++%3Fp+dcterms%3Asubject+%3Chttp%3A%2F%2Fdbpedia.org%2Fresource%2FCategory%3ASyrian_swimmers%3E.+++%0D%0A+++++%3Fp+rdfs%3Alabel+%3FName.%0D%0A+++++FILTER+%28lang%28%3FName%29+%3D+%27en%27+%29.%0D%0A+++++%3Fp+dbpedia-owl%3Aabstract+%3Fabstract.%0D%0A+++++FILTER%28lang%28%3Fabstract%29+%3D+%27en%27+%29.%0D%0A+++++%3Fp+dbpprop%3AbirthDate+%3FBirthDate.%0D%0A+++++%3Fp+dbpedia-owl%3Aheight+%3Fheight.%0D%0A+++++%3Fp+dbpedia-owl%3Aweight+%3Fweight.%0D%0A+++++OPTIONAL+%7B%3Fp+dbpprop%3AshortDescription+%3FDescription.%7D%0D%0A++++%0D%0A++++%0D%0A%7DORDER+BY+%28%3FName+%29&format=text%2Fhtml&timeout=300000&debug=on");

        for (int i = 0; i < RSList.Count; i++)
        {
            {
                RSList[i].BirthDate = RSList[i].BirthDate.Substring(0, 10);
            }
        }
        return RSList;
    }

    [DataObjectMethod(DataObjectMethodType.Select, true)]
    public List<PediaBasketBall> getBasketball()
    {
        List<PediaBasketBall> RSList = new List<PediaBasketBall>();
        RemoteSparql dbPedia = new RemoteSparql();
        RSList = dbPedia.BasketBallDBpedia("http://dbpedia.org/sparql?default-graph-uri=http%3A%2F%2Fdbpedia.org&query=PREFIX+skos%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2004%2F02%2Fskos%2Fcore%23%3E+++%0D%0A++++++++PREFIX+rdfs%3A+%3Chttp%3A%2F%2Fwww.w3.org%2F2000%2F01%2Frdf-schema%23%3E+++%0D%0A++++++++PREFIX++foaf%3A++%3Chttp%3A%2F%2Fxmlns.com%2Ffoaf%2F0.1%2F%3E+%0D%0A++++++++PREFIX++ont%3A++%3Chttp%3A%2F%2Fdbpedia.org%2Fontology%2F%3E%0D%0A++++++++PREFIX++dcterms%3A++%3Chttp%3A%2F%2Fpurl.org%2Fdc%2Fterms%2F%3E%0D%0A%0D%0ASELECT+DISTINCT++%3Fp+%3FName+%3Fabstract+%3FbirthDate+%0D%0AWHERE+%7B++++%0D%0A+++++%3Fp+dcterms%3Asubject+%3Chttp%3A%2F%2Fdbpedia.org%2Fresource%2FCategory%3ASyrian_basketball_players%3E.+++%0D%0A+++++%3Fp+rdfs%3Alabel+%3FName.%0D%0A++++++FILTER+%28lang%28%3FName%29+%3D+%27en%27+%29.%0D%0A+++++%3Fp+dbpedia-owl%3Aabstract+%3Fabstract.%0D%0A+++++%3Fp+dbpedia-owl%3AbirthDate+%3FbirthDate.%0D%0A%7D&format=text%2Fhtml&timeout=30000&debug=on");

        for (int i = 0; i < RSList.Count; i++)
        {
            {
                RSList[i].BirthDate = RSList[i].BirthDate.Substring(0, 10);
            }
        }
        return RSList;
    }

}