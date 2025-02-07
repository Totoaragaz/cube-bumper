extends Node

@export var ui : UI

var players : Array[Player]

var index_counter := 0

func _ready() -> void:
	for child in get_children():
		if child is Player:
			child.index = index_counter 
			index_counter += 1
			child.player_collision.connect(solve_collision)
			child.position = Vector2(randf_range(-200, 200), randf_range(-200, 200))
			ui.add_label(child.index, child.health)

func solve_collision(p1 : Player, p2 : Player) -> void:
	if 2 * abs(p1.position.x - p2.position.x) < p1.collision_shape.scale.x * 100 + p2.collision_shape.scale.x * 100 - 5:
		#Vertical Collision
		if p1.position.y > p2.position.y:
			#P1 is below
			if p1.edge_up.visible:
				damage(p2)

		else:
			#P1 is above
			if p1.edge_down.visible:
				damage(p2)
		
	else:
		#Horizontal Collision
		if p1.position.x > p2.position.x:
			#P1 is right
			if p1.edge_left.visible:
				damage(p2)

		else:
			#P1 is left
			if p1.edge_right.visible:
				damage(p2)

func damage(player : Player):
	player.take_damage()
	ui.update_label(player.index, player.health)
