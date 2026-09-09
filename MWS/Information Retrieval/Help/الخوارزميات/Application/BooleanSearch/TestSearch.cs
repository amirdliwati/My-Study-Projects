using System;
using System.Text;
using System.Collections;
using System.IO;

namespace BooleanSearch
{
	// ADJH: TODO!
	// (seco)() causes infinite loop

	class TestSearch
	{
		/// <summary>
		/// The main entry point for the application.
		/// </summary>
		[STAThread]
		static void Main(string[] args)
		{
			// First create the document repository that we will search;
			// for demonstration purposes we will just index all .XML files
			// in the source directory
			DirectoryInfo f = new DirectoryInfo("../..");
			FileInfo[] files = f.GetFiles("*.xml");

			IDocument[] docs = new IDocument[files.Length];

			for (int i = 0; i < files.Length; i ++)
			{
				docs[i] = new XMLDocument(files[i].FullName);
				Console.WriteLine("Adding repository document " + docs[i].Name());
				Console.WriteLine("Text of document:\n" +
					File.OpenText(docs[i].Name()).ReadToEnd() + "\n");
			}

			// Now loop round, accepting lines from stdin and searching
			// for them among the document repository, until the user enters
			// an empty string or breaks out
			while(true)
			{
				Console.WriteLine("Please enter a boolean search query, or just press return to end\n");

				string search_query = Console.ReadLine();
					
				if (search_query.Length == 0)
					break;
			
				Console.WriteLine("Seach for: " + search_query);
							
				QueryBuilder builder = new QueryBuilder(search_query);
				
				if (builder.Validate() == false)
				{
					Console.WriteLine("Malformed query");
					continue;
				}
			
				QueryTree tree = builder.BuildTree();
				
				IDocument[] matches = tree.GetMatches(docs);

				Console.WriteLine("Search term matches " + matches.Length + " documents");
			
				foreach(IDocument match in matches)
					Console.WriteLine("Match document: " + match.Name());
			}
		}
	}
}
