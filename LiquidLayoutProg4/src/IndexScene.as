/*
prog4 
*/
package {
	import caurina.transitions.properties.FilterShortcuts;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import flash.events.Event;
	import flash.events.*
	import flash.net.URLRequest;
	import flash.display.Loader;
	import flash.display.LoaderInfo;
	import flash.events.MouseEvent;
	import jp.progression.casts.CastDocument;
	import jp.progression.casts.CastSprite;
	import jp.progression.commands.tweens.DoTweener
	import jp.progression.commands.managers.Goto
	import jp.progression.commands.lists.SerialList
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
	import jp.progression.executors.*;
	import jp.progression.scenes.*;
	import jp.progression.scenes.SceneId;
	import jp.progression.scenes.SceneObject;
	import layouttest.*;

	
	/**
	 * ...
	 * @author ...
	 */
	public class IndexScene extends SceneObject {
		
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
		 * 新しい IndexScene インスタンスを作成します。
		 */
		public function IndexScene() {
			// シーンタイトルを設定します。
			title = "AlphabetProg4";
			/////////////////////////////////////////
			FilterShortcuts.init();
			/////////////////////////////////////////

			addScene( new PositionScene( "position" ) );
			addScene( new SizeScene( "size" ) );
			addScene( new DoTweenerScene( "tween" ) );
			addScene( new CostomPropertyScene( "costom" ) );
			addScene( new ProportionScene( "proportion" ) );
		}
		
		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは子階層だった場合に、階層が変更された直後に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atSceneLoad():void {
			addCommand(
			);
		}
		
		/**
		 * シーンオブジェクト自身が目的地だった場合に、到達した瞬間に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atSceneInit():void {
			addCommand(
			new Goto( new SceneId( "/index/position" ) )
			);
		}
		
		/**
		 * シーンオブジェクト自身が出発地だった場合に、移動を開始した瞬間に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atSceneGoto():void {
			addCommand(
			);
		}
		
		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは親階層だった場合に、階層が変更される直前に送出されます。
		 * このイベント処理の実行中には、ExecutorObject を使用した非同期処理が行えます。
		 */
		override protected function atSceneUnload():void {
			addCommand(
			);
		}
	}
}
