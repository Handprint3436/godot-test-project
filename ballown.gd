extends CharacterBody2D

@onready var hurtbox = $Hurtbox

func _ready():
	hurtbox.body_entered.connect(_on_hurtbox_body_entered)

func _physics_process(delta):
	var input_vector = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = input_vector * 100.0
	move_and_slide()

func _on_hurtbox_body_entered(body):
	Events.ballon_popped.emit()
	queue_free()
