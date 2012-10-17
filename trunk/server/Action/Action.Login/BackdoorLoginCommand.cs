using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using SuperSocket.Common;
using Action.Engine;
using Action.Model.Protobuf;
using MongoDB.Driver;
using Action.Model;

namespace Action.Login
{
    [GameCommand((int)CommandEnum.BackdoorLogin)]
    public class BackdoorLoginCommand : GameCommand<BackdoorLoginArgs>
    {
        protected override bool Ready(GameSession session, BackdoorLoginArgs args)
        {
            return true;
        }

        protected override void Run(GameSession session, BackdoorLoginArgs args)
        {
            var db = session.DefaultDatabase;            

            if (args.Account != null && args.Account.Trim().ToLower().StartsWith("test"))
            {
                session.Bind(args.Account);
            }
            else
                session.Close();
        }
    }
}
