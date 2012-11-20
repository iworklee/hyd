package Action.Model {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import Action.Model.BattleEffectType;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BattleEffect extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UNITSID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleEffect.UnitSID", "unitSID", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const TYPE:FieldDescriptor$TYPE_ENUM = new FieldDescriptor$TYPE_ENUM("Action.Model.BattleEffect.Type", "type", (2 << 3) | com.netease.protobuf.WireType.VARINT, Action.Model.BattleEffectType);

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
				return Action.Model.BattleEffectType.None;
			}
			return Type$field;
		}

		/**
		 *  @private
		 */
		public static const PLUSHP:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("Action.Model.BattleEffect.PlusHP", "plusHP", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var PlusHP$field:int;

		public function clearPlusHP():void {
			hasField$0 &= 0xfffffffb;
			PlusHP$field = new int();
		}

		public function get hasPlusHP():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set plusHP(value:int):void {
			hasField$0 |= 0x4;
			PlusHP$field = value;
		}

		public function get plusHP():int {
			return PlusHP$field;
		}

		/**
		 *  @private
		 */
		public static const PLUSMP:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("Action.Model.BattleEffect.PlusMP", "plusMP", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var PlusMP$field:int;

		public function clearPlusMP():void {
			hasField$0 &= 0xfffffff7;
			PlusMP$field = new int();
		}

		public function get hasPlusMP():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set plusMP(value:int):void {
			hasField$0 |= 0x8;
			PlusMP$field = value;
		}

		public function get plusMP():int {
			return PlusMP$field;
		}

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
			if (hasPlusHP) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, PlusHP$field);
			}
			if (hasPlusMP) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, PlusMP$field);
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
			var PlusHP$count:uint = 0;
			var PlusMP$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (UnitSID$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.unitSID cannot be set twice.');
					}
					++UnitSID$count;
					this.unitSID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (Type$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.type cannot be set twice.');
					}
					++Type$count;
					this.type = com.netease.protobuf.ReadUtils.read$TYPE_ENUM(input);
					break;
				case 3:
					if (PlusHP$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.plusHP cannot be set twice.');
					}
					++PlusHP$count;
					this.plusHP = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 4:
					if (PlusMP$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.plusMP cannot be set twice.');
					}
					++PlusMP$count;
					this.plusMP = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
