using System;
using System.Collections.Generic;
using System.Text;


namespace Array2
{
    class Program
    {
        static void Main(string[] args)
        {
            // v d
            int length ,max =0, min=0, sum=0;
            string sn, snum;
            int[] t1;

            // input length of table
            System.Console.WriteLine(" Entter the Count of length table");
            sn=System.Console.ReadLine();
            length  = int.Parse(sn);


            // read length of table
            t1=new int [length];

            //read array elements
            for (int i = 0; i <= t1.Length - 1; i++)
            {
                System.Console.WriteLine(" enter ur numbers");
                snum= System.Console.ReadLine();
                t1[i] = int.Parse(snum);
            }



            //processing array elements
            for (int i = 0; i <= t1.Length - 1; i++)
            {

                sum += t1[i];

                if (max < t1[i])
                    max = t1[i];

                if (min > t1[i])
                    min = t1[i];
            }
            
            //output
            System.Console.WriteLine("the element of array is :");
            for (int i = 0; i <= t1.Length - 1; i++)
            {
                System.Console.WriteLine(t1[i]);
            }


            System.Console.WriteLine("sum= " + sum);
            System.Console.WriteLine("max= " + max);
            System.Console.WriteLine("min= " + min);
            System.Console.ReadLine();



        }
    }
}
