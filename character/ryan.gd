extends Area2D

signal launch_dialog

func _on_chat_emplacement_area_entered(area):
	if area == Player:
		emit_signal("launch_dialog")

