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
import flixel.system.FlxSound;

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
    var _box : FlxSprite;
    var _notes : Array<FlxSprite> = [];
    var _letters : Array<String> = [];
    var speed : Int = -2; 
    var puntuacion: Int = 0;
    var _txtPun :FlxText;
    var _play : Bool = false;
    var _A : FlxSound;
    var _S : FlxSound;
    var _D : FlxSound;
    var _F : FlxSound;
    var _bad : FlxSound;
    var _vida : Int = 3;

    override public function create():Void
    {
        super.create();
        
        _bg = new FlxSprite(0, 0);
        _bg.loadGraphic("assets/images/Fondo2.png");
        add(_bg);

        _box = new FlxSprite (37, 396);
        _box.makeGraphic(66,60,FlxColor.TRANSPARENT);
        add(_box);
        
        _txtPun = new FlxText(0,0,0,"Score: "+Std.string(puntuacion),12);
        _txtPun.color = 0x000000;
        add(_txtPun);

        _inst = new FlxSprite(0, 0);
        _inst.loadGraphic("assets/images/Level2Int.png");
        add(_inst);

        FlxG.sound.playMusic("assets/music/Level2BG.mp3",0.5,true);

        _A = FlxG.sound.load("assets/sounds/A.mp3");
        _S = FlxG.sound.load("assets/sounds/S.mp3");
        _D = FlxG.sound.load("assets/sounds/D.mp3");
        _F = FlxG.sound.load("assets/sounds/F.mp3");
        _bad = FlxG.sound.load("assets/sounds/Bad.mp3");

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

            var prob = Std.random(400);
            if (prob == 0) {
                var note = new FlxSprite(552,396);
                note.loadGraphic("assets/images/TeclaA2.png");
                note.acceleration.x = -50;
                add(note);
                _notes.push(note);
                _letters.push("A");
            }
            else if (prob == 100) {
                var note = new FlxSprite(552,396);
                note.loadGraphic("assets/images/TeclaS2.png");
                note.acceleration.x = -50;
                add(note);
                _notes.push(note);
                _letters.push("S");
            }
            else if (prob == 200) {
                var note = new FlxSprite(552,396);
                note.loadGraphic("assets/images/TeclaD2.png");
                note.acceleration.x = -50;
                add(note);
                _notes.push(note);
                _letters.push("D");
            }
            else if (prob == 300) {
                var note = new FlxSprite(552,396);
                note.loadGraphic("assets/images/TeclaF2.png");
                note.acceleration.x = -50;
                add(note);
                _notes.push(note);
                _letters.push("F");
            }
        
            /*Movimiento notas*/
            
            // for (_aux  in _notes) {
            //     _aux.velocity.x = -60;
            // }

            /*Colision notas y aciertos*/
            // Si se sale fuera
            if (_notes.length !=0 && _notes[0].x <= 0) {
                remove(_notes[0]);
                _notes.remove(_notes[0]);
                _letters.remove(_letters[0]);
                _bad.play();
                puntuacion -= 1;
                _vida -= 1;
                _txtPun.text = "Score: " + Std.string(puntuacion);
            }
            // Si está tocando
            if (FlxG.overlap(_box, _notes[0])) {
                if (FlxG.keys.anyJustPressed(["A"]) && _letters[0]=="A") {
                    _A.play();
                    remove(_notes[0]);
                    _notes.remove(_notes[0]);
                    _letters.remove(_letters[0]);
                    puntuacion += 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else  if (FlxG.keys.anyJustPressed(["S"]) && _letters[0]=="S") {
                    _S.play();
                    remove(_notes[0]);
                    _notes.remove(_notes[0]);
                    _letters.remove(_letters[0]);
                    puntuacion += 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else  if (FlxG.keys.anyJustPressed(["D"]) && _letters[0]=="D") {
                    _D.play();
                    remove(_notes[0]);
                    _notes.remove(_notes[0]);
                    _letters.remove(_letters[0]);
                    puntuacion += 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else if (FlxG.keys.anyJustPressed(["F"]) && _letters[0]=="F") {
                    _F.play();
                    remove(_notes[0]);
                    _notes.remove(_notes[0]);
                    _letters.remove(_letters[0]);
                    puntuacion += 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else if (FlxG.keys.anyJustPressed(["A"]) && _letters[0]!="A") {
                    _bad.play();
                    remove(_notes[0]);
                    _notes.remove(_notes[0]);
                    _letters.remove(_letters[0]);
                    puntuacion -= 1;
                    _vida -= 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else if (FlxG.keys.anyJustPressed(["S"]) && _letters[0]!="S") {
                    _bad.play();
                    remove(_notes[0]);
                    _notes.remove(_notes[0]);
                    _letters.remove(_letters[0]);
                    puntuacion -= 1;
                    _vida -= 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else if (FlxG.keys.anyJustPressed(["D"]) && _letters[0]!="D") {
                    _bad.play();
                    remove(_notes[0]);
                    _notes.remove(_notes[0]);
                    _letters.remove(_letters[0]);
                    puntuacion -= 1;
                    _vida -= 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else if (FlxG.keys.anyJustPressed(["F"]) && _letters[0]!="F") {
                    _bad.play();
                    remove(_notes[0]);
                    _notes.remove(_notes[0]);
                    _letters.remove(_letters[0]);
                    puntuacion -= 1;
                    _vida -= 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
            }
            else {
                if (FlxG.keys.anyJustPressed(["A"])) {
                    _bad.play();
                    puntuacion -= 1;
                    _vida -= 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else if (FlxG.keys.anyJustPressed(["S"])) {
                    _bad.play();
                    puntuacion -= 1;
                    _vida -= 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else if (FlxG.keys.anyJustPressed(["D"])) {
                    _bad.play();
                    puntuacion -= 1;
                    _vida -= 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
                else if (FlxG.keys.anyJustPressed(["F"])) {
                    _bad.play();
                    puntuacion -= 1;
                    _vida -= 1;
                    _txtPun.text = "Score: " + Std.string(puntuacion);
                }
            }

            if (puntuacion >= 15) {
                FlxG.switchState(new WinState2());
            }
            else if (_vida <= 0) {
                FlxG.switchState(new LoseState2());
            }
        }
        
    }   
    
    
}