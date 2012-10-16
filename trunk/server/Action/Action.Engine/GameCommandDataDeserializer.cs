using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace Action.Engine
{
    static class GameCommandDataDeserializer
    {
        private static Dictionary<Type, IGameCommandDataDeserializer> _hash;
        private static IGameCommandDataDeserializer _default;

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
            _default = new ProtobufDeserializer();
        }

        public static object Deserialize(Type type, byte[] data)
        {
            IGameCommandDataDeserializer des = null;
            if (_hash.TryGetValue(type, out des))
                return des.Deserialize(data);
            else
                return _default;
        }

        public static T Deserialize<T>(byte[] data)
        {
            return (T)Deserialize(typeof(T), data);
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

    class ProtobufDeserializer : IGameCommandDataDeserializer
    {
        public object Deserialize(byte[] data)
        {
            return null;
        }
    }
}
