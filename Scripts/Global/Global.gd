extends Node

var fs : bool = false
var battletheme : AudioStreamPlayer
var border : Sprite2D

func _ready() -> void:
	var screensize = DisplayServer.window_get_size()
	DisplayServer.window_set_size(Vector2(screensize.x * 3.5,screensize.y * 3.5))
	get_window().move_to_center()


func _process(delta: float) -> void:
	if Input.is_action_just_pressed("fullscreen"):
		if fs == false:
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_EXCLUSIVE_FULLSCREEN)
			fs = true
		else: 
			DisplayServer.window_set_mode(DisplayServer.WINDOW_MODE_WINDOWED)
			get_window().move_to_center()
			fs = false
