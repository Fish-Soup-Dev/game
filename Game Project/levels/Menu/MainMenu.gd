extends Node

export(Resource) var resource

func _on_StartButton_pressed():
# warning-ignore:return_value_discarded
	get_tree().change_scene(resource.get_path())

func _on_ExitButton_pressed():
	get_tree().quit()
