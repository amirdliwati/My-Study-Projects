using System;
using System.Collections.Generic;
using System.Text;

namespace ZoherArraylec6
{
    class Program
    {
        static void Main(string[] args)
        {
            int[] C ;
            int NC = 10;// length of array
            C= new int[NC + 1];

            int e; string se;

           
            // array initialization
            // C=new int[NC+1];

            for (e = 1; e <= NC; e++)
            {
                C[e] = 0; 
            }

            //processing
            do
            {
                //read e
                se = System.Console.ReadLine();
                e = Int32.Parse(se);

                //increment C[e]
                if ((1 <= e) && (e <= NC))
                    C[e]++;

            } while (e != 0);

            // write results C[]

            for (e=1; e <=NC; e++)
                System .Console .WriteLine ("Candidate "+ e +"= "+C[e]);

            System .Console .ReadLine ();

        }
    }
}
