package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.system.FlxSound;

/**
 * A FlxState which can be used for the game's menu.
 */
class MenuState extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	
	var _bg : FlxSprite;
	var _btnPlay : FlxButton;
	var _bgMusic : FlxSound;
	
	override public function create():Void
	{
		super.create();

		_bg = new FlxSprite(0, 0);
		_bg.loadGraphic("assets/images/Intro.png");
		add(_bg);
		
		_btnPlay = new FlxButton(430,297,"Start Game",playGame);
		add(_btnPlay);

		_bgMusic = FlxG.sound.load("assets/music/Menu.mp3");
		_bgMusic.play();
	}
	
	/**
	 * Function that is called when this state is destroyed - you might want to 
	 * consider setting all objects this state uses to null to help garbage collection.
	 */
	override public function destroy():Void
	{
		super.destroy();
	}

	/**
	 * Function that is called once every frame.
	 */
	override public function update():Void
	{
		super.update();
	}
	
	public function playGame() {
			FlxG.switchState(new PlayState1());
	
	}
}