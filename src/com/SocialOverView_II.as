package com {
	import com.bearphace.social_overview.ApplicationFacade;

	import flash.display.Sprite;
	import flash.display.StageAlign;
	import flash.display.StageScaleMode;

	/**
	 * @author mbengngassa
	 */
	public class SocialOverView_II extends Sprite {
		private var facade : ApplicationFacade;

		[SWF(width="1024", height="576", backgroundColor="#ffffff", frameRate="30")]
		public function SocialOverView_II() {
			
			
			/**
			 * the facade is a Singleton instance which initializes 
			 * your application and hooks it up with the PureMVC framework
			 */
			facade = ApplicationFacade.getInstance();
			stage.scaleMode = StageScaleMode.NO_SCALE;
			stage.align = StageAlign.TOP_LEFT;
			/**
			 * call startup() to intialize the framework
			 */
			facade.startup(this.stage);
		}
	}
}

