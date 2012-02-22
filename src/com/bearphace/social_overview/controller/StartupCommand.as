/**
 * PureMVC Flash/AS3 site demo
 * Copyright (c) 2008 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.bearphace.social_overview.controller
{	
	
	import com.bearphace.social_overview.model.SiteDataProxy;
	import com.bearphace.social_overview.model.StyleSheetProxy;
	import com.bearphace.social_overview.view.StageMediator;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;
	import org.puremvc.as3.utilities.startupmanager.interfaces.IStartupProxy;
	import org.puremvc.as3.utilities.startupmanager.model.StartupMonitorProxy;
	import org.puremvc.as3.utilities.startupmanager.model.StartupResourceProxy;
	
	import flash.display.Stage;		

	public class StartupCommand extends SimpleCommand implements ICommand
    {
        private var _monitor:StartupMonitorProxy;
		
		override public function execute( note:INotification ):void    
        {
			var stage:Stage = note.getBody() as Stage;
			facade.registerMediator( new StageMediator( stage ) );
			
			facade.registerProxy( new StartupMonitorProxy() );
            	_monitor = facade.retrieveProxy( StartupMonitorProxy.NAME ) as StartupMonitorProxy;
         //   _monitor.defaultTimeout = 30;
			
			//var styleSheetProxy:IStartupProxy = new StyleSheetProxy();
			//var siteDataProxy:IStartupProxy = new SiteDataProxy();
			
			var styleSheetProxy:StyleSheetProxy = new StyleSheetProxy();
			var siteDataProxy:SiteDataProxy = new SiteDataProxy();
			
			facade.registerProxy( styleSheetProxy );
			facade.registerProxy( siteDataProxy );
						
			var rStyleSheetProxy:StartupResourceProxy = makeAndRegisterStartupResource( StyleSheetProxy.SRNAME, styleSheetProxy );
			var rSiteDataProxy:StartupResourceProxy = makeAndRegisterStartupResource( SiteDataProxy.SRNAME, siteDataProxy );
			
			rSiteDataProxy.requires = [ rStyleSheetProxy ];
			
			_monitor.loadResources();
        }
		
		private function makeAndRegisterStartupResource( proxyName:String, appResourceProxy:IStartupProxy ):StartupResourceProxy 
		{
            var r:StartupResourceProxy = new StartupResourceProxy( proxyName, appResourceProxy );
            facade.registerProxy( r );
            _monitor.addResource( r );
            return r;
        }
    }
}