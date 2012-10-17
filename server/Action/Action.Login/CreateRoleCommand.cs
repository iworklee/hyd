using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Engine;
using Action.Model.Protobuf;
using Action.Model;
using Action.Model.Mongodb;

namespace Action.Login
{
    [GameCommand((int)CommandEnum.CreateRole)]
    public class CreateRoleCommand : GameCommand<CreateRoleArgs>
    {
        public enum S2C
        {
            OK,
            ValidateError,
            NameExisted
        }

        protected override bool Ready(GameSession session, CreateRoleArgs args)
        {
            return session.Opened;
        }

        protected override void Run(GameSession session, CreateRoleArgs args)
        {
            //输入合法性验证

            //重名验证
            var playerIndexes = session.AppServer.DefaultDatabase
                .GetCollection(DbCollectionDef.PlayerIndex.Name).AsQueryable<PlayerIndex>();
            if (playerIndexes.Where(p => p.Name == args.Name).Count() > 0)
            {
                session.SendResponse(CommandId, S2C.NameExisted);
                return;
            }
        }
    }
}
