﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketEngine.Configuration;
using SuperSocket.SocketEngine;
using System.Configuration;
using SuperSocket.Common;

namespace StartUp
{
    class Program
    {
        static void Main(string[] args)
        {
            LogUtil.Setup();

            SocketServiceConfig serverConfig = ConfigurationManager.GetSection("socketServer") as SocketServiceConfig;
            if (!SocketServerManager.Initialize(serverConfig))
            {
                Console.WriteLine("Failed to initialize SuperSocket server! Please check error log for more information!");
                Console.WriteLine("Press any key to close!");
                Console.ReadKey();
                return;
            }

            if (!SocketServerManager.Start())
            {
                Console.WriteLine("Failed to start SuperSocket server! Please check error log for more information!");
                Console.WriteLine("Press any key to close!");
                Console.ReadKey();
                SocketServerManager.Stop();
                return;
            }

            Console.WriteLine("The server has been started! Press key 'q' to stop the server.");

            while (Console.ReadKey().Key != ConsoleKey.Q)
            {
                Console.WriteLine();
                continue;
            }

            SocketServerManager.Stop();

            Console.WriteLine();
            Console.WriteLine("The server has been stopped!");

            Console.WriteLine("Press any key to close!");
            Console.ReadKey();
        }
    }
}
