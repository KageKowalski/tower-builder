class_name HitBox
extends Area2D


@export var damage := 0


func _init() -> void:
	collision_layer = 0
	collision_mask = 128


func _ready() -> void:
	connect("area_entered", _on_area_entered)


func _on_area_entered(hurtbox: HurtBox) -> void:
	if hurtbox != null and hurtbox.owner.has_method("receive_damage"):
		hurtbox.owner.receive_damage(damage)
