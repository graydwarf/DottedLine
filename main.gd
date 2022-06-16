extends Node2D

onready var _dotScene = preload("res://scenes/dot/dot.tscn")
onready var _previousDot = $FirstDot

func CreateDotAtPosition(mousePosition):
	var dot = _dotScene.instance()
	$DotContainer.add_child(dot)
	dot.global_position = mousePosition
	return dot

func DrawLine(newDot):
	var line = Line2D.new()
	line.texture = load("res://assets/dotted-line/dotted-line.png")
	line.texture_mode = Line2D.LINE_TEXTURE_TILE
	var poolVectorArray : PoolVector2Array = []
	poolVectorArray.append(_previousDot.position)
	poolVectorArray.append(newDot.position)
	line.points = poolVectorArray
	line.self_modulate = Color(0.61, 0.41, 0.0, 1.0)
	$LineContainer.add_child(line)
	_previousDot = newDot

func ProcessMouseClick(mousePosition):
	var dot = CreateDotAtPosition(mousePosition)
	DrawLine(dot)

func Reset():
	for line in $LineContainer.get_children():
		line.queue_free()
	
	for dot in $DotContainer.get_children():
		dot.queue_free()

	# Note: FirstDot never gets added to the DotContainer so it remains.
	_previousDot = $FirstDot
		
func _on_Area2D_input_event(viewport, event, shape_idx):
	if event is InputEventMouseButton and event.button_index == BUTTON_LEFT and event.is_pressed():
		ProcessMouseClick(event.global_position)

func _on_Button_pressed():
	Reset()
