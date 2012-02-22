package com.bearphace.social_overview.view.pages {
	import flash.text.TextFieldAutoSize;
	import flash.text.TextField;

		import flash.text.TextFormat;
	import flash.display.Sprite;

	/**
	 * @author bearphace
	 */
	public class IntroPage extends Sprite {
		private var _data : Object;
		private var introTxt : TextField;

		public function IntroPage() {
			
		}
		public function draw ():void
		{
			introTxt = createIntroTxt(_data.txt1);
			//trace (_data.txt1 +" introData.txt1")
			addChild(introTxt);
		}
		public function show ():void
		{
			
		}

		protected function createIntroTxt(str : String, x : uint = 0, y : uint = 0) : TextField {
			var _textFormat : TextFormat = new TextFormat();
			_textFormat.font = "Orator";
			_textFormat.color = 0x3d1a23;
			_textFormat.size = 25;

			var  txt : TextField = new TextField();
			//txt.embedFonts = true;
			txt.antiAliasType = "none";
			txt.selectable = false;
			txt.width = 500;
			txt.wordWrap = true;
			txt.autoSize = TextFieldAutoSize.CENTER;
			txt.defaultTextFormat = _textFormat;
			txt.text = str;
			txt.x = x;
			txt.y = y;
			return txt;
		}

		public function data(intro_txt : Object) : void {
			_data = intro_txt;
			onData();
		}

		private function onData() : void {
			draw();
		}
	}
}
