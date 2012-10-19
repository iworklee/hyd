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
	public dynamic final class BackdoorLoginArgs extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const ACCOUNT:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("Action.Model.BackdoorLoginArgs.Account", "account", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var Account$field:String;

		public function clearAccount():void {
			Account$field = null;
		}

		public function get hasAccount():Boolean {
			return Account$field != null;
		}

		public function set account(value:String):void {
			Account$field = value;
		}

		public function get account():String {
			return Account$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasAccount) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Account$field);
			}
			for (var fieldKey:* in this) {
				super.writeUnknown(output, fieldKey);
			}
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function readFromSlice(input:flash.utils.IDataInput, bytesAfterSlice:uint):void {
			var Account$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Account$count != 0) {
						throw new flash.errors.IOError('Bad data format: BackdoorLoginArgs.account cannot be set twice.');
					}
					++Account$count;
					this.account = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
