
extends KinematicBody2D

export (PackedScene) var cross_scene

var is_exit = false
var hited = true
var hited2 = true
var vis

func _ready():
	set_fixed_process(true)
	vis = get_node("vis")

func _fixed_process(delta):
	if !is_exit:
		move(Vector2(-30, 0))

func make_cross(color = Color(1,1,1,1)):
	var cross = cross_scene.instance()
	get_parent().add_child(cross)
	cross.set_modulate(color)
	cross.set_global_pos(get_global_pos())
	

