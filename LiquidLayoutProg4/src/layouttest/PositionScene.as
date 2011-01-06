/*
prog4 
*/
package layouttest
{
	import flash.display.Bitmap;
	import flash.display.BitmapData;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import jp.progression.casts.CastDocument;
	import jp.progression.casts.CastSprite;
	//import jp.progression.commands.DoTweener;は以下に移動されました。
	import jp.progression.commands.tweens.DoTweener;
	//import jp.progression.commands.SerialList;は以下に移動されました。
	import jp.progression.commands.lists.SerialList
	import jp.progression.scenes.SceneObject;
	import layouttest.*;
	//prog4
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
	import jp.progression.loader.*;
	import jp.progression.*;
	import jp.progression.scenes.*;
	/**
	 * IndexScene クラス
	 */
	public class PositionScene extends SceneObject
	{
		
		public var lt:CastSprite;
		public var ct:CastSprite;
		public var rt:CastSprite;
		public var lm:CastSprite;
		public var cm:CastSprite;
		public var rm:CastSprite;
		public var lb:CastSprite;
		public var cb:CastSprite;
		public var rb:CastSprite;
		
		/**
		 * コンストラクタ
		 */
		public function PositionScene( name:String = null, initObject:Object = null)
		{
			// 親クラスを初期化する
			super( name, initObject );
			// ブラウザ同期時に出力したいタイトルを設定します。
			title = "位置 | DocuemntLayout";
		}
		
		/**
		 * シーンオブジェクトが目的地だった場合に、到達した瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneInit():void
		{
			
			//Index.stageContoller.message = "画面の上下左右それぞれの位置に常時固定します。\n各オブジェクトは100pxの正方形で基準点は左上ですので、たとえば横中央のオブジェクトは center: -50 というパラメータを渡すことになります。";
			
			lt = Index.createRect("left:10, top:10");
			ct = Index.createRect("center: -50, top: 10");
			rt = Index.createRect("right: -110, top: 10");
			lm = Index.createRect("left: 10, middle: -50");
			cm = Index.createRect("center: -50, middle: -50");
			rm = Index.createRect("right: -110, middle: -50");
			lb = Index.createRect("left: 10, bottom: -110");
			cb = Index.createRect("center: -50, bottom: -110");
			rb = Index.createRect("right: -110, bottom: -110");
			
			
			Index.layout.addLayout( lt, { left: 10, top: 10 } );
			Index.layout.addLayout( ct, { center: -50, top: 10 } );
			Index.layout.addLayout( rt, { right: -110, top: 10 } );
			Index.layout.addLayout( lm, { left: 10, middle: -50 } );
			Index.layout.addLayout( cm, { center: -50, middle: -50 } );
			Index.layout.addLayout( rm, { right: -110, middle: -50 } );
			Index.layout.addLayout( lb, { left: 10, bottom: -110 } );
			Index.layout.addLayout( cb, { center: -50, bottom: -110 } );
			Index.layout.addLayout( rb, { right: -110, bottom: -110 } );
			
			Index.container.addChild( lt );
			Index.container.addChild( ct );
			Index.container.addChild( rt );
			Index.container.addChild( lm );
			Index.container.addChild( cm );
			Index.container.addChild( rm );
			Index.container.addChild( lb );
			Index.container.addChild( cb );
			Index.container.addChild( rb );
		
		}
		
		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは親階層だった場合に、階層が変更された瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneUnload():void
		{
			Index.layout.removeLayout( lt, ct, rt, lm, cm, rm, lb, cb, rb );
			
			Index.container.removeChild( lt );
			Index.container.removeChild( ct );
			Index.container.removeChild( rt );
			Index.container.removeChild( lm );
			Index.container.removeChild( cm );
			Index.container.removeChild( rm );
			Index.container.removeChild( lb );
			Index.container.removeChild( cb );
			Index.container.removeChild( rb );
			
			lt = null;
			ct = null;
			rt = null;
			lm = null;
			cm = null;
			rm = null;
			lb = null;
			cb = null;
			rb = null;
		}
	}
}









