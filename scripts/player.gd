class_name Player

extends RigidBody2D

signal player_collision

const SPEED = 500

@onready var collision_shape: CollisionShape2D = $CollisionShape2D

@onready var edge_up: MeshInstance2D = %EdgeUp
@onready var edge_down: MeshInstance2D = %EdgeDown
@onready var edge_left: MeshInstance2D = %EdgeLeft
@onready var edge_right: MeshInstance2D = %EdgeRight

var health := 10
var index : int

func _ready() -> void:
	linear_velocity = Vector2(SPEED, 0).rotated(deg_to_rad(randf_range(30,60) + randi_range(0,3) * 90))
	

func shrink():
	collision_shape.scale -= Vector2(0.08, 0.08)


func take_damage():
	shrink()
	health -= 1
	if health == 0:
		queue_free()

func _on_body_entered(body: Node) -> void:
	if body is Player:
		player_collision.emit(self, body)
