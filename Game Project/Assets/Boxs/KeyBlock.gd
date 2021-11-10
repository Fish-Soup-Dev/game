extends Area2D

signal ItemRecived(name)
export (String) var ItemType = "Key"
var player_entered = false

func _ready():
	$ActionSprite.visible = false
	
func _process(_delta):
	if player_entered == true:
		if Input.is_action_pressed("action_key"):
			$Sprite.visible = false
			emit_signal("ItemRecived", ItemType)

func _on_KeyBlock_body_entered(body):
	if (body.get_name() == "Player"):
		player_entered = true
		$ActionSprite.visible = true

func _on_KeyBlock_body_exited(body):
	if (body.get_name() == "Player"):
		player_entered = false
		$ActionSprite.visible = false
