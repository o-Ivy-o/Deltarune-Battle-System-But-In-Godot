extends CanvasLayer

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	$"0".visible = false
	$"1".visible = false
	$"2".visible = false
	$"3".visible = false
	$"4".visible = false
	$"5".visible = false
	match Global.border:
		0:
			$"0".visible = true
		1:
			$"1".visible = true
		2:
			$"2".visible = true
		3:
			$"3".visible = true
		4:
			$"4".visible = true
		5:
			$"5".visible = true
