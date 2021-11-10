extends Area2D

signal TextUpdate(mesage)
export(String, MULTILINE) var text

func _on_HelpTrigger_body_entered(body):
	if (body.get_name() == "Player"):
		emit_signal("TextUpdate", text)
