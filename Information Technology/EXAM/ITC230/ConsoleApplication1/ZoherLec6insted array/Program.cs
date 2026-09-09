using System;
using System.Collections.Generic;
using System.Text;

namespace ZoherLec6insted_array
{
    class Program
    {
        static void Main(string[] args)
        {
            int e;
            string se;
            int   c1=0, c2=0, c3=0, c4=0;

            do
            { //read e 
                se= System.Console .ReadLine ();
                e=Int32 .Parse(se);

                // incrment ce
                if ((1<= e) && (e <= 4))
                {
                if (e == 1)
                        c1 = c1 + 1;
                    
                if (e==2)
                        c1= c1 + 1;
                if(e==3)
                        c3 = c3 + 1;
                if(e==4)
                        c4 = c4 + 1;
                }

            }while (e !=0);

            // write result ce
            System.Console.WriteLine("c1= " + c1);
            System.Console.WriteLine("c2=" + c2);
            System.Console.WriteLine("c3=" + c3);
            System.Console.WriteLine("c4=" + c4);
            System.Console.ReadLine ();

        }
    }
}
