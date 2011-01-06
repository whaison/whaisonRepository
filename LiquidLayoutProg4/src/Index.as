/**
 * layouttest
 */
package {
	import com.cuegraphix.layouts.LiquidLayout;
	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageQuality;
	import flash.display.StageScaleMode;
	import flash.events.MouseEvent;
	import jp.progression.casts.*;
	import jp.progression.commands.display.*;
	import jp.progression.commands.lists.*;
	import jp.progression.commands.managers.*;
	import jp.progression.commands.media.*;
	import jp.progression.commands.net.*;
	import jp.progression.commands.tweens.*;
	import jp.progression.commands.*;
	import jp.progression.config.*;
	import jp.progression.data.*;
	import jp.progression.debug.*;
	import jp.progression.events.*;
	import jp.progression.scenes.*;
	import org.libspark.ui.SWFWheel;
	import layouttest.*;
	//import myproject.common.FontAsset;
	//import utabi.Utils;
	
	import jp.nium.events.ExEvent;
	
	//import myproject.scenes.IndexScene;
	//import myproject.sound.SoundManager;
	//import myproject.*;
	import org.libspark.ui.SWFWheel;
	/**
	 * ...
	 * @author ...
	 */
	public class Index extends CastDocument {
		/*======================================================================*//**
		 * Sound Manager Instance
		 */
		//private var sound:SoundManager;
		
		
		public static var layout:LiquidLayout;
		private var _this:*;
		public static var container:Sprite;
		
		public static var stageContoller:StageController;
		/**
		 * 新しい Index インスタンスを作成します。
		 */
		public function Index() {
			// 自動的に作成される Progression インスタンスの初期設定を行います。
			// 生成されたインスタンスにアクセスする場合には manager プロパティを参照してください。
			super( "index", IndexScene, new WebConfig() );
			this._this = this;
		}
		
		/**
		 * SWF ファイルの読み込みが完了し、stage 及び loaderInfo にアクセス可能になった場合に送出されます。
		 */
		override protected function atReady():void {

			
			
			
			// 開発者用に Progression の動作状況を出力します。
			Debugger.addTarget( manager );
			
			// SWFWheel を有効化する
			SWFWheel.initialize( stage );
			
			// 外部同期機能を有効化します。
			manager.sync = true;
			
			/*
			// stage の初期設定を行います。
			align = StageAlign.TOP_LEFT;
			quality = StageQuality.HIGH;
			scaleMode = StageScaleMode.NO_SCALE;
			*/
			
			layout = new LiquidLayout( _this );
			//layout =new LiquidLayout( _this, 0,0,2880,2880 , manager,manager.stage)
			layout.stageMinWidth = 0;
            layout.stageMinHeight = 0;
			container = new Sprite();
			stageContoller = new StageController();
			addChild(container)
			addChild(stageContoller)
			layout.addLayout( stageContoller, { onResize: stageContoller.onResize } )
			
			//layout.addLayout( stageContoller, { onResizeComplete: stageContoller.onResize } )
			//_this.manager.stage.addEventListener(ExEvent.EX_RESIZE_COMPLETE,exResizeEventComplite)
			
			//Utils.setObject("manager", manager);
			// 最初のシーンに移動します。
			manager.goto( manager.syncedSceneId );
			
			
			
		}
		
		private function exResizeEventComplite(e:ExEvent):void 
		{
			trace("exResizeEventComplite e="+e)
		}
		
		public static function createRect( caption:String, color:int = 0xFF0000, width:Number = 100, height:Number = 100, x:Number = 0, y:Number = 0 ):CastSprite
		{
			var sp:CastSprite = new CastSprite();
			sp.toolTip.text = caption;
			sp.buttonMode = true;
			sp.addEventListener( MouseEvent.CLICK, function( e:MouseEvent ):void { Index.layout.setEnableLayout( e.currentTarget, !Index.layout.isEnabled( e.currentTarget ) ); } );
			/**/
			sp.graphics.beginFill( color, 0.1 );
			sp.graphics.drawRect( x, y, width, height );
			sp.graphics.endFill();
			
			return sp;
		}
	}
}
