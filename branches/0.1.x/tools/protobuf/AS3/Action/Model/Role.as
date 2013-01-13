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
	public dynamic final class Role extends com.netease.protobuf.Message {
		/**
		 *  @private
		 */
		public static const NAME:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("Action.Model.Role.Name", "name", (1 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

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
		public static const JOB:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.Role.Job", "job", (2 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Job$field:int;

		private var hasField$0:uint = 0;

		public function clearJob():void {
			hasField$0 &= 0xfffffffe;
			Job$field = new int();
		}

		public function get hasJob():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set job(value:int):void {
			hasField$0 |= 0x1;
			Job$field = value;
		}

		public function get job():int {
			return Job$field;
		}

		/**
		 *  @private
		 */
		public static const SEX:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.Role.Sex", "sex", (3 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Sex$field:int;

		public function clearSex():void {
			hasField$0 &= 0xfffffffd;
			Sex$field = new int();
		}

		public function get hasSex():Boolean {
			return (hasField$0 & 0x2) != 0;
		}

		public function set sex(value:int):void {
			hasField$0 |= 0x2;
			Sex$field = value;
		}

		public function get sex():int {
			return Sex$field;
		}

		/**
		 *  @private
		 */
		public static const LEVEL:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.Role.Level", "level", (4 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Level$field:int;

		public function clearLevel():void {
			hasField$0 &= 0xfffffffb;
			Level$field = new int();
		}

		public function get hasLevel():Boolean {
			return (hasField$0 & 0x4) != 0;
		}

		public function set level(value:int):void {
			hasField$0 |= 0x4;
			Level$field = value;
		}

		public function get level():int {
			return Level$field;
		}

		/**
		 *  @private
		 */
		public static const SKIN:FieldDescriptor$TYPE_INT32 = new FieldDescriptor$TYPE_INT32("Action.Model.Role.Skin", "skin", (5 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Skin$field:int;

		public function clearSkin():void {
			hasField$0 &= 0xfffffff7;
			Skin$field = new int();
		}

		public function get hasSkin():Boolean {
			return (hasField$0 & 0x8) != 0;
		}

		public function set skin(value:int):void {
			hasField$0 |= 0x8;
			Skin$field = value;
		}

		public function get skin():int {
			return Skin$field;
		}

		/**
		 *  @private
		 */
		override com.netease.protobuf.used_by_generated_code final function writeToBuffer(output:com.netease.protobuf.WritingBuffer):void {
			if (hasName) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 1);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Name$field);
			}
			if (hasJob) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 2);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Job$field);
			}
			if (hasSex) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 3);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Sex$field);
			}
			if (hasLevel) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Level$field);
			}
			if (hasSkin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_INT32(output, Skin$field);
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
			var Job$count:uint = 0;
			var Sex$count:uint = 0;
			var Level$count:uint = 0;
			var Skin$count:uint = 0;
			while (input.bytesAvailable > bytesAfterSlice) {
				var tag:uint = com.netease.protobuf.ReadUtils.read$TYPE_UINT32(input);
				switch (tag >> 3) {
				case 1:
					if (Name$count != 0) {
						throw new flash.errors.IOError('Bad data format: Role.name cannot be set twice.');
					}
					++Name$count;
					this.name = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 2:
					if (Job$count != 0) {
						throw new flash.errors.IOError('Bad data format: Role.job cannot be set twice.');
					}
					++Job$count;
					this.job = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 3:
					if (Sex$count != 0) {
						throw new flash.errors.IOError('Bad data format: Role.sex cannot be set twice.');
					}
					++Sex$count;
					this.sex = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 4:
					if (Level$count != 0) {
						throw new flash.errors.IOError('Bad data format: Role.level cannot be set twice.');
					}
					++Level$count;
					this.level = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				case 5:
					if (Skin$count != 0) {
						throw new flash.errors.IOError('Bad data format: Role.skin cannot be set twice.');
					}
					++Skin$count;
					this.skin = com.netease.protobuf.ReadUtils.read$TYPE_INT32(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
