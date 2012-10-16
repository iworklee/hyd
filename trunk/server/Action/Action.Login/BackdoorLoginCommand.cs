using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using SuperSocket.Common;
using Action.Engine;
using Action.Model.Protobuf;
using MongoDB.Driver;

namespace Action.Login
{
    [GameCommand(1000)]
    public class BackdoorLoginCommand : GameCommand<BackdoorLoginArgs>
    {
        protected override bool Ready(GameSession session, BackdoorLoginArgs args)
        {
            return true;
        }

        protected override void Run(GameSession session, BackdoorLoginArgs args)
        {
            var db = session.DefaultDatabase;
            var otherDB = session.MongoDBServer.GetDatabase("Ranking");
            

            if (args.Account != null && args.Account.Trim().ToLower().StartsWith("test"))
            {
                session.Bind(args.Account);
            }
            else
                session.Close();
        }
    }
}
