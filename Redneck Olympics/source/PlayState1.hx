package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.system.FlxSound;

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
	var _lasers : Array<FlxSprite> = [];
	var _enemies : Array<FlxSprite> = [];
	var _bgMusic : FlxSound;
	
	override public function create():Void
	{
		super.create();
		
		_bg = new FlxSprite(0, 0);
		_bg.loadGraphic("assets/images/Fondo1.png");
		add(_bg);
		
		//He cambiado donde debe aparecer el pato y a mí si me lo carga
		_pj = new FlxSprite(FlxG.width / 10, FlxG.height / 2 + FlxG.height / 3 - 150);
		//_pj.makeGraphic(150,100,FlxColor.YELLOW);
		_pj.loadGraphic("assets/images/Pato1.png");
		add(_pj);
		
		_water = new FlxSprite(0,0);
		_water.loadGraphic("assets/images/Olas1.png");
		add(_water);
	
		_bgMusic = FlxG.sound.load("assets/music/Level1BG.mp3");
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