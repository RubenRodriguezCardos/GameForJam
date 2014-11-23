package;


import haxe.Timer;
import haxe.Unserializer;
import lime.app.Preloader;
import lime.audio.openal.AL;
import lime.audio.AudioBuffer;
import lime.graphics.Font;
import lime.graphics.Image;
import lime.utils.ByteArray;
import lime.utils.UInt8Array;
import lime.Assets;

#if (sys || nodejs)
import sys.FileSystem;
#end

#if flash
import flash.display.Bitmap;
import flash.display.BitmapData;
import flash.display.Loader;
import flash.events.Event;
import flash.media.Sound;
import flash.net.URLLoader;
import flash.net.URLRequest;
#end


class DefaultAssetLibrary extends AssetLibrary {
	
	
	public var className (default, null) = new Map <String, Dynamic> ();
	public var path (default, null) = new Map <String, String> ();
	public var type (default, null) = new Map <String, AssetType> ();
	
	private var lastModified:Float;
	private var timer:Timer;
	
	
	public function new () {
		
		super ();
		
		#if flash
		
		className.set ("assets/images/Olas1.png", __ASSET__assets_images_olas1_png);
		type.set ("assets/images/Olas1.png", AssetType.IMAGE);
		className.set ("assets/images/Fondo1.png", __ASSET__assets_images_fondo1_png);
		type.set ("assets/images/Fondo1.png", AssetType.IMAGE);
		className.set ("assets/images/Pato1.png", __ASSET__assets_images_pato1_png);
		type.set ("assets/images/Pato1.png", AssetType.IMAGE);
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		className.set ("assets/images/TeclaF2.png", __ASSET__assets_images_teclaf2_png);
		type.set ("assets/images/TeclaF2.png", AssetType.IMAGE);
		className.set ("assets/images/Fondo2.png", __ASSET__assets_images_fondo2_png);
		type.set ("assets/images/Fondo2.png", AssetType.IMAGE);
		className.set ("assets/images/Win1.png", __ASSET__assets_images_win1_png);
		type.set ("assets/images/Win1.png", AssetType.IMAGE);
		className.set ("assets/images/TeclaD2.png", __ASSET__assets_images_teclad2_png);
		type.set ("assets/images/TeclaD2.png", AssetType.IMAGE);
		className.set ("assets/images/Intro.png", __ASSET__assets_images_intro_png);
		type.set ("assets/images/Intro.png", AssetType.IMAGE);
		className.set ("assets/images/TeclaS2.png", __ASSET__assets_images_teclas2_png);
		type.set ("assets/images/TeclaS2.png", AssetType.IMAGE);
		className.set ("assets/images/Lose1.png", __ASSET__assets_images_lose1_png);
		type.set ("assets/images/Lose1.png", AssetType.IMAGE);
		className.set ("assets/images/Level2Int.png", __ASSET__assets_images_level2int_png);
		type.set ("assets/images/Level2Int.png", AssetType.IMAGE);
		className.set ("assets/images/Lose2.png", __ASSET__assets_images_lose2_png);
		type.set ("assets/images/Lose2.png", AssetType.IMAGE);
		className.set ("assets/images/Level1Int.png", __ASSET__assets_images_level1int_png);
		type.set ("assets/images/Level1Int.png", AssetType.IMAGE);
		className.set ("assets/images/Win2.png", __ASSET__assets_images_win2_png);
		type.set ("assets/images/Win2.png", AssetType.IMAGE);
		className.set ("assets/images/TeclaA2.png", __ASSET__assets_images_teclaa2_png);
		type.set ("assets/images/TeclaA2.png", AssetType.IMAGE);
		className.set ("assets/images/Malo1.png", __ASSET__assets_images_malo1_png);
		type.set ("assets/images/Malo1.png", AssetType.IMAGE);
		className.set ("assets/sounds/Bad.mp3", __ASSET__assets_sounds_bad_mp3);
		type.set ("assets/sounds/Bad.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Lose.mp3", __ASSET__assets_sounds_lose_mp3);
		type.set ("assets/sounds/Lose.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Hurt.mp3", __ASSET__assets_sounds_hurt_mp3);
		type.set ("assets/sounds/Hurt.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/S.mp3", __ASSET__assets_sounds_s_mp3);
		type.set ("assets/sounds/S.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/D.mp3", __ASSET__assets_sounds_d_mp3);
		type.set ("assets/sounds/D.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/Laser.mp3", __ASSET__assets_sounds_laser_mp3);
		type.set ("assets/sounds/Laser.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/F.mp3", __ASSET__assets_sounds_f_mp3);
		type.set ("assets/sounds/F.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/A.mp3", __ASSET__assets_sounds_a_mp3);
		type.set ("assets/sounds/A.mp3", AssetType.MUSIC);
		className.set ("assets/music/Level2BG.mp3", __ASSET__assets_music_level2bg_mp3);
		type.set ("assets/music/Level2BG.mp3", AssetType.MUSIC);
		className.set ("assets/music/Level1BG.mp3", __ASSET__assets_music_level1bg_mp3);
		type.set ("assets/music/Level1BG.mp3", AssetType.MUSIC);
		className.set ("assets/music/Menu.mp3", __ASSET__assets_music_menu_mp3);
		type.set ("assets/music/Menu.mp3", AssetType.MUSIC);
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		
		
		#elseif html5
		
		var id;
		id = "assets/images/Olas1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Fondo1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Pato1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/images-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/images/TeclaF2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Fondo2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Win1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TeclaD2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Intro.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TeclaS2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lose1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Level2Int.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Lose2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Level1Int.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Win2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/TeclaA2.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/images/Malo1.png";
		path.set (id, id);
		
		type.set (id, AssetType.IMAGE);
		id = "assets/sounds/Bad.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Lose.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Hurt.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/S.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/sounds-go-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/D.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/Laser.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/F.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/A.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/Level2BG.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/Level1BG.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/Menu.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/music/music-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/data/data-goes-here.txt";
		path.set (id, id);
		
		type.set (id, AssetType.TEXT);
		id = "assets/sounds/beep.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		id = "assets/sounds/flixel.mp3";
		path.set (id, id);
		
		type.set (id, AssetType.MUSIC);
		
		
		#else
		
		#if openfl
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		#end
		
		#if (windows || mac || linux)
		
		/*var useManifest = false;
		
		className.set ("assets/images/Olas1.png", __ASSET__assets_images_olas1_png);
		type.set ("assets/images/Olas1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Fondo1.png", __ASSET__assets_images_fondo1_png);
		type.set ("assets/images/Fondo1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Pato1.png", __ASSET__assets_images_pato1_png);
		type.set ("assets/images/Pato1.png", AssetType.IMAGE);
		
		className.set ("assets/images/images-go-here.txt", __ASSET__assets_images_images_go_here_txt);
		type.set ("assets/images/images-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/images/TeclaF2.png", __ASSET__assets_images_teclaf2_png);
		type.set ("assets/images/TeclaF2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Fondo2.png", __ASSET__assets_images_fondo2_png);
		type.set ("assets/images/Fondo2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Win1.png", __ASSET__assets_images_win1_png);
		type.set ("assets/images/Win1.png", AssetType.IMAGE);
		
		className.set ("assets/images/TeclaD2.png", __ASSET__assets_images_teclad2_png);
		type.set ("assets/images/TeclaD2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Intro.png", __ASSET__assets_images_intro_png);
		type.set ("assets/images/Intro.png", AssetType.IMAGE);
		
		className.set ("assets/images/TeclaS2.png", __ASSET__assets_images_teclas2_png);
		type.set ("assets/images/TeclaS2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lose1.png", __ASSET__assets_images_lose1_png);
		type.set ("assets/images/Lose1.png", AssetType.IMAGE);
		
		className.set ("assets/images/Level2Int.png", __ASSET__assets_images_level2int_png);
		type.set ("assets/images/Level2Int.png", AssetType.IMAGE);
		
		className.set ("assets/images/Lose2.png", __ASSET__assets_images_lose2_png);
		type.set ("assets/images/Lose2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Level1Int.png", __ASSET__assets_images_level1int_png);
		type.set ("assets/images/Level1Int.png", AssetType.IMAGE);
		
		className.set ("assets/images/Win2.png", __ASSET__assets_images_win2_png);
		type.set ("assets/images/Win2.png", AssetType.IMAGE);
		
		className.set ("assets/images/TeclaA2.png", __ASSET__assets_images_teclaa2_png);
		type.set ("assets/images/TeclaA2.png", AssetType.IMAGE);
		
		className.set ("assets/images/Malo1.png", __ASSET__assets_images_malo1_png);
		type.set ("assets/images/Malo1.png", AssetType.IMAGE);
		
		className.set ("assets/sounds/Bad.mp3", __ASSET__assets_sounds_bad_mp3);
		type.set ("assets/sounds/Bad.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Lose.mp3", __ASSET__assets_sounds_lose_mp3);
		type.set ("assets/sounds/Lose.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Hurt.mp3", __ASSET__assets_sounds_hurt_mp3);
		type.set ("assets/sounds/Hurt.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/S.mp3", __ASSET__assets_sounds_s_mp3);
		type.set ("assets/sounds/S.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/sounds-go-here.txt", __ASSET__assets_sounds_sounds_go_here_txt);
		type.set ("assets/sounds/sounds-go-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/D.mp3", __ASSET__assets_sounds_d_mp3);
		type.set ("assets/sounds/D.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/Laser.mp3", __ASSET__assets_sounds_laser_mp3);
		type.set ("assets/sounds/Laser.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/F.mp3", __ASSET__assets_sounds_f_mp3);
		type.set ("assets/sounds/F.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/A.mp3", __ASSET__assets_sounds_a_mp3);
		type.set ("assets/sounds/A.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/Level2BG.mp3", __ASSET__assets_music_level2bg_mp3);
		type.set ("assets/music/Level2BG.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/Level1BG.mp3", __ASSET__assets_music_level1bg_mp3);
		type.set ("assets/music/Level1BG.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/Menu.mp3", __ASSET__assets_music_menu_mp3);
		type.set ("assets/music/Menu.mp3", AssetType.MUSIC);
		
		className.set ("assets/music/music-goes-here.txt", __ASSET__assets_music_music_goes_here_txt);
		type.set ("assets/music/music-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/data/data-goes-here.txt", __ASSET__assets_data_data_goes_here_txt);
		type.set ("assets/data/data-goes-here.txt", AssetType.TEXT);
		
		className.set ("assets/sounds/beep.mp3", __ASSET__assets_sounds_beep_mp3);
		type.set ("assets/sounds/beep.mp3", AssetType.MUSIC);
		
		className.set ("assets/sounds/flixel.mp3", __ASSET__assets_sounds_flixel_mp3);
		type.set ("assets/sounds/flixel.mp3", AssetType.MUSIC);
		*/
		var useManifest = true;
		
		if (useManifest) {
			
			loadManifest ();
			
			if (Sys.args ().indexOf ("-livereload") > -1) {
				
				var path = FileSystem.fullPath ("manifest");
				lastModified = FileSystem.stat (path).mtime.getTime ();
				
				timer = new Timer (2000);
				timer.run = function () {
					
					var modified = FileSystem.stat (path).mtime.getTime ();
					
					if (modified > lastModified) {
						
						lastModified = modified;
						loadManifest ();
						
						if (eventCallback != null) {
							
							eventCallback (this, "change");
							
						}
						
					}
					
				}
				
			}
			
		}
		
		#else
		
		loadManifest ();
		
		#end
		#end
		
	}
	
	
	public override function exists (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var assetType = this.type.get (id);
		
		if (assetType != null) {
			
			if (assetType == requestedType || ((requestedType == SOUND || requestedType == MUSIC) && (assetType == MUSIC || assetType == SOUND))) {
				
				return true;
				
			}
			
			#if flash
			
			if ((assetType == BINARY || assetType == TEXT) && requestedType == BINARY) {
				
				return true;
				
			} else if (path.exists (id)) {
				
				return true;
				
			}
			
			#else
			
			if (requestedType == BINARY || requestedType == null || (assetType == BINARY && requestedType == TEXT)) {
				
				return true;
				
			}
			
			#end
			
		}
		
		return false;
		
	}
	
	
	public override function getAudioBuffer (id:String):AudioBuffer {
		
		#if flash
		
		var buffer = new AudioBuffer ();
		buffer.src = cast (Type.createInstance (className.get (id), []), Sound);
		return buffer;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return AudioBuffer.fromFile (path.get (id));
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, type.get (id) == MUSIC);
		
		#end
		
	}
	
	
	public override function getBytes (id:String):ByteArray {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), ByteArray);
		
		#elseif html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			bytes = new ByteArray ();
			bytes.writeUTFBytes (data);
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes;
			
		} else {
			
			return null;
		}
		
		#else
		
		//return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), ByteArray);
		//else 
		return ByteArray.readFile (path.get (id));
		
		#end
		
	}
	
	
	public override function getFont (id:String):Dynamic /*Font*/ {
		
		// TODO: Complete Lime Font API
		
		#if openfl
		#if (flash || js)
		
		return cast (Type.createInstance (className.get (id), []), openfl.text.Font);
		
		#else
		
		if (className.exists (id)) {
			
			var fontClass = className.get (id);
			openfl.text.Font.registerFont (fontClass);
			return cast (Type.createInstance (fontClass, []), openfl.text.Font);
			
		} else {
			
			return new openfl.text.Font (path.get (id));
			
		}
		
		#end
		#end
		
		return null;
		
	}
	
	
	public override function getImage (id:String):Image {
		
		#if flash
		
		return Image.fromBitmapData (cast (Type.createInstance (className.get (id), []), BitmapData));
		
		#elseif html5
		
		return Image.fromImageElement (Preloader.images.get (path.get (id)));
		
		#else
		
		return Image.fromFile (path.get (id));
		
		#end
		
	}
	
	
	/*public override function getMusic (id:String):Dynamic {
		
		#if flash
		
		return cast (Type.createInstance (className.get (id), []), Sound);
		
		#elseif openfl_html5
		
		//var sound = new Sound ();
		//sound.__buffer = true;
		//sound.load (new URLRequest (path.get (id)));
		//return sound;
		return null;
		
		#elseif html5
		
		return null;
		//return new Sound (new URLRequest (path.get (id)));
		
		#else
		
		return null;
		//if (className.exists(id)) return cast (Type.createInstance (className.get (id), []), Sound);
		//else return new Sound (new URLRequest (path.get (id)), null, true);
		
		#end
		
	}*/
	
	
	public override function getPath (id:String):String {
		
		//#if ios
		
		//return SystemPath.applicationDirectory + "/assets/" + path.get (id);
		
		//#else
		
		return path.get (id);
		
		//#end
		
	}
	
	
	public override function getText (id:String):String {
		
		#if html5
		
		var bytes:ByteArray = null;
		var data = Preloader.loaders.get (path.get (id)).data;
		
		if (Std.is (data, String)) {
			
			return cast data;
			
		} else if (Std.is (data, ByteArray)) {
			
			bytes = cast data;
			
		} else {
			
			bytes = null;
			
		}
		
		if (bytes != null) {
			
			bytes.position = 0;
			return bytes.readUTFBytes (bytes.length);
			
		} else {
			
			return null;
		}
		
		#else
		
		var bytes = getBytes (id);
		
		if (bytes == null) {
			
			return null;
			
		} else {
			
			return bytes.readUTFBytes (bytes.length);
			
		}
		
		#end
		
	}
	
	
	public override function isLocal (id:String, type:String):Bool {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		
		#if flash
		
		if (requestedType != AssetType.MUSIC && requestedType != AssetType.SOUND) {
			
			return className.exists (id);
			
		}
		
		#end
		
		return true;
		
	}
	
	
	public override function list (type:String):Array<String> {
		
		var requestedType = type != null ? cast (type, AssetType) : null;
		var items = [];
		
		for (id in this.type.keys ()) {
			
			if (requestedType == null || exists (id, type)) {
				
				items.push (id);
				
			}
			
		}
		
		return items;
		
	}
	
	
	public override function loadAudioBuffer (id:String, handler:AudioBuffer -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getAudioBuffer (id));
			
		//}
		
		#else
		
		handler (getAudioBuffer (id));
		
		#end
		
	}
	
	
	public override function loadBytes (id:String, handler:ByteArray -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bytes = new ByteArray ();
				bytes.writeUTFBytes (event.currentTarget.data);
				bytes.position = 0;
				
				handler (bytes);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getBytes (id));
			
		}
		
		#else
		
		handler (getBytes (id));
		
		#end
		
	}
	
	
	public override function loadImage (id:String, handler:Image -> Void):Void {
		
		#if flash
		
		if (path.exists (id)) {
			
			var loader = new Loader ();
			loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event:Event) {
				
				var bitmapData = cast (event.currentTarget.content, Bitmap).bitmapData;
				handler (Image.fromBitmapData (bitmapData));
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getImage (id));
			
		}
		
		#else
		
		handler (getImage (id));
		
		#end
		
	}
	
	
	#if (!flash && !html5)
	private function loadManifest ():Void {
		
		try {
			
			#if blackberry
			var bytes = ByteArray.readFile ("app/native/manifest");
			#elseif tizen
			var bytes = ByteArray.readFile ("../res/manifest");
			#elseif emscripten
			var bytes = ByteArray.readFile ("assets/manifest");
			#else
			var bytes = ByteArray.readFile ("manifest");
			#end
			
			if (bytes != null) {
				
				bytes.position = 0;
				
				if (bytes.length > 0) {
					
					var data = bytes.readUTFBytes (bytes.length);
					
					if (data != null && data.length > 0) {
						
						var manifest:Array<Dynamic> = Unserializer.run (data);
						
						for (asset in manifest) {
							
							if (!className.exists (asset.id)) {
								
								path.set (asset.id, asset.path);
								type.set (asset.id, cast (asset.type, AssetType));
								
							}
							
						}
						
					}
					
				}
				
			} else {
				
				trace ("Warning: Could not load asset manifest (bytes was null)");
				
			}
		
		} catch (e:Dynamic) {
			
			trace ('Warning: Could not load asset manifest (${e})');
			
		}
		
	}
	#end
	
	
	/*public override function loadMusic (id:String, handler:Dynamic -> Void):Void {
		
		#if (flash || js)
		
		//if (path.exists (id)) {
			
		//	var loader = new Loader ();
		//	loader.contentLoaderInfo.addEventListener (Event.COMPLETE, function (event) {
				
		//		handler (cast (event.currentTarget.content, Bitmap).bitmapData);
				
		//	});
		//	loader.load (new URLRequest (path.get (id)));
			
		//} else {
			
			handler (getMusic (id));
			
		//}
		
		#else
		
		handler (getMusic (id));
		
		#end
		
	}*/
	
	
	public override function loadText (id:String, handler:String -> Void):Void {
		
		//#if html5
		
		/*if (path.exists (id)) {
			
			var loader = new URLLoader ();
			loader.addEventListener (Event.COMPLETE, function (event:Event) {
				
				handler (event.currentTarget.data);
				
			});
			loader.load (new URLRequest (path.get (id)));
			
		} else {
			
			handler (getText (id));
			
		}*/
		
		//#else
		
		var callback = function (bytes:ByteArray):Void {
			
			if (bytes == null) {
				
				handler (null);
				
			} else {
				
				handler (bytes.readUTFBytes (bytes.length));
				
			}
			
		}
		
		loadBytes (id, callback);
		
		//#end
		
	}
	
	
}


#if !display
#if flash

@:keep @:bind #if display private #end class __ASSET__assets_images_olas1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fondo1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_pato1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_images_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_images_teclaf2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_fondo2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_win1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_teclad2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_intro_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_teclas2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lose1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_level2int_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_lose2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_level1int_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_win2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_teclaa2_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_images_malo1_png extends flash.display.BitmapData { public function new () { super (0, 0, true, 0); } }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_bad_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_lose_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_hurt_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_s_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_sounds_go_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_d_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_laser_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_f_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_a_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_level2bg_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_level1bg_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_menu_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_music_music_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_data_data_goes_here_txt extends flash.utils.ByteArray { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_beep_mp3 extends flash.media.Sound { }
@:keep @:bind #if display private #end class __ASSET__assets_sounds_flixel_mp3 extends flash.media.Sound { }


#elseif html5

#if openfl


































#end

#else

#if openfl

#end

#if (windows || mac || linux)

//
//@:bitmap("assets/images/Olas1.png") class __ASSET__assets_images_olas1_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Fondo1.png") class __ASSET__assets_images_fondo1_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Pato1.png") class __ASSET__assets_images_pato1_png extends openfl.display.BitmapData {}
//@:file("assets/images/images-go-here.txt") class __ASSET__assets_images_images_go_here_txt extends lime.utils.ByteArray {}
//@:bitmap("assets/images/TeclaF2.png") class __ASSET__assets_images_teclaf2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Fondo2.png") class __ASSET__assets_images_fondo2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Win1.png") class __ASSET__assets_images_win1_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/TeclaD2.png") class __ASSET__assets_images_teclad2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Intro.png") class __ASSET__assets_images_intro_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/TeclaS2.png") class __ASSET__assets_images_teclas2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Lose1.png") class __ASSET__assets_images_lose1_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Level2Int.png") class __ASSET__assets_images_level2int_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Lose2.png") class __ASSET__assets_images_lose2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Level1Int.png") class __ASSET__assets_images_level1int_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Win2.png") class __ASSET__assets_images_win2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/TeclaA2.png") class __ASSET__assets_images_teclaa2_png extends openfl.display.BitmapData {}
//@:bitmap("assets/images/Malo1.png") class __ASSET__assets_images_malo1_png extends openfl.display.BitmapData {}
//@:sound("assets/sounds/Bad.mp3") class __ASSET__assets_sounds_bad_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/Lose.mp3") class __ASSET__assets_sounds_lose_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/Hurt.mp3") class __ASSET__assets_sounds_hurt_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/S.mp3") class __ASSET__assets_sounds_s_mp3 extends openfl.media.Sound {}
//@:file("assets/sounds/sounds-go-here.txt") class __ASSET__assets_sounds_sounds_go_here_txt extends lime.utils.ByteArray {}
//@:sound("assets/sounds/D.mp3") class __ASSET__assets_sounds_d_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/Laser.mp3") class __ASSET__assets_sounds_laser_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/F.mp3") class __ASSET__assets_sounds_f_mp3 extends openfl.media.Sound {}
//@:sound("assets/sounds/A.mp3") class __ASSET__assets_sounds_a_mp3 extends openfl.media.Sound {}
//@:sound("assets/music/Level2BG.mp3") class __ASSET__assets_music_level2bg_mp3 extends openfl.media.Sound {}
//@:sound("assets/music/Level1BG.mp3") class __ASSET__assets_music_level1bg_mp3 extends openfl.media.Sound {}
//@:sound("assets/music/Menu.mp3") class __ASSET__assets_music_menu_mp3 extends openfl.media.Sound {}
//@:file("assets/music/music-goes-here.txt") class __ASSET__assets_music_music_goes_here_txt extends lime.utils.ByteArray {}
//@:file("assets/data/data-goes-here.txt") class __ASSET__assets_data_data_goes_here_txt extends lime.utils.ByteArray {}
//@:sound("/usr/lib/haxe/lib/flixel/3,3,6/assets/sounds/beep.mp3") class __ASSET__assets_sounds_beep_mp3 extends openfl.media.Sound {}
//@:sound("/usr/lib/haxe/lib/flixel/3,3,6/assets/sounds/flixel.mp3") class __ASSET__assets_sounds_flixel_mp3 extends openfl.media.Sound {}
//
//

#end

#end
#end

