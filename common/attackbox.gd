class_name AttackBox
extends Area2D


func _init() -> void:
	collision_layer = 0
	collision_mask = 128


func _ready() -> void:
	connect("area_entered", _on_area_entered)


func _on_area_entered(hurtbox: HurtBox) -> void:
	pass
