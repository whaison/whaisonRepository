package layouttest 
{
	import fl.controls.Button;
	import fl.controls.TextInput;
	import fl.controls.UIScrollBar;
	import flash.display.MovieClip;
	import flash.display.Sprite;
	import fl.controls.ComboBox;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;
	import flash.events.Event;
	import flash.events.MouseEvent;
	import flash.geom.Rectangle;
	import flash.text.TextField;
	import jp.progression.casts.CastSprite;
	//#######################################################################################TOP BUTTON SET#######################
	import jp.progression.scenes.SceneId;
	//#######################################################################################TOP BUTTON SET#######################
	import layouttest.*;
	/**
	 * ...
	 * @author cue
	 */
	public class StageController extends Sprite
	{

		private var _titleBar:MovieClip;
		private var _windowHitArea:MovieClip;
		private var _content:MovieClip;
		private var _contentmenu:MovieClip;
		private var _contentBackground:MovieClip;
		
		//#########################################################
		private var _contentmenuAboutbtn:MovieClip;
		private var _contentmenuStylebtn:MovieClip;
		private var _contentmenuAccessbtn:MovieClip;
		private var _contentmenuReservebtn:MovieClip;
		//####################################################
		private var _minimizeButton:MovieClip;
		private var _maximizeButton:MovieClip;
		
		private var _stageAlignList:ComboBox;
		private var _stageScaleList:ComboBox;
		
		private var _contentWidthText:TextField;
		private var _contentHeightText:TextField;
		private var _stageWidthText:TextField;
		private var _stageHeightText:TextField;
		
		private var _minWidthInput:TextInput;
		private var _minHeightInput:TextInput;
		private var _maxWidthInput:TextInput;
		private var _maxHeightInput:TextInput;
		
		private var _positionButton:GotoSceneButton;
		private var _sizeButton:GotoSceneButton;
		private var _tweenerButton:GotoSceneButton;
		private var _costomButton:GotoSceneButton;
		private var _proportionButton:GotoSceneButton;
		
		//#######################################################################################TOP BUTTON SET#######################ＯＫだが 移動したためコメント
		/*
		private var _salon_mc :MovieClip;
		private var _homeButton:AbetGotoSceneButton;
		private var _aboutButton:AbetGotoSceneButton;
		private var _styleButton:AbetGotoSceneButton;
		private var _accessButton:AbetGotoSceneButton;
		*/
		//#######################################################################################TOP BUTTON SET#######################ＯＫだが 移動したためコメント
		
		private var _messageInput:TextInput;
		private var _messageScrollBar:UIScrollBar;
		
		private var _updateButton:Button;
		
		public function get message():String { return _messageInput.text; }
		public function set message( value:String ):void
		{
			_messageInput.text = value;
			_messageScrollBar.update();
		}
		
		/**
		 * コンストラクタ
		 */
		public function StageController() 
		{
			x = 10;
			y = 10;
			
			_titleBar = MovieClip( getChildByName( "titleBar" ) );
			_windowHitArea = MovieClip( getChildByName( "windowHitArea" ) );
			_content = MovieClip( getChildByName( "content" ) );
			//#######################################################################################TOP BUTTON SET#######################ＯＫだが 移動したためコメント
			//_salon_mc = MovieClip(getChildByName("salon_mc"))
			//#######################################################################################TOP BUTTON SET#######################ＯＫだが 移動したためコメント
			/*
			_contentmenu = MovieClip(getChildByName("contentmenu"))
			_contentmenuAboutbtn = MovieClip( _contentmenu.getChildByName( "about_btn" ) );
			_contentmenuStylebtn = MovieClip( _contentmenu.getChildByName( "style_btn" ) );
			_contentmenuAccessbtn = MovieClip( _contentmenu.getChildByName( "access_btn" ) );
			_contentmenuReservebtn = MovieClip( _contentmenu.getChildByName( "reserve_btn" ) );
			*/
			//##############################################################################
			_minimizeButton = MovieClip( getChildByName( "minimizeButton" ) );
			_maximizeButton = MovieClip( getChildByName( "maximizeButton" ) );
			
			_contentBackground = MovieClip( _content.getChildByName( "background" ) );
			
			_stageAlignList = ComboBox( _content.getChildByName( "stageAlignList" ) );
			_stageScaleList = ComboBox( _content.getChildByName( "stageScaleList" ) );
			
			_contentWidthText = TextField( _content.getChildByName( "contentWidthText" ) );
			_contentHeightText = TextField( _content.getChildByName( "contentHeightText" ) );
			_stageWidthText = TextField( _content.getChildByName( "stageWidthText" ) );
			_stageHeightText = TextField( _content.getChildByName( "stageHeightText" ) );
			
			_minWidthInput = TextInput( _content.getChildByName( "minWidthInput" ) );
			_minHeightInput = TextInput( _content.getChildByName( "minHeightInput" ) );
			_maxWidthInput = TextInput( _content.getChildByName( "maxWidthInput" ) );
			_maxHeightInput = TextInput( _content.getChildByName( "maxHeightInput" ) );
			
			_updateButton = Button( _content.getChildByName( "updateButton" ) );
			
					
			
			var buttonX:Number = 10;
			
			
			_positionButton = new GotoSceneButton();
			_positionButton.sceneId = new SceneId( "/index/position" );
			_positionButton.text = "位置";
			_positionButton.x = buttonX;
			buttonX += GotoSceneButton.WIDTH + 5;
			
			_sizeButton = new GotoSceneButton();
			_sizeButton.sceneId = new SceneId( "/index/size" );
			_sizeButton.text = "サイズ";
			_sizeButton.x = buttonX;
			buttonX += GotoSceneButton.WIDTH + 5;
			
			_tweenerButton = new GotoSceneButton();
			_tweenerButton.sceneId = new SceneId( "/index/tween" );
			_tweenerButton.text = "トゥイーン";
			_tweenerButton.x = buttonX;
			buttonX += GotoSceneButton.WIDTH + 5;
			
			_costomButton = new GotoSceneButton();
			_costomButton.sceneId = new SceneId( "/index/costom" );
			_costomButton.text = "カスタム";
			_costomButton.x = buttonX;
			buttonX += GotoSceneButton.WIDTH + 5;
			
			_proportionButton = new GotoSceneButton();
			_proportionButton.sceneId = new SceneId( "/index/proportion" );
			_proportionButton.text = "比率固定";
			_proportionButton.x = buttonX;
			
			/*
			//#######################################################################################TOP BUTTON SET#######################ＯＫだが 移動したためコメント
			//#######################################################################
			var AbetButtonY:Number = 10;
			
			_homeButton = new AbetGotoSceneButton()
			_homeButton.sceneId = new SceneId("/index/home")
			_homeButton.text = "home";
			trace("代入前のAbetButtonY=" + AbetButtonY)
			_homeButton.y = AbetButtonY
			trace("_homeButton.y="+_homeButton.y)

			AbetButtonY += AbetGotoSceneButton.HEIGHT + 1;
						
			_aboutButton = new AbetGotoSceneButton()
			_aboutButton.sceneId = new SceneId("/index/about")
			_aboutButton.text = "about salon";
			trace("代入前のAbetButtonY="+AbetButtonY)
			_aboutButton.y = AbetButtonY
			trace("_aboutButton.y="+_aboutButton.y)
			AbetButtonY += AbetGotoSceneButton.HEIGHT + 1;
			
			
			_styleButton = new AbetGotoSceneButton()
			_styleButton.sceneId = new SceneId("/index/style")
			_styleButton.text = "style menu";
			trace("代入前のAbetButtonY=" + AbetButtonY)
			_styleButton.y = AbetButtonY
			trace("_styleButton.y="+_styleButton.y)
			AbetButtonY += AbetGotoSceneButton.HEIGHT + 1;
			
			
			_accessButton = new AbetGotoSceneButton()
			_accessButton.sceneId = new SceneId("/index/access")
			_accessButton.text = "access to store";
			trace("代入前のAbetButtonY="+AbetButtonY)
			_accessButton.y = AbetButtonY
			trace("_accessButton.y="+_accessButton.y)
			AbetButtonY += AbetGotoSceneButton.HEIGHT + 1;
			
			//#######################################################################
			//####################################################st
			_salon_mc.addChild(_homeButton);
			_salon_mc.addChild(_aboutButton);
			_salon_mc.addChild(_styleButton);
			_salon_mc.addChild(_accessButton);
			//################################################end
			//#######################################################################################TOP BUTTON SET#######################ＯＫだが 移動したためコメント
			*/
			_positionButton.y = 125;
			_sizeButton.y = 125;
			_tweenerButton.y = 125;
			_costomButton.y = 125;
			_proportionButton.y = 125;

			_content.addChild( _positionButton );
			_content.addChild( _sizeButton );
			_content.addChild( _tweenerButton );
			_content.addChild( _costomButton );
			_content.addChild( _proportionButton );
			

			_messageInput = TextInput( _content.getChildByName( "messageInput" ) );
			_messageInput.textField.multiline = true;
			_messageInput.textField.wordWrap = true;
			
			_messageScrollBar = new UIScrollBar();
			_messageScrollBar.move( _messageInput.x + _messageInput.width, _messageInput.y );
			_messageScrollBar.setSize( _messageScrollBar.width, _messageInput.height );
			_messageScrollBar.scrollTarget = _messageInput.textField;
			_content.addChild( _messageScrollBar );
			
			_content.swapChildren( _messageInput, _messageScrollBar );
			
			addEventListener( Event.ADDED_TO_STAGE, _added, false, 0, true );
		}
		
		private function _added( e:Event ):void
		{
			_stageAlignList.addItem( { label: "中央", data: null } );
			_stageAlignList.addItem( { label: "TOP", data: StageAlign.TOP } );
			_stageAlignList.addItem( { label: "TOP_LEFT", data: StageAlign.TOP_LEFT } );
			_stageAlignList.addItem( { label: "TOP_RIGHT", data: StageAlign.TOP_RIGHT } );
			_stageAlignList.addItem( { label: "BOTTOM", data: StageAlign.BOTTOM } );
			_stageAlignList.addItem( { label: "BOTTOM_LEFT", data: StageAlign.BOTTOM_LEFT } );
			_stageAlignList.addItem( { label: "BOTTOM_RIGHT", data: StageAlign.BOTTOM_RIGHT } );
			_stageAlignList.addItem( { label: "LEFT", data: StageAlign.LEFT } );
			_stageAlignList.addItem( { label: "RIGHT", data: StageAlign.RIGHT } );
			
			_stageScaleList.addItem( { label: "EXACT_FIT", data: StageScaleMode.EXACT_FIT } );
			_stageScaleList.addItem( { label: "NO_BORDER", data: StageScaleMode.NO_BORDER } );
			_stageScaleList.addItem( { label: "NO_SCALE", data: StageScaleMode.NO_SCALE } );
			_stageScaleList.addItem( { label: "SHOW_ALL", data: StageScaleMode.SHOW_ALL } );
			
			_stageAlignList.selectedIndex = 2;
			_stageScaleList.selectedIndex = 2;
			
			_content.mouseChildren = true;
			_content.mouseEnabled = 
			_titleBar.mouseEnabled = 
			_contentBackground.mouseEnabled = 
			_contentWidthText.mouseEnabled =  
			_contentHeightText.mouseEnabled =  
			_stageWidthText.mouseEnabled =  
			_stageHeightText.mouseEnabled = false;
			_maximizeButton.visible = true;
			
			_updateButton.addEventListener( MouseEvent.CLICK, _update );
			_windowHitArea.addEventListener( MouseEvent.MOUSE_DOWN, _windowMouseDown );
			_minimizeButton.addEventListener( MouseEvent.CLICK, minimize );
			_maximizeButton.addEventListener( MouseEvent.CLICK, maximize );
			
			//#######################################################################
		_content.visible = true
		_windowHitArea.height = 20;
		
		_minimizeButton.visible = true;
		_maximizeButton.visible = true;
		//####################################################################
			
			
			
		}
		
		public function onResize():void
		{
			_contentWidthText.text = Index.layout.width.toString();
			_contentHeightText.text = Index.layout.height.toString();
			_stageWidthText.text = stage.stageWidth.toString();
			_stageHeightText.text = stage.stageHeight.toString();
			
			_minWidthInput.text = Index.layout.stageMinWidth.toString();
			_minHeightInput.text = Index.layout.stageMinHeight.toString();
			_maxWidthInput.text = Index.layout.stageMaxWidth.toString();
			_maxHeightInput.text = Index.layout.stageMaxHeight.toString();
		}
		
		private function _update( e:MouseEvent ):void
		{
			stage.align = _stageAlignList.value;
			stage.scaleMode = _stageScaleList.value;
			
			Index.layout.stageMinWidth = int( _minWidthInput.text );
			Index.layout.stageMinHeight = int( _minHeightInput.text );
			Index.layout.stageMaxWidth = int( _maxWidthInput.text );
			Index.layout.stageMaxHeight = int( _maxHeightInput.text );
			
			Index.layout.updateAll();
			
			x = Index.layout.left + 10;
			y = Index.layout.top + 10;
		}
		
		private function _windowMouseDown( e:MouseEvent ):void
		{
			startDrag();// false, new Rectangle
			stage.addEventListener( MouseEvent.MOUSE_UP, _windowMouseUp );
		}
		
		private function _windowMouseUp( e:MouseEvent ):void
		{
			stopDrag();
			stage.removeEventListener( MouseEvent.MOUSE_UP, _windowMouseUp );
		}
		
		private function minimize( e:MouseEvent ):void
		{
			_content.visible = false;
			
			_windowHitArea.height = 20;
			
			_minimizeButton.visible = false;
			_maximizeButton.visible = true;
		}
		
		private function maximize( e:MouseEvent ):void
		{
			_content.visible = true;
			
			_windowHitArea.height = 20;
			
			_minimizeButton.visible = true;
			_maximizeButton.visible = false;
		}
	}
	
}