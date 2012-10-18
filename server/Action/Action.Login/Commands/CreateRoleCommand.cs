using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;
using MongoDB.Driver.Linq;
using Action.Engine;
using Action.Model;

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
            var players = session.AppServer.DefaultDatabase
                .GetCollection(DbCollectionDef.Player.Name).AsQueryable<Player>();
            if (players.Where(p => p.Name == args.Name).Count() > 0)
            {
                session.SendResponse(ID, S2C.NameExisted);
                return;
            }

            //创建玩家角色
            var player = new Player();
            player.Account = session.Player.Account;
            player.Name = args.Name;
            player.Role = new Role();
            player.Role.Name = args.Name;
            player.Role.Job = args.Job;
            player.Role.Sex = args.Sex;
            player.Role.Level = player.Role.Skin = 1;
            var tblPlayer = session.AppServer.DefaultDatabase
                .GetCollection(DbCollectionDef.Player.Name);
            tblPlayer.Insert<Player>(player);

            //绑定玩家账户和角色
            var account = new Account();
            account.AccKey = session.Player.Account;
            account.PlayerName = args.Name;
            var tblAccount = session.AppServer.DefaultDatabase
                .GetCollection(DbCollectionDef.Account.Name);
            tblAccount.Insert<Account>(account);

            //玩家进入游戏
            LoginHelper.EnterGame(session, player);
        }
    }
}
