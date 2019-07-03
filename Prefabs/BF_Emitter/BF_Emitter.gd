extends Node2D


# set group
const TYPE:String = "BULLET_EMITTER"

var origins:Array

func _ready():
	add_to_group(TYPE)
	pass
