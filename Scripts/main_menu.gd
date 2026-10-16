extends Control

var meni : int = 0
var hi : int = 2
var li : int = 0
var cnmi : bool = true
@onready var MenuTheme = $Sounds/Menu
@onready var SettingsTheme = $Sounds/MusOptionsFall

#when scene gets created
func _ready() -> void:
	await get_tree().create_timer(.5).timeout
	$LOADING.visible = false
	MenuTheme.play()
	showmenu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	MenuTheme.volume_linear = Global.MusicVol
	SettingsTheme.volume_linear = Global.MusicVol
	$Sounds/MusOptionsFall.volume_linear = Global.MusicVol
	$Sounds/SndCantselect.volume_linear = Global.MusicVol
	$Sounds/SndSelect.volume_linear = Global.MusicVol
	$Sounds/SndMenumove.volume_linear = Global.MusicVol
	if Input.is_action_just_pressed("Down"):
		if meni != hi and cnmi:
			meni += 1
			$Sounds/SndMenumove.play()
			print(meni)
	elif Input.is_action_just_pressed("Up"):
		if meni != li and cnmi:
			meni -= 1
			$Sounds/SndMenumove.play()
			print(meni)
	if Input.is_action_just_pressed("Accept") and cnmi:
		match meni:
			0:
				$Sounds/SndCantselect.play()
				print("not starting battle")
				queue_free()
				$"../DogCheck/InukumaWip".play()
				$"../DogCheck".show()
				cnmi = true
			1:
				$Sounds/SndSelect.play()
				hidemenu()
				showsettings()
				MenuTheme.stream_paused = true
				SettingsTheme.play()
				print("opening settings")
				cnmi = false
			2:
				$Sounds/SndSelect.play()
				cnmi = false
				await $Sounds/SndSelect.finished
				print("closing game")
				get_tree().quit()
	#show selection for main menu
	match meni:
		0:
			$"Main Menu/Start".label_settings.font_color = Color(Color.YELLOW)
			$"Main Menu/Settings".label_settings.font_color = Color(Color.WHITE)
			$"Main Menu/Exit".label_settings.font_color = Color(Color.WHITE)
		1:
			$"Main Menu/Settings".label_settings.font_color = Color(Color.YELLOW)
			$"Main Menu/Start".label_settings.font_color = Color(Color.WHITE)
			$"Main Menu/Exit".label_settings.font_color = Color(Color.WHITE)
		2:
			$"Main Menu/Exit".label_settings.font_color = Color(Color.YELLOW)
			$"Main Menu/Start".label_settings.font_color = Color(Color.WHITE)
			$"Main Menu/Settings".label_settings.font_color = Color(Color.WHITE)



func showmenu():
	$"Main Menu".visible = true
func hidemenu():
	$"Main Menu".visible = false

func hidesettings():
	$"Settings Menu".visible = false
	$"Settings Menu".cmi = false
	
func showsettings():
	$"Settings Menu".visible = true
	await get_tree().create_timer(.1).timeout
	$"Settings Menu".cmi = true
	
