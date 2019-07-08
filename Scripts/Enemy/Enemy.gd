extends KinematicBody2D

const TYPE:String = "ENEMY"

export var health:float = 100

func _ready():
	add_to_group(TYPE)
	pass


func SetDamage(damage)->void:
	
	self.health -= damage
	if self.health<0:
		queue_free()
	
	print ("Enemy health:"+String(self.health))
