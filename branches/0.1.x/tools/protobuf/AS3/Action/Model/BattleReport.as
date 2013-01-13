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
		public static const PLAYER1:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("Action.Model.BattleReport.Player1", "player1", (4 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var Player1$field:String;

		public function clearPlayer1():void {
			Player1$field = null;
		}

		public function get hasPlayer1():Boolean {
			return Player1$field != null;
		}

		public function set player1(value:String):void {
			Player1$field = value;
		}

		public function get player1():String {
			return Player1$field;
		}

		/**
		 *  @private
		 */
		public static const PLAYER2:FieldDescriptor$TYPE_STRING = new FieldDescriptor$TYPE_STRING("Action.Model.BattleReport.Player2", "player2", (5 << 3) | com.netease.protobuf.WireType.LENGTH_DELIMITED);

		private var Player2$field:String;

		public function clearPlayer2():void {
			Player2$field = null;
		}

		public function get hasPlayer2():Boolean {
			return Player2$field != null;
		}

		public function set player2(value:String):void {
			Player2$field = value;
		}

		public function get player2():String {
			return Player2$field;
		}

		/**
		 *  @private
		 */
		public static const WIN:FieldDescriptor$TYPE_BOOL = new FieldDescriptor$TYPE_BOOL("Action.Model.BattleReport.Win", "win", (6 << 3) | com.netease.protobuf.WireType.VARINT);

		private var Win$field:Boolean;

		private var hasField$0:uint = 0;

		public function clearWin():void {
			hasField$0 &= 0xfffffffe;
			Win$field = new Boolean();
		}

		public function get hasWin():Boolean {
			return (hasField$0 & 0x1) != 0;
		}

		public function set win(value:Boolean):void {
			hasField$0 |= 0x1;
			Win$field = value;
		}

		public function get win():Boolean {
			return Win$field;
		}

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
			if (hasPlayer1) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 4);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Player1$field);
			}
			if (hasPlayer2) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.LENGTH_DELIMITED, 5);
				com.netease.protobuf.WriteUtils.write$TYPE_STRING(output, Player2$field);
			}
			if (hasWin) {
				com.netease.protobuf.WriteUtils.writeTag(output, com.netease.protobuf.WireType.VARINT, 6);
				com.netease.protobuf.WriteUtils.write$TYPE_BOOL(output, Win$field);
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
			var Player1$count:uint = 0;
			var Player2$count:uint = 0;
			var Win$count:uint = 0;
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
				case 4:
					if (Player1$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleReport.player1 cannot be set twice.');
					}
					++Player1$count;
					this.player1 = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 5:
					if (Player2$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleReport.player2 cannot be set twice.');
					}
					++Player2$count;
					this.player2 = com.netease.protobuf.ReadUtils.read$TYPE_STRING(input);
					break;
				case 6:
					if (Win$count != 0) {
						throw new flash.errors.IOError('Bad data format: BattleReport.win cannot be set twice.');
					}
					++Win$count;
					this.win = com.netease.protobuf.ReadUtils.read$TYPE_BOOL(input);
					break;
				default:
					super.readUnknown(input, tag);
					break;
				}
			}
		}

	}
}
