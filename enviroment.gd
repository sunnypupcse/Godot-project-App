extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.get_action_strength("right"):
		var player = $player
		player.position.x += 300 * delta


func _on_button_pressed() -> void:
	get_tree().quit()
