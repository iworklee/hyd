package Action.Core.Serial
{
	import flash.utils.ByteArray;

	public interface IGameDataSerializer
	{
		function deserialize(buffer:ByteArray):Object;
	}
}