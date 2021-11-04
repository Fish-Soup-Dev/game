extends Area2D

func _ready():
	pass
	
func _on_Hint_body_entered(body):
	if (body.get_name() == "Player"):
		$ColorRect.visible = true
