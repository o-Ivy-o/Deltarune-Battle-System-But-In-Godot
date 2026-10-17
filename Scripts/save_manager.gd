extends Node

const savepath = "user://settings.dat"
var MusicVol = Global.MusicVol
var Border = Global.border
var BattleTheme = Global.BattleTheme


func _process(delta: float) -> void:
	MusicVol = Global.MusicVol
	Border = Global.border
	BattleTheme = Global.BattleTheme


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	load_save()
	print("attempting to load")



func save():
	
	var settings = {
		"v" = MusicVol,
		"b" = Border,
		"t" = BattleTheme
	}
	
	var save = FileAccess.open(savepath,FileAccess.WRITE)
	save.store_var(settings)
	save.close()
	print("saved")

func load_save():
	if FileAccess.file_exists(savepath):
		print("filefound")
		var save = FileAccess.open(savepath,FileAccess.READ)
		var loadedsettings = save.get_var()
		save.close()
		
		if loadedsettings.b > Global.GlobalMaxBorder or loadedsettings.b < 0:
			loadedsettings.b = 0
		if loadedsettings.v > 2:
			loadedsettings.v = 2
		elif loadedsettings.v < 0:
			loadedsettings.v = 0
		#if loadedsettings.t > Global.MaxBattleTheme:
			#loadedsettings.t = Global.MaxBattleTheme
		Global.MusicVol = loadedsettings.v
		Global.border = loadedsettings.b
		Global.BattleTheme = loadedsettings.t
		print("loaded")
		print(Global.MusicVol)
		print(loadedsettings.v)
	else:
		print("nosave")
