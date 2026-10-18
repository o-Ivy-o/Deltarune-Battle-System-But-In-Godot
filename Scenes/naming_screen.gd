extends Control

@onready var Letters : Array = $"Letters/Line 1".get_children() + $"Letters/Line 2".get_children()
var lidx = 0
var lidy = 0
@export var cmi : bool = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	print(Letters)
	$Name.text = Global.PlayerName


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for i in Letters:
		i.modulate = Color(Color.WHITE)
	var slctl = Letters.get(lidx)
	slctl.modulate = Color(Color.YELLOW)
	
	if Input.is_action_just_pressed("Right") and cmi:
		match lidy:
			0:
				if lidx < 13:
					lidx += 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
			1:
				if lidx < Letters.size()-1:
					lidx += 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
	elif Input.is_action_just_pressed("Left") and cmi:
		match lidy:
			0:
				if lidx > 0:
					lidx -= 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
			1:
				if lidx > 14:
					lidx -= 1
					$"../AudioHandler/Sounds/SndMenumove".play()
				else:
					$"../AudioHandler/Sounds/SndCantselect".play()
	elif Input.is_action_just_pressed("Down") and cmi:
		if lidy < 1:
			lidy += 1
			lidx = 14
			$"../AudioHandler/Sounds/SndMenumove".play()
		else:
			$"../AudioHandler/Sounds/SndCantselect".play()
	elif Input.is_action_just_pressed("Up") and cmi:
		
		if lidy == 1:
			lidy -= 1
			lidx = 0
			$"../AudioHandler/Sounds/SndMenumove".play()
		else:
			$"../AudioHandler/Sounds/SndCantselect".play()
	elif Input.is_action_just_pressed("Accept") and cmi:
		var name = $Name.text
		var chars = $Name.get_total_character_count()
		if chars < 6:
			name = name + slctl.text
			print("addletter")
			$Name.text = name
			$"../AudioHandler/Sounds/SndSelect".play()
		else:
			name = name.substr(0,5) + slctl.text
			$Name.text = name
			$"../AudioHandler/Sounds/SndSelect".play()
	elif Input.is_action_just_pressed("Back") and cmi:
		var name = $Name.text
		var chars = $Name.get_total_character_count()
		
		if chars > 0:
			name = name.substr(0, name.length() - 1)
			$Name.text = name
	elif Input.is_action_just_pressed("ConfirmName") and cmi:
		cmi = false
		$"../Transition".play("Transition")
		Global.PlayerName = $Name.text
		Global.SetName = true
		
