extends Panel

var player
var chase = false
var speed = 500
var detect = false
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _process(delta: float) -> void:
	pass

func _on_gui_input(event: InputEvent) -> void:
	var xd = position.x
	var yd = position.y
	if event is InputEventScreenDrag:
		position += event.relative
		detect = true
	else:
		detect = false
	if chase == true:
		detect = true
		player = $"../../.."
		var direction = (player.position - self.position).normalized()
		if direction.x > 0:
			self.position.x = player.position.x + 533
			self.position.y = player.position.y - 370
		else:
			self.position.x = player.position.x + 533
			self.position.y = player.position.y - 370
	detect = false
func _on_area_2d_body_entered(body: Node2D) -> void:
	if body.name == "player":
		chase = true
	else:
		chase = false

func _on_det_area_entered(area: Area2D) -> void:
	if detect == false && chase == false:
		await get_tree().create_timer(2).timeout
		position.y = 9
		position.x = 500
	else:
		position.x = position.x
