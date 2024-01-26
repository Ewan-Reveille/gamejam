extends CanvasLayer

@onready var textbox_container = $TextBoxContainer
@onready var label = $TextBoxContainer/MarginContainer/HBoxContainer/Label

# Called when the node enters the scene tree for the first time.
func _ready():
	hide_textbook()
	add_text("Tu as l'air fatigué mon garçon, tiens, récupère cette potion. 
D'ailleurs, tu en trouveras d'autres en passant dans cette grotte.")



func hide_textbook():
	label.text = ""
	
func show_textbook():
	textbox_container.show()

func add_text(next_text):
	label.text = next_text


func _on_timer_timeout():
	$".".visible = false
