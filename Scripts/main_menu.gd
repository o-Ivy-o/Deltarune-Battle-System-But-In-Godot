extends Control

var meni : int = 0
var hi : int = 2
var li : int = 0
var cnmi : bool = true
@onready var MenuTheme = $Sounds/Menu
@onready var SettingsTheme = $Sounds/MusOptionsFall

#when scene gets created
func _ready() -> void:
	MenuTheme.play()
	MenuTheme.volume_linear = 1
	showmenu()


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
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
	match meni:
		0:
			$Start.label_settings.font_color = Color(Color.YELLOW)
			$Settings.label_settings.font_color = Color(Color.WHITE)
			$Exit.label_settings.font_color = Color(Color.WHITE)
		1:
			$Settings.label_settings.font_color = Color(Color.YELLOW)
			$Start.label_settings.font_color = Color(Color.WHITE)
			$Exit.label_settings.font_color = Color(Color.WHITE)
		2:
			$Exit.label_settings.font_color = Color(Color.YELLOW)
			$Start.label_settings.font_color = Color(Color.WHITE)
			$Settings.label_settings.font_color = Color(Color.WHITE)



func showmenu():
	$Title1.visible = true
	$Title2.visible = true
	$Start.visible = true
	$Settings.visible = true
	$Exit.visible = true
	
func hidemenu():
	$Title1.visible = false
	$Title2.visible = false
	$Start.visible = false
	$Settings.visible = false
	$Exit.visible = false

func hidesettings():
	$"Settings Menu/Tobydog".visible = false
	$"Settings Menu/AUDIO".visible = false
	$"Settings Menu/Title".visible = false
	$"Settings Menu/BattleSong".visible = false
	$"Settings Menu/MusicVol".visible = false
	$"Settings Menu/Border".visible = false
	$"Settings Menu/Exit".visible = false
	$"Settings Menu/VISUAL".visible = false
	
func showsettings():
	$"Settings Menu/Tobydog".visible = true
	$"Settings Menu/AUDIO".visible = true
	$"Settings Menu/Title".visible = true
	$"Settings Menu/BattleSong".visible = true
	$"Settings Menu/MusicVol".visible = true
	$"Settings Menu/Border".visible = true
	$"Settings Menu/Exit".visible = true
	$"Settings Menu/VISUAL".visible = true
	
