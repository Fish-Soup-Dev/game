extends Node

export(Resource) var resource

func _ready():
	pass

func _on_StartButton_pressed():
	get_tree().change_scene(resource.get_path())
