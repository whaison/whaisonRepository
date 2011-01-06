/**
 * 
 */
package layouttest
{
	import flash.display.Sprite;
	import flash.events.MouseEvent;
	import jp.nium.events.ExEvent;
	import jp.progression.casts.CastDocument;
	import jp.progression.casts.CastSprite;
	import jp.progression.executors.ExecutorObjectState;
	//import jp.progression.commands.DoTweener;
	import jp.progression.commands.tweens.DoTweener;
	//import jp.progression.commands.SerialList;
	import jp.progression.commands.lists.SerialList
	import jp.progression.scenes.SceneObject;
	/*prog4scene*/
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
	import flash.display.MovieClip
	/**
	 * IndexScene クラス
	 */
	public class DoTweenerScene extends SceneObject
	{
		public var cm:CastSprite;
		public var rb:CastSprite;
		public var w:CastSprite;
		public var lb:CastSprite;
		
		private var cmTween:Command;
		private var rbTween:Command;
		private var wTween:Command;
		private var lbTween:Command;
		
		/**
		 * コンストラクタ
		 */
		public function DoTweenerScene( name:String = null, initObject:Object = null )
		{
			super( name,initObject );
			// ブラウザ同期時に出力したいタイトルを設定します。
			title = "DoTweener | DocuemntLayout";
		}
		
		/**
		 * シーンオブジェクトが目的地だった場合に、到達した瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneInit():void
		{
			
			Index.stageContoller.message = "リサイズが完了した際に DoTweener コマンドを用いてイージング機能を実行します。\nDocumentLayout クラス内にはコマンド実行は実装されていませんので onResizeComplete などのイベントハンドラメソッドにより、適時対応することになります。";
			
			cm = Index.createRect( "画面中央に1秒遅れてトゥイーン", 0xFF0000, 100, 100, -50, -50 );
			rb = Index.createRect( "画面右にトゥイーン後、画面下にトゥイーン" );
			w = Index.createRect( "画面上部、横幅にトゥイーン" );
			lb = Index.createRect( "画面左下にトゥイーン" );

			
			
			Index.layout.addLayout( cm, { onResizeComplete: cmResizeComplate } );
			Index.layout.addLayout( w, { onResizeComplete: wResizeComplate } );
			Index.layout.addLayout( lb, { onResizeComplete: lbResizeComplate } );
			Index.layout.addLayout( rb, { onResizeComplete: rbResizeComplate } );
			
			
			Index.container.addChild( cm );
			Index.container.addChild( rb );
			Index.container.addChild( w );
			Index.container.addChild( lb );

		}
		
		private function cmResizeComplate():void
		{
			cmTween = new DoTweener( cm, { x: Index.layout.center, y: Index.layout.middle, transition: "easeOutBack", time: 0.5, delay: 1 } );
			cmTween.execute();
		}
		
		private function rbResizeComplate():void
		{
			
			rbTween = new SerialList( null, 
			////DoTweener (target:Object, parameters:Object, initObject:Object = null);
				new DoTweener( rb, { x: Index.layout.right - 100, transition: "easeOutExpo", time: 0.5 } ),
				new DoTweener( rb, { y: Index.layout.bottom - 100,  transition: "easeOutExpo", time: 0.5 } )
			);
			rbTween.execute();
		}
		
		private function wResizeComplate():void
		{

			wTween = new DoTweener( w, { x: Index.layout.left, y: Index.layout.top, width: Index.layout.width, transition: "easeOutBack", time: 0.5 } );
			wTween.execute();
		}
		
		private function lbResizeComplate():void
		{

			lbTween = new DoTweener( lb, { x: Index.layout.left, y: Index.layout.bottom - 100, transition: "linear", time: 0.5 } );
			lbTween.execute();
		}
		



		/**
		 * シーン移動時に目的地がシーンオブジェクト自身もしくは親階層だった場合に、階層が変更された瞬間に送出されます。
		 * このイベント処理の実行中には、addCommand() メソッド、及び insertCommand() メソッドによるコマンドの同期処理が行えます。
		 */
		protected override function atSceneUnload():void
		{
			Index.layout.removeLayout( cm, rb, w, lb );
			
			Index.container.removeChild( cm );
			Index.container.removeChild( rb );
			Index.container.removeChild( w );
			Index.container.removeChild( lb );

			
			cm = null;
			rb  = null;
			w=null
			lb=null
		}
	}
}









