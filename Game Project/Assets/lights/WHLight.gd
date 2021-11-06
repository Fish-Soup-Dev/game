extends Node2D

export (bool) var LightOn = false
export (bool) var Broken = false
export (Color) var LightColor = 'ffffff'

var rng = RandomNumberGenerator.new()

func _ready():
	rng.randomize()
	$RigidBody2D/Light2D.enabled = LightOn
	$RigidBody2D/Light2D.color = LightColor

func _process(_delta):
	if Broken == true:
		var random_number = rng.randf_range(0.0, 50.0)
		if random_number > 43:
			$RigidBody2D/Light2D.enabled = true
		else:
			$RigidBody2D/Light2D.enabled = false
