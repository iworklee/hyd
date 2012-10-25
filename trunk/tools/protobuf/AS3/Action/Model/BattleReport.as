package Action.Model {
	import com.netease.protobuf.*;
	use namespace com.netease.protobuf.used_by_generated_code;
	import com.netease.protobuf.fieldDescriptors.*;
	import flash.utils.Endian;
	import flash.utils.IDataInput;
	import flash.utils.IDataOutput;
	import flash.utils.IExternalizable;
	import flash.errors.IOError;
	import Action.Model.BattleUnit;
	import Action.Model.BattleBout;
	// @@protoc_insertion_point(imports)

	// @@protoc_insertion_point(class_metadata)
	public dynamic final class BattleReport extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const UID:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("Action.Model.BattleReport.UID", "uID", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var UID$field:String;

		public function clearUID():void {
			UID$field = null;
		}

		public function get hasUID():Boolean {
			return UID$field != null;
		}

		public function set uID(value:String):void {
			UID$field = value;
		}

		public function get uID():String {
			return UID$field;
		}

		/**
		 *  @private
		 */
		public static const UNITS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("Action.Model.BattleReport.Units", "units", (2 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return Action.Model.BattleUnit; });

		[ArrayElementType("Action.Model.BattleUnit")]
		public var units:Array = [];

		/**
		 *  @private
		 */
		public static const BOUTS:RepeatedFieldDescriptor$TYPE_MESSAGE = new RepeatedFieldDescriptor$TYPE_MESSAGE("Action.Model.BattleReport.Bouts", "bouts", (3 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED, function():Class { return Action.Model.BattleBout; });

		[ArrayElementType("Action.Model.BattleBout")]
		public var bouts:Array = [];

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasUID) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, UID$field);
			}
			for (var units$index:uint = 0; units$index < this.units.length; ++units$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.units[units$index]);
			}
			for (var bouts$index:uint = 0; bouts$index < this.bouts.length; ++bouts$index) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_MESSAGE(output, this.bouts[bouts$index]);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var UID$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (UID$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleReport.uID cannot be set twice.');
					}
					++UID$count;
					this.uID = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					this.units.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new Action.Model.BattleUnit()));
					break;
				case 3:
					this.bouts.push(com.netease.protobuf.ReadUtils.read$TYPE_MESSAGE(input, new Action.Model.BattleBout()));
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
