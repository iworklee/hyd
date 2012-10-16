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
            _hash.Add(typeof(bool), new BooleanDeserializer());
            _hash.Add(typeof(short), new Int16Deserializer());
            _hash.Add(typeof(int), new Int32Deserializer());
            _hash.Add(typeof(long), new Int64Deserializer());
            _hash.Add(typeof(float), new SingleDeserializer());
            _hash.Add(typeof(double), new DoubleDeserializer());
            _hash.Add(typeof(string), new StringDeserializer());
        }

        //public static object Deserialize(Type type, byte[] data)
        //{
        //    IGameCommandDataDeserializer des = null;
        //    if (_hash.TryGetValue(type, out des))
        //        return des.Deserialize(data);
        //    else
        //        return _default.Deserialize(data);
        //}

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
    
    class BooleanDeserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToBoolean(data, 0);
        }
    }

    class Int16Deserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToInt16(data, 0);
        }
    }

    class Int32Deserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToInt32(data, 0);
        }
    }

    class Int64Deserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToInt64(data, 0);
        }
    }

    class SingleDeserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToSingle(data, 0);
        }
    }

    class DoubleDeserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return BitConverter.ToDouble(data, 0);
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
