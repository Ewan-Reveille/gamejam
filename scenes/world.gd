extends Node2D

@onready var health = $CanvasLayer/health
@onready var player = $TileMap/Player
@onready var animations = $"CanvasLayer3/Cinématique/PanelContainer/AnimationPlayer"
@onready var cinematic = $CanvasLayer3
@onready var ryan = $TileMap/ryan_oldman
@onready var dialog = $TextBox
@onready var audio = $AudioStreamPlayer2D


# Called when the node enters the scene tree for the first time.
func _ready():
	#$CanvasLayer2/PauseMenu.visible = false
	audio.play()
	dialog.visible = false
	health.setMaxHearts(player.maxHealth)
	health.updateHearts(player.currentHealth)
	player.healthChanged.connect(health.updateHearts)
	animations.play("cinematic")
	await animations.animation_finished
	animations.queue_free()
	dialog.visible = true
	$TextBox/Timer2.start()
	
	#ryan.launch_dialog.connect(_on_launch_dialog.bind(ryan))


func _on_launch_dialog():
	print_debug("here")
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	pass

func _on_inventory_hud_closed():
	get_tree().paused = false

func _on_inventory_hud_opened():
	get_tree().paused = true


func _on_timer_2_timeout():
	dialog.visible = false


func _on_portal_body_entered(body):
	player.position.x = 50
	player.position.y = 50
