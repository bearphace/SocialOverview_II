package com.bearphace.social_overview.model 
{
	import com.bearphace.social_overview.ApplicationFacade;
	import org.puremvc.as3.patterns.proxy.Proxy;
	import org.puremvc.as3.utilities.startupmanager.interfaces.IStartupProxy;
	
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;
	import flash.text.StyleSheet;		

	public class StyleSheetProxy extends EntityProxy implements IStartupProxy
	{
		public static const NAME:String = "StyleSheetProxy";
        public static const SRNAME:String = "StyleSheetSRProxy";

		public function StyleSheetProxy() 
		{
			super( NAME );
		}
		
		public function load() :void 
		{
		
            sendNotification( ApplicationFacade.STYLE_SHEET_LOADING );
			
			var request:URLRequest = new URLRequest("css/styles.css");
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
			
			loader.load(request);
        }
		
		private function loaderCompleteHandler(event:Event):void 
		{
			data = new StyleSheet();
			data.parseCSS( URLLoader(event.target).data );
			//trace(URLLoader(event.target).data +"no way!");
			sendLoadedNotification( ApplicationFacade.STYLE_SHEET_LOADED, NAME, SRNAME );
		}
		
		private function errorHandler(e:IOErrorEvent):void 
		{
            sendLoadedNotification( ApplicationFacade.STYLE_SHEET_FAILED, NAME, SRNAME );
        }
		
		public function get css():StyleSheet
        {
            return data as StyleSheet;
        }

	}
}