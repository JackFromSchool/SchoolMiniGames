extends Sprite2D

var drag = false
@onready var o = $"../Outline2"
var done = false
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var vec = get_viewport().get_mouse_position() - position 
	if drag == true && done == false:
		vec = vec.normalized() * delta * 1000 
		position += vec 
	if position.x > 967 && position.x < 977 && position.y > 428 && position.y < 528:
		done = true
	if done == true:
		drag = false
		o.visible = false
		if !position.y > 528 && !position.y > 526:
			position.y -= -2
func _input(event):
	if done == false:
		if Input.is_action_pressed("mousedown"):
			if get_rect().has_point(to_local(event.position)):
				drag = true
				o.visible = true
		else:
			drag = false
			o.visible = false
	
