/**
 * PureMVC Flash/AS3 site demo
 * Copyright (c) 2008 Yee Peng Chia <peng@hubflanger.com>
 * 
 * This work is licensed under a Creative Commons Attribution 3.0 United States License.
 * Some Rights Reserved.
 */
package com.bearphace.social_overview.controller
{
	import com.bearphace.social_overview.view.StageMediator;
	import org.puremvc.as3.interfaces.ICommand;
	import org.puremvc.as3.interfaces.INotification;
	import org.puremvc.as3.patterns.command.SimpleCommand;		

	public class OpenScreenCommand extends SimpleCommand implements ICommand
    {

		
		override public function execute( note:INotification ):void    
        	{
			var stageMediator : StageMediator = facade.retrieveMediator(StageMediator.NAME) as StageMediator;
			
			switch (note.getBody() as String)
			{
				case "Browse":
					//var oCard:DisplayCard = stageMediator.displayCards[2];
					//sendNotification(ApplicationFacade.CARD_CLICKED,oCard);
					break;
			}
		}
	}
}