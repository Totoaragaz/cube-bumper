class_name UI

extends Control

@export var box : VBoxContainer
@export var base_label : PackedScene

func add_label(index : int, hp : int):
	var new_label = base_label.instantiate()
	new_label.text = "Player " + str(index + 1) + ": " + str(hp)
	box.add_child(new_label)

func update_label(index : int, hp : int):
	box.get_child(index).text = "Player " + str(index + 1) + ": " + str(hp)
