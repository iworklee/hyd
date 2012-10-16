using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using ProtoBuf;
using System.IO;

namespace Action.Engine
{
    static class GameCommandDataDeserializer
    {
        private static Dictionary<Type, IGameCommandDataDeserializer> _hash;

        static GameCommandDataDeserializer()
        {
            _hash = new Dictionary<Type, IGameCommandDataDeserializer>();
            _hash.Add(typeof(bool), new BoolDeserializer());
            _hash.Add(typeof(int), new IntDeserializer());
            _hash.Add(typeof(float), new FloatDeserializer());
            _hash.Add(typeof(string), new StringDeserializer());
        }

        public static T Deserialize<T>(byte[] data)
        {
            Type type = typeof(T);
            IGameCommandDataDeserializer des = null;
            if (_hash.TryGetValue(type, out des))
                return (T)des.Deserialize(data);
            else
            {
                using (var ms = new MemoryStream(data))
                {
                    var o =  (T)Serializer.Deserialize<T>(ms);
                }
                return default(T);
            }
        }
    }

    public interface IGameCommandDataDeserializer
    {
        object Deserialize(byte[] data);
    }
    
    class BoolDeserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToBoolean(data, 0);
        }
    }

    class IntDeserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToInt32(data, 0);
        }
    }

    class FloatDeserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToSingle(data, 0);
        }
    }
    
    class StringDeserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return Encoding.UTF8.GetString(data);
        }
    }

}
