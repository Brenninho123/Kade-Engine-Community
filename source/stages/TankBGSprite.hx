package stages;

import flixel.FlxSprite;
import flixel.FlxG;

class TankBGSprite extends FlxSprite
{
	public var idleAnim:String = null;

	override public function new(image:String, x:Float = 0, y:Float = 0, scrollX:Float = 1, scrollY:Float = 1, animations:Array<String> = null,
			loopAnims:Bool = false)
	{
		super(x, y);

		if (animations != null)
		{
			frames = Paths.getSparrowAtlas(image);
			for (anim in animations)
			{
				animation.addByPrefix(anim, anim, 24, loopAnims);
				animation.play(anim);
				if (idleAnim == null)
					idleAnim = anim;
			}
		}
		else
		{
			loadGraphic(Paths.image(image));
			active = false;
		}
		scrollFactor.set(scrollX, scrollY);
		antialiasing = FlxG.save.data.antialiasing;
	}

	public function dance()
	{
		if (idleAnim != null)
			animation.play(idleAnim);
	}
}
        #if android
	addVirtualPad(FULL, A_B);
        #end

	//if you want it to have a camera
        #if android
	addPadCamera();
        #end

	//in states, those needs to be added before super.create();
	//in substates, in fuction new at the last line add those

	//on Playstate.hx after all
	//obj.camera = ...
	//add
        #if android
	addAndroidControls();
        #end

	//to make the controls visible the code is
	#if android
	androidc.visible = true;
	#end

	//to make the controls invisible the code is
	#if android
	androidc.visible = false;
	#end
