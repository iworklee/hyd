package Action.Model {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
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
		public static const ID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleAction.Id", "id", (2 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const SKILLID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleAction.SkillId", "skillId", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var SkillId$field:int;

		public function clearSkillId():void {
			hasField$0 &= 0xfffffffb;
			SkillId$field = new int();
		}

		public function get hasSkillId():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set skillId(value:int):void {
			hasField$0 |= 0x4;
			SkillId$field = value;
		}

		public function get skillId():int {
			return SkillId$field;
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
			if (hasId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Id$field);
			}
			if (hasSkillId) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, SkillId$field);
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
			var Id$count:uint = 0;
			var SkillId$count:uint = 0;
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
					if (Id$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleAction.id cannot be set twice.');
					}
					++Id$count;
					this.id = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (SkillId$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleAction.skillId cannot be set twice.');
					}
					++SkillId$count;
					this.skillId = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
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
