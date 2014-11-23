import lime.Assets;
#if !macro


class ApplicationMain {
	
	
	public static var config:lime.app.Config;
	public static var preloader:openfl.display.Preloader;
	
	private static var app:lime.app.Application;
	
	
	public static function create ():Void {
		
		app = new openfl.display.Application ();
		app.create (config);
		
		var display = new flixel.system.FlxPreloader ();
		
		preloader = new openfl.display.Preloader (display);
		preloader.onComplete = init;
		preloader.create (config);
		
		#if js
		var urls = [];
		var types = [];
		
		
		urls.push ("assets/images/Olas1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Fondo1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Pato1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/images-go-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/images/TeclaF2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Fondo2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Win1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/TeclaD2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Intro.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/TeclaS2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Lose1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Level2Int.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Lose2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Level1Int.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Win2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/TeclaA2.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/images/Malo1.png");
		types.push (AssetType.IMAGE);
		
		
		urls.push ("assets/sounds/Bad.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Lose.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Hurt.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/S.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/sounds-go-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/sounds/D.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/Laser.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/F.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/A.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/music/Level2BG.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/music/Level1BG.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/music/Menu.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/music/music-goes-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/data/data-goes-here.txt");
		types.push (AssetType.TEXT);
		
		
		urls.push ("assets/sounds/beep.mp3");
		types.push (AssetType.MUSIC);
		
		
		urls.push ("assets/sounds/flixel.mp3");
		types.push (AssetType.MUSIC);
		
		
		
		preloader.load (urls, types);
		#end
		
		var result = app.exec ();
		
		#if sys
		Sys.exit (result);
		#end
		
	}
	
	
	public static function init ():Void {
		
		var loaded = 0;
		var total = 0;
		var library_onLoad = function (_) {
			
			loaded++;
			
			if (loaded == total) {
				
				start ();
				
			}
			
		}
		
		preloader = null;
		
		
		
		if (loaded == total) {
			
			start ();
			
		}
		
	}
	
	
	public static function main () {
		
		config = {
			
			antialiasing: Std.int (0),
			background: Std.int (0),
			borderless: false,
			depthBuffer: false,
			fps: Std.int (60),
			fullscreen: false,
			height: Std.int (480),
			orientation: "portrait",
			resizable: true,
			stencilBuffer: false,
			title: "Redneck Olympics",
			vsync: true,
			width: Std.int (640),
			
		}
		
		#if js
		#if munit
		flash.Lib.embed (null, 640, 480, "000000");
		#end
		#else
		create ();
		#end
		
	}
	
	
	public static function start ():Void {
		
		openfl.Lib.current.stage.align = openfl.display.StageAlign.TOP_LEFT;
		openfl.Lib.current.stage.scaleMode = openfl.display.StageScaleMode.NO_SCALE;
		
		var hasMain = false;
		
		for (methodName in Type.getClassFields (Main)) {
			
			if (methodName == "main") {
				
				hasMain = true;
				break;
				
			}
			
		}
		
		if (hasMain) {
			
			Reflect.callMethod (Main, Reflect.field (Main, "main"), []);
			
		} else {
			
			var instance:DocumentClass = Type.createInstance (DocumentClass, []);
			
			if (Std.is (instance, openfl.display.DisplayObject)) {
				
				openfl.Lib.current.addChild (cast instance);
				
			}
			
		}
		
		openfl.Lib.current.stage.dispatchEvent (new openfl.events.Event (openfl.events.Event.RESIZE, false, false));
		
	}
	
	
	#if neko
	@:noCompletion public static function __init__ () {
		
		var loader = new neko.vm.Loader (untyped $loader);
		loader.addPath (haxe.io.Path.directory (Sys.executablePath ()));
		loader.addPath ("./");
		loader.addPath ("@executable_path/");
		
	}
	#end
	
	
}


#if flash @:build(DocumentClass.buildFlash())
#else @:build(DocumentClass.build()) #end
@:keep class DocumentClass extends Main {}


#else


import haxe.macro.Context;
import haxe.macro.Expr;


class DocumentClass {
	
	
	macro public static function build ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				
				var method = macro {
					
					this.stage = flash.Lib.current.stage;
					super ();
					dispatchEvent (new openfl.events.Event (openfl.events.Event.ADDED_TO_STAGE, false, false));
					
				}
				
				fields.push ({ name: "new", access: [ APublic ], kind: FFun({ args: [], expr: method, params: [], ret: macro :Void }), pos: Context.currentPos () });
				
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
	macro public static function buildFlash ():Array<Field> {
		
		var classType = Context.getLocalClass ().get ();
		var searchTypes = classType;
		
		while (searchTypes.superClass != null) {
			
			if (searchTypes.pack.length == 2 && searchTypes.pack[1] == "display" && searchTypes.name == "DisplayObject") {
				
				var fields = Context.getBuildFields ();
				var method = macro {
					return flash.Lib.current.stage;
				}
				
				fields.push ({ name: "get_stage", access: [ APrivate ], meta: [ { name: ":getter", params: [ macro stage ], pos: Context.currentPos() } ], kind: FFun({ args: [], expr: method, params: [], ret: macro :flash.display.Stage }), pos: Context.currentPos() });
				return fields;
				
			}
			
			searchTypes = searchTypes.superClass.t.get ();
			
		}
		
		return null;
		
	}
	
	
}


#end
