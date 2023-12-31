extends Area2D

@export var main : ChainBot
@export var damage : int = 50
@export var facing_collision : CollDirect

func _ready():
	monitoring = false
	main.connect("facing_direction", _on_main_facing_direction)

func _process(delta):
	pass

func _on_body_entered(body):
	for child in body.get_children():
		if child is Main:
			child.hit(damage)

func _on_main_facing_direction(facing_right : bool):
	if facing_right:
		facing_collision.position = facing_collision.facing_right
	else :
		facing_collision.position = facing_collision.facing_left
