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
class LoseState1 extends FlxState
{
    /**
     * Function that is called up when to state is created to set it up. 
     */
    
    var _bg : FlxSprite;
    var _lose : FlxSound;
    
    override public function create():Void
    {
        super.create();

        _bg = new FlxSprite(0, 0);
        _bg.loadGraphic("assets/images/Lose1.png");
        add(_bg);

        _lose = FlxG.sound.load("assets/sounds/Lose.mp3");
        _lose.play();

        FlxG.sound.playMusic("assets/music/Menu.mp3",1,true);

        haxe.Timer.delay(changeMenu, 3000);
    }
    
    /**
     * Function that is called when this state is destroyed - you might want to 
     * consider setting all objects this state uses to null to help garbage collection.
     */
    override public function destroy():Void
    {
        super.destroy();
        FlxG.sound.destroy(true);
    }

    /**
     * Function that is called once every frame.
     */
    override public function update():Void
    {
        super.update();
    }

    public function changeMenu(): Void
    {
        FlxG.switchState(new MenuState());
    }
}