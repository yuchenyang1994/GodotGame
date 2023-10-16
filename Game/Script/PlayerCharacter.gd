extends CharacterBody3D

@onready var visual:Node3D = $VisualNode
@onready var animationPlayer: AnimationPlayer = $VisualNode/AnimationPlayer

@onready var footStepVFX:GPUParticles3D = $VisualNode/VFX/Footstep_GPUParticles3D

var direction: Vector3
var slideKey_pressed: bool
var attackKey_pressed: bool

const SPEED = 5.0

var coinNumber: int:
	set(new_value):
		coinNumber = new_value
		emit_signal("coinNumberUpdated", coinNumber)

signal coinNumberUpdated(newValue)

func _physics_process(delta):
	if not is_on_floor():
		velocity.y -= 1

	var input_dir = Input.get_vector("Left", "Right", "Up", "Down")
	direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	slideKey_pressed = Input.is_action_just_pressed("Slide")
	attackKey_pressed = Input.is_action_just_pressed("Attack")

	move_and_slide()

func AddCoin(value: int):
	coinNumber += value
	# print(coinNumber)