/** */package com.bearphace.social_overview {	import com.bearphace.social_overview.controller.EnterSiteCommand;	import com.bearphace.social_overview.controller.StartupCommand;	import org.puremvc.as3.interfaces.IFacade;
	import org.puremvc.as3.patterns.facade.Facade;
	import org.puremvc.as3.utilities.startupmanager.controller.StartupResourceFailedCommand;
	import org.puremvc.as3.utilities.startupmanager.controller.StartupResourceLoadedCommand;		
	//import flash.util.describeType;    /*    [Embed(source="/Users/bNard/Documents/00.Work/01.ActionScript Projects/WorkSpace/HelloWorld/deploy/fonts/BOD72SWI.TTF", fontFamily="Bodoni", fontWeight="bold",unicodeRange='U+0010-U+007F,U+00C4,U+00D6,U+00DC,U+00E4,U+00F6,U+00FC,U+00DF',            mimeType='application/x-font-truetype')]         *      */    public class ApplicationFacade extends Facade implements IFacade    {        // Notification name constants        public static const STARTUP:String          			= "startup";		        public static const STYLE_SHEET_LOADING:String 		= "styleSheetLoading";        public static const STYLE_SHEET_LOADED:String 			= "styleSheetLoaded";        public static const STYLE_SHEET_FAILED:String 			= "styleSheetFailed";		        public static const SITE_DATA_LOADING:String 			= "siteDataLoading";        public static const SITE_DATA_LOADED:String 			= "siteDataLoaded";        public static const SITE_DATA_FAILED:String 			= "siteDataFailed";
	   public static const ENTER_SITE : String 				= "enterSite";	   public static const START_INTRO : String 				= "start_introAni";		
		
		public static function getInstance() : ApplicationFacade         {            if ( instance == null ) instance = new ApplicationFacade();            return instance as ApplicationFacade;        }        /**         * register StartupCommand with the Controller          */        override protected function initializeController() : void         {            super.initializeController();             registerCommand( STARTUP, StartupCommand );            registerCommand( STYLE_SHEET_LOADED, StartupResourceLoadedCommand );            registerCommand( SITE_DATA_LOADED, StartupResourceLoadedCommand );            registerCommand( STYLE_SHEET_FAILED, StartupResourceFailedCommand );            registerCommand( SITE_DATA_FAILED, StartupResourceFailedCommand );           // registerCommand(OPEN_SCREEN_CLICKED, OpenScreenCommand);            registerCommand(ENTER_SITE, EnterSiteCommand);		}                public function startup( stage:Object ):void        {        	/**        	 * Sending this notification will cause the execute() method in         	 * StartupCommand to be called as it's registered as a listener        	 * of the STARTUP event.        	 */        	sendNotification( STARTUP, stage );        }            }}