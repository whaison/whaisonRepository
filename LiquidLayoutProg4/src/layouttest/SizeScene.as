/**
 * 
 */
package layouttest
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import jp.progression.casts.CastDocument;
	import jp.progression.casts.CastSprite;
	//import jp.progression.commands.DoTweener;は以下に移動されました。
	import jp.progression.commands.tweens.DoTweener;
	//import jp.progression.commands.SerialList;は以下に移動されました。
	import jp.progression.commands.lists.SerialList
	import jp.progression.scenes.SceneObject;
	
	/*prog4Scene*/
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
	
	import layouttest.*;
	/**
	 * IndexScene クラス
	 */
	public class SizeScene extends SceneObject
	{
		public var wh100:CastSprite;
		public var w100:CastSprite;
		public var h100:CastSprite;
		
		
		/**
		 * コンストラクタ
		 */
		public function SizeScene( name:String = null, initObject:Object = null )
		{
			super( name,initObject );
			// ブラウザ同期時に出力したいタイトルを設定します。
			title = "サイズ | DocuemntLayout";
		}
		
		/**
		 * シーンオブジェクトが目的地だった場合に、到達した瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneInit():void
		{
			
			Index.stageContoller.message = "画面サイズに合わせてサイズを変更しています。\nパラメータを数値で渡せばその数値が加算され、ダブルクオーテーションで囲み文字列として渡せばパーセント倍率数として扱います。";
			
			wh100 = Index.createRect( "width: 0, height: 0", 0x3399FF );
			w100 = Index.createRect( "width: 100%, left: 0, bottom: -100", 0x333333 );
			h100 = Index.createRect( "top: 25%, left: 25%, width: 50%, height: 50%", 0xFFFFFF );
			
			Index.layout.addLayout( wh100, { left: 0, top: 0, width: 0, height: 0 } );
			Index.layout.addLayout( w100, { left: 0, bottom: -100, stageWidth: 0 } );
			Index.layout.addLayout( h100, { top: "25", left: "25", width: "50", height: "50" } );
			
			Index.container.addChild( wh100 );
			Index.container.addChild( w100 );
			Index.container.addChild( h100 );
		}
		
		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは親階層だった場合に、階層が変更された瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneUnload():void
		{
			Index.layout.removeLayout( wh100, w100, h100 );
			
			Index.container.removeChild( wh100 );
			Index.container.removeChild( w100 );
			Index.container.removeChild( h100 );
			
			wh100 = null;
			w100  = null;
			h100  = null;
		}
	}
}









