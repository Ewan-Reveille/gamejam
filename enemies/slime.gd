extends CharacterBody2D

@export var speed = 15
@export var limit = 0.5
@export var endPoint: Marker2D

@onready var animations = $AnimationPlayer
@onready var target = $"../Player"
var startPosition
var endPosition

var isDead: bool = false

enum {
	SURROUND,
	ATTACK,
	HIT
}

func _ready():
	startPosition = position
	endPosition = endPoint.global_position

func changeDirection():
	var tempEnd = endPosition
	endPosition = startPosition
	startPosition = tempEnd

func updateVelocity():
	var moveDirection = endPosition - position
	if moveDirection.length()< limit:
		position = endPosition
		changeDirection()
	velocity = moveDirection.normalized()*speed

func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0: direction = "Left"
		elif velocity.x > 0: direction = "Right"
		elif velocity.y < 0: direction = "Up"
		animations.play("walk"+direction)

func _physics_process(delta):
	if isDead: return
	if target == null: get_tree().get_nodes_in_group("Player")[0]
	if target != null:
		velocity = position.direction_to(target.position) * speed
		move_and_slide()
	updateVelocity()
	move_and_slide()
	updateAnimation()

func _on_hurtbox_area_entered(area):
	if area == $hitbox: return
	$hitbox.set_deferred("monitorable", false)
	isDead = true
	animations.play("death")
	await animations.animation_finished
	queue_free()
