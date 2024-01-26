extends CharacterBody2D

class_name King

var speed: float = 15.0
var bossHealth: int = 100
var health: int
var isDead:bool = false

@onready var target = $"../Player"
@onready var animations = $AnimationPlayer

#enum {
	#SURROUND,
	#ATTACK,
	#HIT
#}

func _physics_process(delta):
	if target == null: get_tree().get_nodes_in_group("Player")[0]
	if target != null:
		velocity = position.direction_to(target.position) * speed
		move_and_slide()
		updateAnimation()

#func move(target, delta):
	#var direction = (target - global_position).normalized()
	#var desired_velocity = direction * speed
	#

func updateAnimation():
	if velocity.length() == 0:
		if animations.is_playing():
			animations.stop()
	else:
		var direction = "Down"
		if velocity.x < 0 && abs(velocity.x) > abs(velocity.y): direction = "Left"
		elif velocity.x > 0 && abs(velocity.x) > abs(velocity.y): direction = "Right"
		elif velocity.y < 0 && abs(velocity.x) < abs(velocity.y): direction = "Up"
		animations.play("walk"+direction)


func _on_hurtbox_area_entered(area):
	print_debug("Life remaining:" + str(bossHealth))
	if area == $hitbox: return
	var entering_object_type = area.get_name()  # Get the name of the entering object
	print_debug("I got hit by: " + entering_object_type)

	$hitbox.set_deferred("monitorable", false)
	if isDead == true: return
	else:
		print_debug("I got hit")
		if bossHealth > 10:
			bossHealth -= 10
		else:
			isDead = true
			#animations.play("death")
			#await animations.animation_finished
			queue_free()
