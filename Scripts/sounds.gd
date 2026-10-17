extends Node

func _ready() -> void:
	print("iexist")

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in get_children():
		for s in i.get_children():
			s.volume_linear = Global.MusicVol
