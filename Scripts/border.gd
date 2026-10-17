extends CanvasLayer

@onready var Borders : Array = get_children()

func _ready() -> void:
	Global.GlobalMaxBorder = get_child_count() -1
	print(Global.GlobalMaxBorder)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	for child in get_children():
		child.visible = false
	
	var selectedBorder = Borders.get(Global.border)
	selectedBorder.visible = true
	if selectedBorder.has_meta("BorderName"):
		Global.BorderName = selectedBorder.get_meta("BorderName")
