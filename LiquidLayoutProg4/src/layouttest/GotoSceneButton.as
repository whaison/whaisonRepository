/*
prog4 
*/
package layouttest 
{
	import flash.text.TextField;
	import flash.text.TextFormat;
	import flash.text.TextFormatAlign;
	import jp.progression.casts.*;
	import jp.progression.commands.*;
	import jp.progression.events.*;
	import jp.progression.loader.*;
	import jp.progression.*;
	import jp.progression.casts.*;
	import jp.progression.commands.display.*;
	import jp.progression.commands.lists.*;
	import jp.progression.commands.managers.*;
	import jp.progression.commands.media.*;
	import jp.progression.commands.net.*;
	import jp.progression.commands.tweens.*;
	import jp.progression.commands.*;
	import jp.progression.data.*;
	import jp.progression.events.*;
	import jp.progression.scenes.*;
	import layouttest.*;
	/**
	 * ...
	 * @author cue
	 */
	public class GotoSceneButton extends CastButton 
	{
		public static const WIDTH:Number = 78;
		public static const HEIGHT:Number = 24;
		
		public function get text():String { return _textField.text; }
		public function set text( value:String ):void
		{
			_textField.text = "::"+value;
		}
		private var _textField:TextField;
		
		/**
		 * コンストラクタ
		 */
		public function GotoSceneButton( initObject:Object = null ) 
		{
			super( initObject );
			
			drawRect( 0x202020 );
			
			_textField = new TextField();
			_textField.width = WIDTH;
			_textField.height = 20;
			_textField.y = HEIGHT / 2 - _textField.height / 2;
			
			var tf:TextFormat = new TextFormat();
			tf.align = TextFormatAlign.CENTER;
			
			_textField.defaultTextFormat = tf;
			_textField.textColor = 0xFFFFFF;
			_textField.mouseEnabled = false;
			
			addChild( _textField );
			
			/*
			addExclusivelyEventListener( CastEvent.UPDATE, _updateAndStatusChange, false, int.MAX_VALUE, true );
			addExclusivelyEventListener( CastEvent.STATUS_CHANGE, _updateAndStatusChange, false, int.MAX_VALUE, true );
			*/
			/*
			addEventListener( CastEvent.UPDATE, _updateAndStatusChange);
			addEventListener( CastEvent.STATUS_CHANGE, _updateAndStatusChange);
			*/
		}
		
		private function _updateAndStatusChange( e:CastEvent ):void
		{
			/*
			if ( isCurrent )
			{
				graphics.clear();
				graphics.lineStyle( 0, 0x0 );
				graphics.beginFill( 0xFFFFFF );
				graphics.drawRect( 0, 0, WIDTH, HEIGHT + 10 );
				_textField.textColor = 0x202020;
				buttonEnabled = false;
			}
			else
			{
				atCastRollOut();
				buttonEnabled = true;
			}
			*/
		}
		
		private function drawRect( color:uint ):void
		{
			graphics.clear();
			graphics.lineStyle( 0, 0x0 );
			graphics.beginFill( color );
			graphics.drawRect( 0, 0, WIDTH, HEIGHT );
		}
		
		/**
		 * RollOver
		 */
		protected override function atCastRollOver():void 
		{
			drawRect( 0xF0F0F0 );
			_textField.textColor = 0x202020;
		}
		
		/**
		 * RollOut
		 */
		protected override function atCastRollOut():void 
		{
			drawRect( 0x202020 );
			_textField.textColor = 0xFFFFFF;
		}
	}
}
