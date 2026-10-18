extends Control

var dialogue : Array = ["       Hello Player.\n    Before we Proceed.","  Please name the fallen\n          Human."]
var curtxtp = 0
var mxtxtp = dialogue.size() -1
var caninteract = true
@export var mainscene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if Global.SetName:
		gomenu()
		caninteract = false
	else:
		$Text.text = dialogue[curtxtp]
		$Text.visible_characters = 0
		$Type.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_just_pressed("Accept"):
		if $Text.visible_ratio >= 1 and curtxtp < mxtxtp and caninteract:
			curtxtp += 1
			$Text.text = dialogue[curtxtp]
			$Text.visible_characters = 0
			$Type.start()
		elif $Text.visible_ratio >= 1 and curtxtp == mxtxtp and caninteract:
			$Text.visible = false
			caninteract = false
			$NamingScreen.visible = true
			$NamingScreen.cmi = true

func _on_type_timeout() -> void:
	var text = $Text.text
	var totalchar = $Text.get_total_character_count()
	
	while $Text.visible_characters < totalchar:
		var nchar = text.substr($Text.visible_characters,1)
		if nchar not in [" ","\n","\t","\r"]:
			break
		$Text.visible_characters += 1
		
	if $Text.visible_characters < totalchar:
		$Text.visible_characters += 1
		$AudioHandler/Sounds/SndTxtnoe.pitch_scale = randf_range(0.95, 1.05)
		$AudioHandler/Sounds/SndTxtnoe.play()
		
	if $Text.visible_characters >= totalchar:
		$Type.stop()


func gomenu():
	var main_menu = mainscene.instantiate()
	add_child(main_menu)
	$Text.visible = false
	$NamingScreen.visible = false
	$WhiteTransition.visible = false


func _on_transition_animation_finished(anim_name: StringName) -> void:
	gomenu()
	SaveManager.save()
