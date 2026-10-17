extends Control

var dialogue : Array = ["      Beware of Bugs"," Proceed at your own risk"]
var curtxtp = 0
var mxtxtp = dialogue.size() -1
var caninteract = true
@export var mainscene : PackedScene

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Text.visible_characters = 0
	$Type.start()

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Text.text = dialogue.get(curtxtp)
	if Input.is_action_just_pressed("Accept"):
		if $Text.visible_ratio >= 1 and curtxtp < mxtxtp and caninteract:
			curtxtp += 1
			$Text.visible_characters = 0
			$Type.start()
		elif $Text.visible_ratio >= 1 and curtxtp == mxtxtp and caninteract:
			$Text.visible = false
			var main_menu = mainscene.instantiate()
			add_child(main_menu)
			caninteract = false

func _on_type_timeout() -> void:
	if $Text.visible_ratio < 1:
		$Text.visible_characters += 1
		$AudioHandler/Sounds/SndTxtnoe.play()
		$AudioHandler/Sounds/SndTxtnoe.pitch_scale = randf_range(0.95,1.05)
	else:
		$Type.stop()
