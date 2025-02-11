class_name Block
extends RigidBody2D


@export var health := 1
@export var value := 1


# Called when the node enters the scene tree for the first time.
func _ready():
	Global.g_core_block = self


func get_value() -> int:
	return value


func is_alive() -> bool:
	return health > 0


func _receive_damage(damage: int) -> void:
	health = health - damage
	if health <= 0:
		queue_free()
