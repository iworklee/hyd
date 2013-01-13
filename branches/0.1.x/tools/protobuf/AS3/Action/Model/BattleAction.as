package Action.Model {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import Action.Model.BattleActionType;
	import Action.Model.BattleEffect;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BattleAction extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UNITSID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleAction.UnitSID", "unitSID", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var UnitSID$field:int;

		private var hasField$0:uint = 0;

		public function clearUnitSID():void {
			hasField$0 &= 0xfffffffe;
			UnitSID$field = new int();
		}

		public function get hasUnitSID():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set unitSID(value:int):void {
			hasField$0 |= 0x1;
			UnitSID$field = value;
		}

		public function get unitSID():int {
			return UnitSID$field;
		}

		/**
		 *  @private
		 */
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("Action.Model.BattleAction.Type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT, Action.Model.BattleActionType);

		private var Type$field:int;

		public function clearType():void {
			hasField$0 &= 0xfffffffd;
			Type$field = new int();
		}

		public function get hasType():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set type(value:int):void {
			hasField$0 |= 0x2;
			Type$field = value;
		}

		public function get type():int {
			if(!hasType) {
				return Action.Model.BattleActionType.Cast;
			}
			return Type$field;
		}

		/**
		 *  @private
		 */
		public static const PARAM:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleAction.Param", "param", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Param$field:int;

		public function clearParam():void {
			hasField$0 &= 0xfffffffb;
			Param$field = new int();
		}

		public function get hasParam():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set param(value:int):void {
			hasField$0 |= 0x4;
			Param$field = value;
		}

		public function get param():int {
			return Param$field;
		}

		/**
		 *  @private
		 */
		public static const EFFECTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("Action.Model.BattleAction.Effects", "effects", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return Action.Model.BattleEffect; });

		[ArrayElementType("Action.Model.BattleEffect")]
		public var effects:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUnitSID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, UnitSID$field);
			}
			if (hasType) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_ENUM(output, Type$field);
			}
			if (hasParam) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Param$field);
			}
			for (var effects$index:uint = 0; effects$index < this.effects.length; ++effects$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.effects[effects$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var UnitSID$count:uint = 0;
			var Type$count:uint = 0;
			var Param$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (UnitSID$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleAction.unitSID cannot be set twice.');
					}
					++UnitSID$count;
					this.unitSID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (Type$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleAction.type cannot be set twice.');
					}
					++Type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (Param$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleAction.param cannot be set twice.');
					}
					++Param$count;
					this.param = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					this.effects.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new Action.Model.BattleEffect()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
