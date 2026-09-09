using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Runtime.Remoting;
using System.Runtime.Remoting.Channels;
using System.Runtime.Remoting.Channels.Http;
using System.Runtime.Remoting.Channels.Tcp;

namespace MyServer
{
    class Program
    {
        static void Main(string[] args)
        {
            RemotingConfiguration.ApplicationName = "SvuCompany";
            WellKnownServiceTypeEntry shahata =
              new WellKnownServiceTypeEntry(typeof(MyServer.MyLogin),
                                            "MyRemoteObject",
                                     WellKnownObjectMode.SingleCall);
            RemotingConfiguration.RegisterWellKnownServiceType(shahata);
          
            WellKnownServiceTypeEntry shahata1 =
              new WellKnownServiceTypeEntry(typeof(MyServer.Company),
                                            "MyRemoteObject1",
                                     WellKnownObjectMode.SingleCall);
            RemotingConfiguration.RegisterWellKnownServiceType(shahata1);

            
            
            ChannelServices.RegisterChannel(new HttpChannel(9000));
            //ChannelServices.RegisterChannel(new TcpChannel(4242));
            Console.WriteLine("Remoting server started. Hit 'Enter' to stop");
            Console.ReadLine();
        }
    }
}
