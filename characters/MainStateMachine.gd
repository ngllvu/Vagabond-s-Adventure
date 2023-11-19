extends Node

class_name MainStateMachine

@export var curr_state : State
@export var main : CharacterBody2D
@export var at : AnimationTree
@export var state : Array[State]

func _ready():
	for child in get_children():
		if child is State:
			state.append(child)
			
			child.main = main
			child.playback = at["parameters/playback"]

func check_move():
	return curr_state.can_move


func switch_state(new_state : State):
	if curr_state != null:
		curr_state.on_exit()
		curr_state.next_state = null
		
	curr_state = new_state
	
	curr_state.on_enter()
	
func _input(event: InputEvent):
	curr_state.state_input(event)

func _physics_process(delta):
	if curr_state.next_state != null:
		switch_state(curr_state.next_state)
		
	curr_state.state_process(delta)