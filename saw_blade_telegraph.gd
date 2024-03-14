extends Node2D

const SawScene = preload("res://saw_blade.tscn")

@onready var arrow_sprite_2d = $ArrowSprite2D
@onready var timer = $Timer

var direction = Vector2.RIGHT.rotated(randf_range(0, TAU))

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	arrow_sprite_2d.rotation = direction.angle()
	timer.timeout.connect(_on_timer_timeout)
	Events.ballon_popped.connect(timer.stop)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta) -> void:
	pass

func _on_timer_timeout():
	Events.saw_blade_added.emit()
	var saw = SawScene.instantiate()
	saw.position = position
	saw.linear_velocity = direction * 50
	get_tree().current_scene.add_child(saw)
	queue_free()
