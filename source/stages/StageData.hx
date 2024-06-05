package stages;

typedef StageData =
{
	var ?staticCam:Bool;
	var ?camZoom:Float;
	var ?camPosition:Array<Float>;
	var ?hasGF:Bool;
	var ?positions:Map<String, Array<Float>>;
	var ?directory:String;
}

class StageJSON
{
	public static function loadJSONFile(stage:String):StageData
	{
		var rawJson = Paths.loadJSON('stages/$stage');
		return parseStage(rawJson);
	}

	public static function parseStage(json:Dynamic):StageData
	{
		var weekData:StageData = cast json;

		return weekData;
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
