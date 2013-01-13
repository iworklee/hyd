using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Model;
using Action.Engine;
using Action.DataAccess;
using System.ComponentModel.Composition;

namespace Action.Role.Commands
{
    [GameCommand((int)CommandEnum.ViewRoleInfo)]
    public class ViewRoleInfoCommand : GameCommand<string>
    {
        [Import]
        private MongoDataAccess mongoDB = null;

        protected override void Run(GameSession session, string args)
        {
            var name = string.IsNullOrEmpty(args) ? session.Player.Name : args;
            var players = mongoDB.DefaultDatabase
                .GetCollection<Player>().AsQueryable();
            var role = players.Where(p => p.Name == name).Select(p => p.Role).FirstOrDefault();
            if (role != null)
                session.SendResponse<Model.Role>(ID, role);
        }
    }
}
