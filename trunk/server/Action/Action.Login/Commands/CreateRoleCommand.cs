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

namespace Action.Login.Commands
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
                session.SendResponse(ID, S2C.NameExisted);
                return;
            }

            //创建玩家角色
            var player = new Player();
            player.Account = session.Player.Account;
            player.Name = args.Name;
            player.Job = args.Job;
            player.Sex = (SexEnum)args.Sex;
            var tblPlayer = session.AppServer.DefaultDatabase
                .GetCollection(DbCollectionDef.Player.Name);
            tblPlayer.Insert<Player>(player);

            //创建玩家索引
            var playerIndex = new PlayerIndex();
            playerIndex.Name = args.Name;
            playerIndex.Account = session.Player.Account;
            var tblPlayerIndex = session.AppServer.DefaultDatabase
                .GetCollection(DbCollectionDef.PlayerIndex.Name);
            tblPlayerIndex.Insert<PlayerIndex>(playerIndex);
        }
    }
}
