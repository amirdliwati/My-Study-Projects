
using System;
using System.Collections.Generic;
using System.Text;

namespace BIT_ITC230_Ula_22596_C5_Hom2
{
    class Program
    {
        static void Main(string[] args)
        {
            // virable decleration
            int length, noUser = 0;
            double[] price; // price array
            string[] name; //names array
            double[] consume;  // consume array
            double tCons, tPrice; // temp
            string tName; // temp


            Welcome(); // go to sub 1

            // input length of table
            System.Console.Write("Enter the Length of the Arrays");
            length = readLength();// go to sub 2


            System.Console.WriteLine();

            // read length of table ,creat new array to store the element
            consume = new double[length];
            name = new string[length];
            price = new double[length];

            //  make price array =0 for each element
            for (int i = 0; i <= price.Length - 1; i++)
                price[i] = 0;

            //// names array
            //System.Console.WriteLine("plz Enter The Names you want to Compute the Consume:");
            //for (int i = 0; i <= name.Length - 1; i++)
            //    name[i] = System.Console.ReadLine();


            //System.Console.WriteLine();

            // consume array
            System.Console.WriteLine("plz Enter the Name and Consume for each User, The Consume must be Possetive ");
            System.Console.WriteLine();
            for (int i = 0; i <= consume.Length - 1; i++)
            {
                name[i] = System.Console.ReadLine();
                consume[i] = int.Parse(System.Console.ReadLine());
                System.Console.WriteLine();
                if (consume[i] >= 0)
                {
                    noUser = noUser + 1;
                }

                else
                {

                    System.Console.WriteLine("Error, The Consume must be Possetive,The inputs of Consumes is end");
                    consume[i] = 0;
                    name[i] = " ";
                    break;
                }
                System.Console.WriteLine(" Name:" + name[i] + "   " + "Consume:" + consume[i]);
                System.Console.WriteLine();

            }

            System.Console.WriteLine();

            //to get price
            for (int i = 0; i <= price.Length - 1; i++)
            {
                if ((consume[i] >= 0) && (consume[i] < 1000))
                {
                    price[i] = consume[i] * 1.5;
                }
                else
                {
                    if ((consume[i] >= 1000) && (consume[i] <= 2000))
                    {

                        price[i] = 1500 + (consume[i] - 1000) * 2.5;
                    }

                    else
                    {
                        price[i] = 1500 + 2500 + (consume[i] - 2000) * 5;

                    }
                }

            }


            //// print name array
            //System.Console.WriteLine("The Names Array is: ");
            //for (int i = 0; i <= name.Length - 1; i++)
            //{
            //    System.Console.Write(name[i] + ", ");
            //}

            //System.Console.WriteLine();
            //System.Console.WriteLine();


            //// print consume array
            //System.Console.WriteLine("The Consumes Array is: ");
            //for (int i = 0; i <= consume.Length - 1; i++)
            //{
            //    System.Console.Write(consume[i] + ", ");
            //}

            //System.Console.WriteLine();
            //System.Console.WriteLine();

            ////print price array
            //System.Console.WriteLine("The Prices Array is: ");
            //for (int i = 0; i <= price.Length - 1; i++)
            //{
            //    System.Console.Write(price[i] + ", ");

            //}
            //System.Console.WriteLine();
            //System.Console.WriteLine();


            // befor sorting
            System.Console.WriteLine("The ArrayS Befor Sortting");
            for (int i = 0; i <= consume.Length - 1; i++)
                System.Console.WriteLine("  Name: " + name[i] + "  Consume= " + consume[i] + "  Price= " + price[i]);

            System.Console.WriteLine();
            System.Console.WriteLine();

            //sorting
            for (int k = 0; k <= consume.Length - 1; k++)
                for (int i = 0; i <= consume.Length - 2; i++)
                    if (consume[i] > consume[i + 1])
                    {
                        tCons = consume[i];
                        tPrice = price[i];
                        tName = name[i];

                        consume[i] = consume[i + 1];
                        price[i] = price[i + 1];
                        name[i] = name[i + 1];

                        consume[i + 1] = tCons;
                        price[i + 1] = tPrice;
                        name[i + 1] = tName;

                    }


            // print arrays after sorting
            System.Console.WriteLine("The ArrayS After Sortting by Consume ");
            for (int i = 0; i <= consume.Length - 1; i++)
                System.Console.WriteLine("  Name: " + name[i] + "  Consume= " + consume[i] + "  Price= " + price[i]);

            System.Console.WriteLine();
            System.Console.WriteLine();

            //to get max consume
            System.Console.WriteLine("The MaxConsume is:" + MaxConsume(consume)); // go to sub 3

            // to get max name
            System.Console.WriteLine("The Name of MaxConsume is:" + MaxName(name, consume)); // go to sub 4

            // to get the average
            System.Console.WriteLine("The Average of Consumes is:" + Average(consume, noUser)); // go to sub 5
            System.Console.WriteLine();

            OUT();// go to sub 6
            System.Console.ReadLine();
        }
        //sub 1
        static void Welcome()
        {
            System.Console.WriteLine("Welcome to my Program, I am Ula_22596 Engineer");
            System.Console.WriteLine();
        }

        // sub 2
        static int readLength()
        {
            int a;
            System.Console.Write(",plz Enter integer Number: ");
            a = int.Parse(System.Console.ReadLine());

            return a;
        }

        //sub 3
        static double MaxConsume(double[] a)
        {
            double maxconsume = a[0];
            for (int i = 0; i <= a.Length - 1; i++)
            {

                if (maxconsume < a[i])

                    maxconsume = a[i];

            }
            return maxconsume;
        }

        // sub 4
        static string MaxName(string[] n, double[] a)
        {
            double maxconsume = a[0];
            string maxname = n[0];
            for (int i = 0; i <= a.Length - 1; i++)
            {

                if (maxconsume < a[i])
                {
                    maxconsume = a[i];
                    maxname = n[i];

                }

            }
            return maxname;
        }

        // sub 5
        static double Average(double[] a, int noUser)
        {
            double sum = 0, avg = 0;
            for (int i = 0; i <= a.Length - 1; i++)
            {

                sum = sum + a[i];

            }
            avg = sum / noUser;
            return avg;
        }

        // sub 6
        static void OUT()
        {

            System.Console.WriteLine("The Program is Finish please Out from Console Screan");
            System.Console.WriteLine();
        }


    }

}

