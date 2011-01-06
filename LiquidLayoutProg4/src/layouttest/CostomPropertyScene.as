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
	import layouttest.*;
	
	/*prog4*/
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
	
	
	/**
	 * IndexScene クラス
	 */
	public class CostomPropertyScene extends SceneObject
	{
		public var rightRotation:CastSprite;
		public var bottomScale:CastSprite;
		
		
		/**
		 * コンストラクタ
		 */
		public function CostomPropertyScene( name:String = null, initObject:Object = null)
		{
			super( name ,initObject);
			// ブラウザ同期時に出力したいタイトルを設定します。
			title = "カスタムプロパティ | DocuemntLayout";
		}
		
		/**
		 * シーンオブジェクトが目的地だった場合に、到達した瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneInit():void
		{
			Index.stageContoller.message = "DocumentLayout オブジェクトにて対応するプロパティ以外のプロパティ名に変更して代入することが出来ます。\nこの例では上のオブジェクトは bottom の値を rotation プロパティに、下のオブジェクトは stageWidth の値を 0.1% に再計算して alpha プロパティに代入しています。";
			
			rightRotation = Index.createRect( "画面幅(right)の値を rotation 値に代入", 0xFF0000, 100, 100, -50, -50 );
			bottomScale = Index.createRect( "画面幅の値を 0.1% を alpha 値に代入", 0xFF0000, 100, 100, -50, -50 );
			
			Index.layout.addLayout( rightRotation, { center: 0, middle: -100, right: 0, rightPropName: "rotation" } );
			Index.layout.addLayout( bottomScale, { center: 0, middle: 100, right: function(value):Number { return value * 0.001; } , rightPropName: "alpha" } );
			
			Index.container.addChild( rightRotation );
			Index.container.addChild( bottomScale );
		}
		
		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは親階層だった場合に、階層が変更された瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneUnload():void
		{
			Index.layout.removeLayout( rightRotation, bottomScale );
			
			Index.container.removeChild( rightRotation );
			Index.container.removeChild( bottomScale );
			
			rightRotation = null;
			bottomScale  = null;
		}
	}
}









