using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.ComponentModel.Composition;
using MongoDB.Driver;
using System.Configuration;

namespace Action.DataAccess
{
    [Export]
    public class MongoDataAccess
    {
        public MongoServer MongoServer { get; private set; }
        public MongoDatabase DefaultDatabase { get; private set; }
        private static readonly string ConnectionStringName = "mongodb";

        public MongoDataAccess()
        {
            var connection = ConfigurationManager.ConnectionStrings[ConnectionStringName];
            if (connection == null)
            {
                MongoServer = MongoServer.Create();
                DefaultDatabase = MongoServer.GetDatabase(string.Empty);
            }
            else
            {
                MongoServer = MongoServer.Create(connection.ConnectionString);
                DefaultDatabase = MongoDatabase.Create(connection.ConnectionString);
            }
        }

    }
}
