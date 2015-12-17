
extends Node

var k1
var k2
var b1
var b2
var b3
var a1
var a2
var a3
var pos1
var pos2
var pos3

func _ready():
	set_fixed_process(true)
	k1 = get_node("k1")
	k2 = get_node("k2")
	b1 = get_node("b1")
	b2 = get_node("b2")
	b3 = get_node("b3")
	a1 = get_node("b1/area")
	a2 = get_node("b2/area")
	a3 = get_node("b3/area")
	pos1 = b1.get_global_pos()
	pos2 = b2.get_global_pos()
	pos3 = b3.get_global_pos()
	shoot()

func _fixed_process(delta):
	if !b1.hited2 and a1.get_overlapping_areas().size() > 0:
		b1.hited2 = true
		if a1.get_overlapping_areas().size() > 0:
			b1.make_cross(Color(0, 0,1,1))
	
	if !b1.hited and (a1.get_overlapping_bodies().size() > 0):
		b1.hited = true
		if a1.get_overlapping_bodies().size() > 0:
			b1.make_cross()
	
	if !b2.hited and (a2.get_overlapping_bodies().size() > 0):
		b2.hited = true
		if a2.get_overlapping_bodies().size() > 0:
			b2.make_cross()
	
	if !b3.hited and (a3.get_overlapping_bodies().size() > 0):
		b3.hited = true
		if a3.get_overlapping_bodies().size() > 0:
			b3.make_cross()
	
	if !b1.vis.is_on_screen():
		b1.is_exit = true
	if !b2.vis.is_on_screen():
		b2.is_exit = true
	if !b3.vis.is_on_screen():
		b3.is_exit = true

	if b1.is_exit and b2.is_exit and b3.is_exit:
		if !b1.hited2:
			print("Area not collic")
		shoot()

func shoot():
	b1.set_global_pos(pos1)
	b2.set_global_pos(pos2)
	b3.set_global_pos(pos3)
	
	b1.is_exit = false
	b2.is_exit = false
	b3.is_exit = false
	
	b1.hited = false
	b2.hited = false
	b3.hited = false
	
	b1.hited2 = false
	b2.hited2 = false
	b3.hited2 = false