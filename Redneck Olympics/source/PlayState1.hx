package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState1 extends FlxState
{
	/**
	 * Function that is called up when to state is created to set it up. 
	 */
	
	
	var _bg : FlxSprite;
	var _water : FlxSprite;
	var _waterMov: Int =0;
	var _waterDes : Int = 0;
	var _pj : FlxSprite;/*150x100*/
	var _lasers : Array<FlxSprite>=[];
	
	override public function create():Void
	{
		super.create();
		
		_bg = new FlxSprite(0, 0);
		_bg.makeGraphic(FlxG.width, FlxG.height, FlxColor.AQUAMARINE);
		add(_bg);
		
		_pj = new FlxSprite(FlxG.width / 10, FlxG.height / 2 + FlxG.height / 3 - 85);
		_pj.makeGraphic(150,100,FlxColor.YELLOW);
		add(_pj);
		
		_water = new FlxSprite(0, FlxG.height / 2 + FlxG.height / 3);
		_water.makeGraphic(FlxG.width,Std.int(FlxG.height/5),FlxColor.BLUE);
		add(_water);
		
		
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
		
		/*Laseres*/
		
		if (FlxG.keys.anyJustPressed(["SPACE"])) {/*Disparo un laser*/
			var _laser = new FlxSprite(_pj.x + _pj.width / 2 + _pj.width / 4, _pj.y + _pj.height/4);/*creo el sprite*/
			_laser.makeGraphic(50,2,FlxColor.FOREST_GREEN);/*Cargo el grafico*/
			add(_laser);/*Lo añado*/
			_lasers.push(_laser);/*lo añado al array*/
		}
		
		/*Movimiento laseres*/
		
		for (_aux  in _lasers) {
			_aux.velocity.x = 500;
			if (!_aux.isOnScreen()) {
				remove(_aux);
				_lasers.remove(_aux);
			}
		}
		
		/*Movimiento agua*/
		
		if (_waterMov==0) {
			_water.y += 1;
			_pj.y += 1;
			_waterDes += 1;
			if (_waterDes==30) {
				_waterMov = 1;
			}
			
		}else{
			_water.y -= 1;
			_pj.y -= 1;
			_waterDes -= 1;
			if (_waterDes==0) {
				_waterMov = 0;
			}
		}
		
	}	
	
	
}