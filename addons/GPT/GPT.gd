@tool
extends EditorPlugin

enum modes {
	Action,
	Summarise,
	Chat,
	Help
}

var apikey = "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"
var prompt = "hello world"
var max_tokens = 1024
var temperature = 0.5
var url = "https://api.openai.com/v1/completions/"
var headers = ["Content-type: application/json", "Authorization: bearer " + apikey]
var engine = "text-davinchi-003"

var chatDock

func _enter_tree():
	chatDock = preload("res://GPT/control.tscn").instantiate()
	add_control_to_dock(EditorPlugin.DOCK_SLOT_LEFT_UR, chatDock)
	
