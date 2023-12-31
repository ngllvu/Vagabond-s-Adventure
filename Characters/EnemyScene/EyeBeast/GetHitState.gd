extends State

class_name EyeBeastGetHit

@export var boss_health : EyeBeastHealth
@export var dead_state : State
@export var dead_animation : String = "dead"
@export var get_hit_animation : String = "get_hit"


func _ready():
	boss_health.connect("on_hit", on_boss_health_hit)

func _process(delta):
	pass

func on_boss_health_hit(node: Node, dmg_amount : int):
	if boss_health.health > 0:
		emit_signal("interrupt_state", self)
		playback.travel(get_hit_animation)
	else :
		emit_signal("interrupt_state", dead_state)
		playback.travel(dead_animation)
