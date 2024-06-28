class_name Block
extends RigidBody2D


@export var health := 1
@export var value := 1


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func get_value() -> int:
	return value


func is_alive() -> bool:
	return health > 0


func _receive_damage(damage: int) -> void:
	self.health = self.health - damage
	if health <= 0:
		self.queue_free()
