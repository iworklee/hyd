using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using SuperSocket.SocketBase.Command;
using SuperSocket.Common;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Engine;
using Action.Model;
using Action.DataAccess;
using System.ComponentModel.Composition;

namespace Action.Login.Commands
{
    [GameCommand((int)CommandEnum.Embattle)]
    public class EmbattleCommand : GameCommand<EmbattleArgs>
    {
        [Import]
        private MongoDataAccess mongoDB = null;
        protected override bool Ready(GameSession session, EmbattleArgs args)
        {
            return true;
        }

        protected override void Run(GameSession session, EmbattleArgs args)
        {
            var allPlayers = mongoDB.DefaultDatabase.GetCollection<Player>().AsQueryable();
            var player = allPlayers.Where(p => p.Name == session.Player.Name).FirstOrDefault();
            if (player == null)
                return;
            player.Army.Units.AddRange(args.Units.Select(u => new Unit { ID = u.ID, Positon = u.Position }));
        }
    }
}
