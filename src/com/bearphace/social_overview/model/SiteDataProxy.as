package com.bearphace.social_overview.model 
{
	
	
	import com.bearphace.social_overview.ApplicationFacade;
	import org.puremvc.as3.patterns.proxy.Proxy;
	import org.puremvc.as3.utilities.startupmanager.interfaces.IStartupProxy;
	
	import flash.events.*;
	import flash.net.URLLoader;
	import flash.net.URLRequest;		

	public class SiteDataProxy extends EntityProxy implements IStartupProxy
	{
		public static const NAME:String = "SiteDataProxy";
		 public static const SRNAME:String = "SiteDataSRProxy";
		private var workAssets:String = "assets/work/";	
		public var navIDs : Array;
		private var introData : Object;
		 
		public function SiteDataProxy() 
		{
			super( NAME );
		}
		
		public function load() :void 
		{
            sendNotification( ApplicationFacade.SITE_DATA_LOADING );
			
			var request:URLRequest = new URLRequest("xml/socialOverview.xml");
			var loader:URLLoader = new URLLoader();
			
			loader.addEventListener(IOErrorEvent.IO_ERROR, errorHandler);
            	loader.addEventListener(Event.COMPLETE, loaderCompleteHandler);
			
			loader.load(request);
        }
		
		private function loaderCompleteHandler(event:Event):void 
		{			
			var xml:XML = new XML( event.target.data );
			//xml.ignoreWhitespace = true;
			//var sections:XMLList = xml.sections.section;
			var intro_txt:String= xml.intro.txt1.children().toXMLString();
			var login_txt:String = xml.intro.login.children().toXMLString();
			trace (" site proxy intro_txt 2 : "+intro_txt );
			introData = {txt1:intro_txt, login:login_txt};
			sendLoadedNotification( ApplicationFacade.SITE_DATA_LOADED, NAME, SRNAME );
		}
		
		private function errorHandler(e:IOErrorEvent):void 
		{
            sendLoadedNotification( ApplicationFacade.SITE_DATA_FAILED, NAME, SRNAME );
        }
		
		public function get intro_txt() : Object
        {
			trace ("get intro txt called");
        	return introData as Object; 
        }
		public function get login_txt():String
        {
            return login_txt as String;
        }
	}
}