package;

import flixel.FlxG;
import flixel.FlxSprite;
import flixel.FlxState;
import flixel.text.FlxText;
import flixel.ui.FlxButton;
import flixel.util.FlxMath;
import flixel.util.FlxColor;
import flixel.system.FlxSound;
import flixel.util.FlxPoint;
import flixel.util.FlxCollision;

/**
 * A FlxState which can be used for the actual gameplay.
 */
class PlayState2 extends FlxState
{
    /**
     * Function that is called up when to state is created to set it up. 
     */
    
    
    var _bg : FlxSprite;
    var _inst : FlxSprite;
    var _water : FlxSprite;
    var _waterMov: Int =0;
    var _waterDes : Int = 0;
    var _pj : FlxSprite;/*150x100*/
    var _lasers : Array<FlxSprite> = [];
    var _enemies : Array<FlxSprite> = [];
    var _bgMusic : FlxSound;
    var speed : Int = -2; 
    var puntuacion: Int = 0;
    var _txtPun :FlxText;
    var _play : Bool = false;
    
    override public function create():Void
    {
        super.create();
        
        _bg = new FlxSprite(0, 0);
        _bg.loadGraphic("assets/images/Fondo2.png");
        add(_bg);
        
        _txtPun = new FlxText(0,0,0,"Score: "+Std.string(puntuacion),12);
        _txtPun.color = 0xFFFFFF;
        add(_txtPun);

        _inst = new FlxSprite(0, 0);
        _inst.loadGraphic("assets/images/Level2Int.png");
        add(_inst);
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
        
        /*Quitar instrucciones*/
        if (!_play) {
            if (FlxG.keys.anyJustPressed(["SPACE"])){
                remove(_inst);
                _play = true;
            }
        }
        else {
            /*Laseres*/
            
            // if (FlxG.keys.anyJustPressed(["SPACE"])) {/*Disparo un laser*/
            //     var _laser = new FlxSprite(_pj.x + _pj.width / 2 + _pj.width / 4, _pj.y + _pj.height/4);/*creo el sprite*/
            //     _laser.makeGraphic(50,2,FlxColor.FOREST_GREEN);/*Cargo el grafico*/
            //     add(_laser);/*Lo añado*/
            //     _lasers.push(_laser);/*lo añado al array*/
            // }
            
            // /*Movimiento laseres*/
            
            // for (_aux  in _lasers) {
            //     _aux.velocity.x = 500;
            //     if (!_aux.isOnScreen()) {
            //         remove(_aux);
            //         _lasers.remove(_aux);
            //     }
            // }

            // /*Enemigos*/
            
            // var prob = Std.random(200);
            // if (prob>=170) {
            //     var enemy = new FlxSprite(FlxG.height/2+FlxG.height/3+Std.random(200),FlxG.height-FlxG.height/4);
            //     enemy.loadGraphic("assets/images/Malo1.png");
            //     enemy.acceleration.x = -20;
            //     enemy.velocity.y = -50;
            //     add(enemy);
            //     _enemies.push(enemy);
            // }
            
            // /*Movimiento enemigos*/
            
            // for (_aux  in _enemies) {
            //     if (_aux.x < FlxG.height/2) {
            //         _aux.velocity.y = Math.sin(_aux.x) ;
            //     }
            // }
            
            // /*Colision laser y enemigos*/
            
            // for (las in _lasers) {
                
            //     for ( en in _enemies) {
                    
            //         if (FlxG.collide(las,en)) {
            //             remove(en);
            //             remove(las);
            //             _lasers.remove(las);
            //             _enemies.remove(en);
            //             puntuacion += 1;
            //             _txtPun.text = "Score: " + Std.string(puntuacion);
            //         }
                    
            //     }
                
            // }

            // /*Colision enemigos y personaje*/
            // for (en in _enemies) {
            //     if (FlxG.collide(_pj,en)) {
            //         FlxG.switchState(new LoseState1());
            //     }
            // }
            
            // /*Movimiento agua*/
            
            // if (_waterMov==0) {
            //     _water.y += 1;
            //     _pj.y += 1;
            //     _waterDes += 1;
            //     if (_waterDes==30) {
            //         _waterMov = 1;
            //     }
                
            // }else{
            //     _water.y -= 1;
            //     _pj.y -= 1;
            //     _waterDes -= 1;
            //     if (_waterDes==0) {
            //         _waterMov = 0;
            //     }
            // }

            if (puntuacion > 200) {
                FlxG.switchState(new WinState2());
            }
        }
        
    }   
    
    
}