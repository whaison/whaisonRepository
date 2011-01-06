/**
 * 
 */
package layouttest
{
	import com.cuegraphix.layouts.properties.ConstrainProportions;
	import flash.display.Bitmap;
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import flash.net.URLRequest;
	import flash.system.LoaderContext;
	import jp.progression.casts.CastDocument;
	import jp.progression.casts.CastImageLoader;
	import jp.progression.casts.CastSprite;
//import jp.progression.commands.AddChild;//は以下に移動されました。
import jp.progression.commands.display.AddChild
	
//jp.progression.commands.LoadChild  	-  	削除されました。
//代替機能として jp.progression.commands.net パッケージのコマンドを使用するようにしてください。
//ということなので、
//http://sygnas.jp/2010/02/21/progressionloaderlist/

	//import jp.progression.commands.DoTweener;は以下に移動されました。
	import jp.progression.commands.tweens.DoTweener;
	//import jp.progression.commands.SerialList;は以下に移動されました。
	import jp.progression.commands.lists.SerialList;
	import jp.progression.scenes.SceneObject;
	
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
	
	
	import layouttest.*;
	/**
	 * IndexScene クラス
	 */
	public class ProportionScene extends SceneObject
	{
		public var photo:CastSprite;
		
		
		/**
		 * コンストラクタ
		 */
		public function ProportionScene( name:String = null, initObject:Object = null)
		{
			super( name ,initObject);
			// ブラウザ同期時に出力したいタイトルを設定します。
			title = "比率を固定 | DocuemntLayout";
			
			ConstrainProportions.init();
		}
		
		/**
		 * シーンオブジェクトが目的地だった場合に、到達した瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneInit():void
		{
			
			Index.stageContoller.message = "DocumentLayout ではスペシャルプロパティを使って拡張できるようになっています。この例は背景画像のように比率を固定したまま拡大縮小を行いたい場合に ConstrainProportions というスペシャルプロパティを使用します。";
			
			photo = new CastSprite();
			
			addCommand(
				//new LoadChild( photo, new URLRequest( "sora.jpg" ) ),
				new LoadBitmapData( new URLRequest( "sora.jpg"), {
					cacheAsResource:true, 
					context:new LoaderContext(true),
					resGroup:"images",
					resId:"sora_jpg"
					} ),
				function():void {
					var sora:Bitmap = new Bitmap( getResourceById("sora_jpg").data );
					photo.addChild(sora)
					Index.layout.addLayout( photo, { outside: 0 } );
				},
				new AddChild( Index.container, photo )
			);
		}
		
		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは親階層だった場合に、階層が変更された瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneUnload():void
		{
			Index.layout.removeLayout( photo );
			
			Index.container.removeChild( photo );
			
			photo = null;
		}
	}
}









