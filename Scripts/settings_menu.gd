extends Control

var meni = 0
const maxmeni = 3
@export var cmi : bool
var adjst = false

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$Exit.label_settings.font_color = Color(Color.WHITE)
	$MusicVol.label_settings.font_color = Color(Color.WHITE)
	$Border.label_settings.font_color = Color(Color.WHITE)
	$BattleSong.label_settings.font_color = Color(Color.WHITE)
	$MusicVol.text = "Master Volume: " + str(Global.MusicVol)
	$Border.text = "Border: " + str(Global.border)
	$BattleSong.text = "Battle Music: " + str(Global.battletheme)
	
	if Input.is_action_just_pressed("Down") and cmi and meni != maxmeni:
		meni += 1
		$"../Sounds/SndMenumove".play()
		print(meni)
	elif Input.is_action_just_pressed("Up") and cmi and meni != 0:
		meni -= 1
		$"../Sounds/SndMenumove".play()
		print(meni)
	elif Input.is_action_just_pressed("Accept") and cmi:
		match meni:
			0:
				cmi = false
				$"../Sounds/SndSelect".play()
				hide()
				$"../Main Menu".show()
				$"..".cnmi = true
				$"../Sounds/MusOptionsFall".stop()
				$"../Sounds/Menu".stream_paused = false
			1:
				$"../Sounds/SndSelect".play()
				cmi = false
				adjst = true
			2:
				$"../Sounds/SndSelect".play()
				cmi = false
				adjst = true
			3:
				pass
	elif Input.is_action_just_pressed("Left") and adjst:
		match meni:
			1:
				if Global.border != 0:
					Global.border -= 1
			2:
				if Global.MusicVol != 0:
					Global.MusicVol -= .1
			3:
				pass
				
	elif Input.is_action_just_pressed("Right") and adjst:
		match meni:
			1:
				if Global.border != 6:
					Global.border += 1
			2:
				if Global.MusicVol != 2:
					Global.MusicVol += .1
			3:
				pass
	elif Input.is_action_just_pressed("Back") and adjst:
		adjst = false
		cmi = true
		
	match meni:
		0:
			$Exit.label_settings.font_color = Color(Color.YELLOW)
		1:
			$Border.label_settings.font_color = Color(Color.YELLOW)
		2:
			$MusicVol.label_settings.font_color = Color(Color.YELLOW)
		3:
			$BattleSong.label_settings.font_color = Color(Color.YELLOW)
			
