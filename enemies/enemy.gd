class_name Enemy
extends CharacterBody2D


@export var health := 1
@onready var animation := $AnimatedSprite2D


func _ready():
	apply_floor_snap()
	animation.play("walk")
	if global_position.x > 1920:
		set_scale(Vector2(-1, 1))


func _receive_damage(damage: int) -> void:
	self.health = self.health - damage
	if health <= 0:
		self.queue_free()
