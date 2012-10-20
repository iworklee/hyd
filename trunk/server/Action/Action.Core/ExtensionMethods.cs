using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using MongoDB.Driver;

namespace Action.Core
{
    public static class ExtensionMethods
    {
        public static MongoCollection GetCollection<T>(this MongoDatabase db)
        {
            return db.GetCollection<T>(typeof(T).Name);
        }

    }
}
