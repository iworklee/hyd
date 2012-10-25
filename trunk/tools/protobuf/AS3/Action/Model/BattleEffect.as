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
		public static const PLUSHP:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("Action.Model.BattleEffect.PlusHP", "plusHP", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var PlusHP$field:int;

		public function clearPlusHP():void {
			hasField$0 &= 0xfffffffd;
			PlusHP$field = new int();
		}

		public function get hasPlusHP():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set plusHP(value:int):void {
			hasField$0 |= 0x2;
			PlusHP$field = value;
		}

		public function get plusHP():int {
			return PlusHP$field;
		}

		/**
		 *  @private
		 */
		public static const PLUSMP:FieldDescriptor$TYPE_SINT32 = new FieldDescriptor$TYPE_SINT32("Action.Model.BattleEffect.PlusMP", "plusMP", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var PlusMP$field:int;

		public function clearPlusMP():void {
			hasField$0 &= 0xfffffffb;
			PlusMP$field = new int();
		}

		public function get hasPlusMP():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set plusMP(value:int):void {
			hasField$0 |= 0x4;
			PlusMP$field = value;
		}

		public function get plusMP():int {
			return PlusMP$field;
		}

		/**
		 *  @private
		 */
		public static const BUFFID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleEffect.BuffId", "buffId", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var BuffId$field:int;

		public function clearBuffId():void {
			hasField$0 &= 0xfffffff7;
			BuffId$field = new int();
		}

		public function get hasBuffId():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set buffId(value:int):void {
			hasField$0 |= 0x8;
			BuffId$field = value;
		}

		public function get buffId():int {
			return BuffId$field;
		}

		/**
		 *  @private
		 */
		public static const RESULT:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleEffect.Result", "result", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Result$field:int;

		public function clearResult():void {
			hasField$0 &= 0xffffffef;
			Result$field = new int();
		}

		public function get hasResult():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set result(value:int):void {
			hasField$0 |= 0x10;
			Result$field = value;
		}

		public function get result():int {
			return Result$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUnitSID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, UnitSID$field);
			}
			if (hasPlusHP) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, PlusHP$field);
			}
			if (hasPlusMP) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_SINT32(output, PlusMP$field);
			}
			if (hasBuffId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, BuffId$field);
			}
			if (hasResult) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Result$field);
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
			var PlusHP$count:uint = 0;
			var PlusMP$count:uint = 0;
			var BuffId$count:uint = 0;
			var Result$count:uint = 0;
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
					if (PlusHP$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.plusHP cannot be set twice.');
					}
					++PlusHP$count;
					this.plusHP = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 3:
					if (PlusMP$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.plusMP cannot be set twice.');
					}
					++PlusMP$count;
					this.plusMP = com.netease.protobuf.ReadUtils.read$TYPE_SINT32(input);
					break;
				case 4:
					if (BuffId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.buffId cannot be set twice.');
					}
					++BuffId$count;
					this.buffId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (Result$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleEffect.result cannot be set twice.');
					}
					++Result$count;
					this.result = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
