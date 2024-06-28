class_name Enemy
extends CharacterBody2D


@export var health := 1
@export var value := 1
@export var speed := 10


@onready var animation := $AnimatedSprite2D


func _ready():
	collision_layer = 0
	collision_mask = 1
	apply_floor_snap()
	animation.play("walk")
	#if global_position.x > 1920:
	#	set_scale(Vector2(-1, 1))


func get_value() -> int:
	return value


func _receive_damage(damage: int) -> void:
	self.health = self.health - damage
	if health <= 0:
		self.queue_free()

func _physics_process(delta):
	var core_block_position: Vector2 = %CoreBlock.get_position()
	var target_position: Vector2 = (core_block_position - self.position) * self.speed
	self.velocity = target_position
	
	if self.position.distance_to(core_block_position) > 3:
		look_at(core_block_position)
		move_and_slide()
