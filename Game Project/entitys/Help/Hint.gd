extends Area2D

export(String, MULTILINE) var text

func _ready():
	$ColorRect/Label.text = text
	
func _on_Hint_body_entered(body):
	if (body.get_name() == "Player"):
		$ColorRect.visible = true
