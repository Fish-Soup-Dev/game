extends Area2D

export(Resource) var resource
var player_entered = false

func _ready():
	$ActionSprite.visible = false
	
func _process(_delta):
	if player_entered == true:
		if Input.is_action_pressed("action_key"):
			$DoorSprite.animation = "open"
			$LoadTimer.start()

func _on_Door_body_entered(body):
	if (body.get_name() == "Player"):
		player_entered = true
		$ActionSprite.visible = true

func _on_Door_body_exited(body):
	if (body.get_name() == "Player"):
		player_entered = false
		$ActionSprite.visible = false

func _on_LoadTimer_timeout():
# warning-ignore:return_value_discarded
	get_tree().change_scene(resource.get_path())
	
