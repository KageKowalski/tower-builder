extends Node2D


@export var SimpleEnemy: PackedScene


@onready var start_node_count = self.get_child_count()
@onready var current_node_count: int
@onready var enemies := [SimpleEnemy]
@onready var current_wave := 0
@onready var points: int
@onready var spawn_wait_interval: float
@onready var rng := RandomNumberGenerator.new()


# Called when the node enters the scene tree for the first time.
func _ready():
	$WaveTimer.start(5.0)


func _on_wave_timer_timeout():
	current_node_count = get_child_count()
	if start_node_count == current_node_count and _game_is_active():
		current_wave += 1
		points = ceili(pow(current_wave, 1.1) + (0.5 * current_wave))
		spawn_wait_interval = (4.9 / 0.9) * pow((0.9), current_wave) + 0.10
		$SpawnTimer.start()
	else:
		$WaveTimer.start(5.0)


func _on_spawn_timer_timeout():
	if points > 0:
		var spawn_point := _get_spawn_point()
		var enemy := _purchase_enemy()
		_spawn_enemy(enemy, spawn_point)
		$SpawnTimer.start(spawn_wait_interval)
	else:
		$WaveTimer.start(5.0)


func _game_is_active() -> bool:
	return %CoreBlock.is_alive()


func _get_spawn_point() -> Vector2:
	print("Getting Spawn Point")
	if rng.randf() > 0.5:
		return $SpawnPoint1.global_position
	else:
		return $SpawnPoint2.global_position


func _purchase_enemy() -> Enemy:
	print("Purchasing Enemy")
	var enemy_to_purchase := rng.randi_range(1, ((current_wave - 1) / 5) + 1) - 1
	var purchased_enemy = enemies[enemy_to_purchase].instantiate()
	points -= purchased_enemy.get_value()
	return purchased_enemy


func _spawn_enemy(enemy: Enemy, spawn_point: Vector2) -> void:
	print("Spawning Enemy")
	enemy.global_position = spawn_point
	self.add_child(enemy)
