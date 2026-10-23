extends Node

@onready var BattleThemes : Array = $BattleThemes.get_children()

func _ready() -> void:
	print("iexist")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	for i in get_children():
		for s in i.get_children():
			s.volume_linear = Global.MusicVol
	
	Global.MaxBattleTheme = $BattleThemes.get_child_count() -1
	
	Global.BattleThemeName = BattleThemes.get(Global.BattleTheme).get_meta("ThemeName")
	
