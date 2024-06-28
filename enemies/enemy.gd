class_name Enemy
extends CharacterBody2D


@export var health := 1
@export var value := 1
@export var speed := 10000


@onready var animation := $AnimatedSprite2D


func _ready():
	collision_layer = 0
	collision_mask = 1
	apply_floor_snap()
	animation.play("walk")


func get_value() -> int:
	return value


func _receive_damage(damage: int) -> void:
	health = health - damage
	if health <= 0:
		queue_free()

func _physics_process(delta):
	var core_block_position: Vector2 = Global.g_core_block.get_position()
	velocity = (core_block_position - position).normalized() * speed * delta
	velocity.y += Global.g_gravity * delta
	
	# Point the enemy toward the CoreBlock
	if velocity.x < 0:
		scale.x = scale.y * -1
	else:
		scale.x = scale.y * 1
	
	# Move the enemy toward the CoreBlock
	if position.distance_to(core_block_position) > 3:
		move_and_slide()
