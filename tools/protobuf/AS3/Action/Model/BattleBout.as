package Action.Model {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import Action.Model.BattleAction;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BattleBout extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const SID:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.BattleBout.SID", "sID", (1 << 3) | com.netease.protobuf.WireType.VARINT);

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
		public static const ACTIONS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("Action.Model.BattleBout.Actions", "actions", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return Action.Model.BattleAction; });

		[ArrayElementType("Action.Model.BattleAction")]
		public var actions:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasSID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, SID$field);
			}
			for (var actions$index:uint = 0; actions$index < this.actions.length; ++actions$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.actions[actions$index]);
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
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (SID$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleBout.sID cannot be set twice.');
					}
					++SID$count;
					this.sID = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 2:
					this.actions.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new Action.Model.BattleAction()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
