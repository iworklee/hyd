package Action.Model {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class UnitArgs extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.UnitArgs.ID", "iD", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var ID$field:int;

		private var hasField$0:uint = 0;

		public function clearID():void {
			hasField$0 &= 0xfffffffe;
			ID$field = new int();
		}

		public function get hasID():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set iD(value:int):void {
			hasField$0 |= 0x1;
			ID$field = value;
		}

		public function get iD():int {
			return ID$field;
		}

		/**
		 *  @private
		 */
		public static const POSITION:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.UnitArgs.Position", "position", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Position$field:int;

		public function clearPosition():void {
			hasField$0 &= 0xfffffffd;
			Position$field = new int();
		}

		public function get hasPosition():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set position(value:int):void {
			hasField$0 |= 0x2;
			Position$field = value;
		}

		public function get position():int {
			return Position$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, ID$field);
			}
			if (hasPosition) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Position$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var ID$count:uint = 0;
			var Position$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (ID$count != 0) {
						throw new flash.errors.IOError('Bad data format: UnitArgs.iD cannot be set twice.');
					}
					++ID$count;
					this.iD = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (Position$count != 0) {
						throw new flash.errors.IOError('Bad data format: UnitArgs.position cannot be set twice.');
					}
					++Position$count;
					this.position = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
