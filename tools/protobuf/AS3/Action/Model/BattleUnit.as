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
	public dynamic final class BattleUnit extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleUnit.SID", "sID", (1 << 3) | com.netease.protobuf.WireType.VARINT);

		private var SID$field:int;

		private var hasField$0:uint = 0;

		public function clearSID():void {
			hasField$0 &= 0xfffffffe;
			SID$field = new int();
		}

		public function get hasSID():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set sID(value:int):void {
			hasField$0 |= 0x1;
			SID$field = value;
		}

		public function get sID():int {
			return SID$field;
		}

		/**
		 *  @private
		 */
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleUnit.Id", "id", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Id$field:int;

		public function clearId():void {
			hasField$0 &= 0xfffffffd;
			Id$field = new int();
		}

		public function get hasId():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set id(value:int):void {
			hasField$0 |= 0x2;
			Id$field = value;
		}

		public function get id():int {
			return Id$field;
		}

		/**
		 *  @private
		 */
		public static const POS:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleUnit.Pos", "pos", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Pos$field:int;

		public function clearPos():void {
			hasField$0 &= 0xfffffffb;
			Pos$field = new int();
		}

		public function get hasPos():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set pos(value:int):void {
			hasField$0 |= 0x4;
			Pos$field = value;
		}

		public function get pos():int {
			return Pos$field;
		}

		/**
		 *  @private
		 */
		public static const HP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleUnit.HP", "hP", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var HP$field:int;

		public function clearHP():void {
			hasField$0 &= 0xfffffff7;
			HP$field = new int();
		}

		public function get hasHP():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set hP(value:int):void {
			hasField$0 |= 0x8;
			HP$field = value;
		}

		public function get hP():int {
			return HP$field;
		}

		/**
		 *  @private
		 */
		public static const MP:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleUnit.MP", "mP", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var MP$field:int;

		public function clearMP():void {
			hasField$0 &= 0xffffffef;
			MP$field = new int();
		}

		public function get hasMP():Boolean {
			return (hasField$0 & 0x10) != 0;
		}

		public function set mP(value:int):void {
			hasField$0 |= 0x10;
			MP$field = value;
		}

		public function get mP():int {
			return MP$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, SID$field);
			}
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Id$field);
			}
			if (hasPos) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Pos$field);
			}
			if (hasHP) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, HP$field);
			}
			if (hasMP) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, MP$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var SID$count:uint = 0;
			var Id$count:uint = 0;
			var Pos$count:uint = 0;
			var HP$count:uint = 0;
			var MP$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (SID$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleUnit.sID cannot be set twice.');
					}
					++SID$count;
					this.sID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					if (Id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleUnit.id cannot be set twice.');
					}
					++Id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (Pos$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleUnit.pos cannot be set twice.');
					}
					++Pos$count;
					this.pos = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (HP$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleUnit.hP cannot be set twice.');
					}
					++HP$count;
					this.hP = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (MP$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleUnit.mP cannot be set twice.');
					}
					++MP$count;
					this.mP = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
