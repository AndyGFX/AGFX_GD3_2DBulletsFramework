extends Area2D


# projectile demage on hit object sent to object in group ENEMY
export var damage:float = 25

# projectile moving speed
export var speed:float = 200

# remove projectile after reach max distance
export var maxDistance:float = 2000

# set group
const TYPE:String = "BULLET"

# local variables
var velocity:Vector2 = Vector2(1,0)
var _startPosition = Vector2()


# ---------------------------------------------------------
# Prepare on ready
# ---------------------------------------------------------
func _ready():	
	add_to_group(TYPE)
	connect("area_entered", self, "_on_area_enter")
	connect("body_entered", self, "_on_body_enter")
	self._startPosition = self.get_position()	
	pass

# ---------------------------------------------------------
# Set fire direction from vector
# ---------------------------------------------------------
func SetFireDirectionFromVector(dir:Vector2)->void:
	velocity = dir

# ---------------------------------------------------------
# Set fire direction from angle
# ---------------------------------------------------------
func SetFireDirectionFromAngle(angle:float)->void:
	self.velocity = Vector2(cos(angle), sin(angle))
	$Sprite.rotation = angle
	
# ---------------------------------------------------------
# On Update
# ---------------------------------------------------------
func _physics_process(delta):
	
	# move forward
	translate(self.speed * self.velocity * delta)

	# check distance from spawn point
	if self.get_position().distance_to(self._startPosition)>self.maxDistance:
		queue_free() 

# ---------------------------------------------------------
# Check area hit
# ---------------------------------------------------------
func _on_area_enter(other):
	if other.is_in_group("SOLID"):
		queue_free() 
	pass

# ---------------------------------------------------------
# Check Body hit
# ---------------------------------------------------------
func _on_body_enter(other):
	if other.is_in_group("ENEMY"):
		if other.has_method("SetDamage"): 
			other.SetDamage(self.damage)
		else:
			print("WARNING: BF Projectile hit ENEMY without fnc SetDamage(damage) !")
			pass
		queue_free() 
	pass  
