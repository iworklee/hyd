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
	public dynamic final class PlayerMoveArgs extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("Action.Model.PlayerMoveArgs.Name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var Name$field:String;

		public function clearName():void {
			Name$field = null;
		}

		public function get hasName():Boolean {
			return Name$field != null;
		}

		public function set name(value:String):void {
			Name$field = value;
		}

		public function get name():String {
			return Name$field;
		}

		/**
		 *  @private
		 */
		public static const X:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.PlayerMoveArgs.X", "x", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var X$field:int;

		private var hasField$0:uint = 0;

		public function clearX():void {
			hasField$0 &= 0xfffffffe;
			X$field = new int();
		}

		public function get hasX():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set x(value:int):void {
			hasField$0 |= 0x1;
			X$field = value;
		}

		public function get x():int {
			return X$field;
		}

		/**
		 *  @private
		 */
		public static const Y:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.PlayerMoveArgs.Y", "y", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Y$field:int;

		public function clearY():void {
			hasField$0 &= 0xfffffffd;
			Y$field = new int();
		}

		public function get hasY():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set y(value:int):void {
			hasField$0 |= 0x2;
			Y$field = value;
		}

		public function get y():int {
			return Y$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Name$field);
			}
			if (hasX) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, X$field);
			}
			if (hasY) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Y$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var Name$count:uint = 0;
			var X$count:uint = 0;
			var Y$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Name$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerMoveArgs.name cannot be set twice.');
					}
					++Name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (X$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerMoveArgs.x cannot be set twice.');
					}
					++X$count;
					this.x = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (Y$count != 0) {
						throw new flash.errors.IOError('Bad data format: PlayerMoveArgs.y cannot be set twice.');
					}
					++Y$count;
					this.y = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
