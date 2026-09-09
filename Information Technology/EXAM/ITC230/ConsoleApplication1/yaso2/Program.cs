using System;
using System.Collections.Generic;
using System.Text;

namespace yaso2
{
    class Program
    {
        static void Main(string[] args)
        {

            
            int max = 0, average = 0, loop = 0; //counter = 0, /// loop ???????
            int[] Consume = new int[1000];
            double[] price = new double[1000];
            string[] name = new string[1000];
            int c = 0;//// Ula


            Console.WriteLine("\t Welcome To Syrian Elericity & Water Co.");
            Console.WriteLine();
            Console.WriteLine("Please Enter The Following, Note:(Any Minus Value Will End Entering Values&Names)");
            Console.WriteLine();
            for (int i = 0; i < Consume.Length-1; i++)
            {
                Console.Write("The Consumption:   ");
                Consume[i] = int.Parse(Console.ReadLine());
                if (Consume[i] > 0)
                {
                    average = average + Consume[i];
                    Console.Write("The Name:   ");
                    name[i] = Console.ReadLine();
                    c = c + 1;//// Ula
                    if (max < Consume[i])
                    {
                        max = Consume[i];
                        loop = i;/// ???????
                    }
                    price[i] = Program.clacConsumbtion(Consume[i]);
                }
                else
                    break;
                //counter++;//////// ????????????? 
            }
            //sort the consumption results only ,so when you look carefully you
            //will find (names & price) will not change.
            //we have to change also the order of price and names.
         
            int temp;//this (for) will order the results descending.
            string tempn; /// Ula
            double tempp;/// Ula
            for (int x = 0; x <= c - 1; x++)//// Ula
            {
                for (int y = 0; y <= c - 2; y++)////////////Ula
                {
                    if (Consume[y] > Consume[y + 1])
                    {
                        temp = Consume[y];/////////// Ula
                        tempn = name[y];
                        tempp = price[y];
                        Consume[y ] = Consume[y+1];
                        name[y] = name[y + 1];
                        price[y] = price[y + 1];
                        Consume[y+1] = temp;
                        name[y + 1] = tempn;
                        price[y + 1] = tempp;
                    }
                }
            }

            Console.WriteLine("Name" + "\t\t" + "Consume" + "\t\t" + "Price");
            for (int i = 0; i <= c - 1; i++)//////////Ula
            {
                Console.WriteLine(name[i] + "\t\t" + Consume[i] + "\t\t" + price[i]);
            }
            Console.WriteLine("Te average is :  " + (double)average / c);
            Console.WriteLine("The Name Of The Max consumption is :   " + name[loop]);
            Console.ReadLine();

        }

        
                    public static double clacConsumbtion(double con)
        {
            if (con < 1000)//the first case 
            {
                con *= 1.5;
            }
            else if (con >= 1000 && con < 2000)//the second case
            {
                double t = 1000 * 1.5;//the calculation of the first section
                con -= 1000;//sub the 1000 from the con result //here was your mistake
                con *= 2.5;//calculte the intrest or the rest of the con
                con += t;//add the value of the first section to the new value of con
            }
            else //The third case
            {
                double t = 1000 * 1.5;//the same of upove but with the add of the second section
                double t1 = 1000 * 2.5;
                con -= 2000;
                con *= 5;
                con += t + t1;
            }
            return con;
        }
      
        }
    }

