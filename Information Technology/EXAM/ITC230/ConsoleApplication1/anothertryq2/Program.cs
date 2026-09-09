using System;
using System.Collections.Generic;
using System.Text;

namespace trybbas
{
    class Program
    {
        static void Main(string[] args)
        {
            // v d
            int length, noUser = 0;
            double[] price;//m = 0, avg = 0;
            //maxconsume = 0, sum = 0, avg = 0;
            string[] name;
            //maxname ;
            double[] consume,
            maxconsume;//ay
            double tCons, tPrice;
            string tName;

            Welcome();

            // input length of table
            System.Console.Write(" Enter the Count of length table: ");
            length = int.Parse(System.Console.ReadLine());


            // read length of table
            consume = new double[length];
            name = new string[length];
            price = new double[length];

            // price array
            for (int i = 0; i <= price.Length - 1; i++)
                price[i] = 0;

            // names array
            System.Console.WriteLine("plz enter the names u want to compute the consume");
            for (int i = 0; i <= name.Length - 1; i++)
                name[i] = System.Console.ReadLine();

            // consume array
            //maxconsume = consume[0];
            System.Console.WriteLine("plz enter the consume for each user u write it, it must be possetive ");
            for (int i = 0; i <= consume.Length - 1; i++)
            {
                consume[i] = int.Parse(System.Console.ReadLine());
                if (consume[i] >= 0)
                {
                    noUser = noUser + 1;
                    //consume[i] = 0;
                    continue;

                }

                else
                {

                    System.Console.WriteLine("Error");
                    consume[i] = 0;
                    break;
                }

            }
                //for (int i = 0; i <= consume.Length - 1; i++)
                //{ //to get maxconsume and maxname
                //               if((maxconsume)<(consume[i]))
                //               {
                //                   maxconsume = consume[i];
                //                   //maxname = name[i];
                //               }
                //}


                

            //to get price
            for (int i = 0; i <= price.Length - 1; i++)
            {
                //if (consume[i] < 0)
                //    break;

                if ((consume[i] >= 0) && (consume[i] < 1000))
                {
                    price[i] = consume[i] * 1.5;
                    //sum += price[i];  /// sum=sum + price;
                }
                else
                {
                    if ((consume[i] >= 1000) && (consume[i] <= 2000))
                    {

                        price[i] = 1500 + (consume[i] - 1000) * 2.5;
                        //sum += price[i];
                    }

                    else
                    {
                        price[i] = 1500 + 2500 + (consume[i] - 2000) * 5;
                        
                    }
                }

            }


            // print name array
            System.Console.WriteLine("the Names Array");
            for (int i = 0; i <= name.Length - 1; i++)
            {
                System.Console.Write(name[i] + " ");
            }

            System.Console.WriteLine();


            // print consume array
            System.Console.WriteLine("the Consume Array");
            for (int i = 0; i <= consume.Length - 1; i++)
            {
                System.Console.Write(consume[i] + " ");
            }
            System.Console.WriteLine();

            //print price array
            System.Console.WriteLine("the Price Array");
            for (int i = 0; i <= price.Length - 1; i++)
            {
                System.Console.Write(price[i] + " ");

            }
            System.Console.WriteLine();


            // befor sorting
            System.Console.WriteLine("The ArrayS Befor Sortting");
            for (int i = 0; i <= consume.Length - 1; i++)
                System.Console.WriteLine("Consume= " + consume[i] + "  Name: " + name[i] + "  Price= " + price[i]);

            System.Console.WriteLine();

            System.Console.WriteLine("The ArrayS After Sortting by Consume ");
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
            for (int i = 0; i <= consume.Length - 1; i++)
                System.Console.WriteLine("Consume= " + consume[i] + "  Name: " + name[i] + "  Price= " + price[i]);


            //get avg
            maxconsume = consume[0];
            for (int i = 0; i <= consume.Length - 1; i++)
            {

                sum =sum+ consume[i];
            }
            System.Console.WriteLine("sum of consume is" + sum);
            //avg = sum / noUser;
            //System.Console.WriteLine("avg is:" + avg);
            
            //System.Console.WriteLine(" The MaxConsume is: " + maxconsume);
            //System.Console.WriteLine("The MaxName is: " + maxname);


            // to get avg
            //avg = sum / noUser;
            //for (int i = 0; i <= consume.Length - 1; i++)
            //{
            //    //sum += consume[i];
            //    System.Console.WriteLine(consume[i]);

            //}




            System.Console.ReadLine();




        }
        //sub 1
        static void Welcome()
        {
            System.Console.WriteLine("Welcome to my Program, I am Ula_22596 Engineer");
            System.Console.WriteLine();
        }

    }
}





