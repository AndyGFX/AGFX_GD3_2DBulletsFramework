extends Area2D

export var damage:float = 25
export var speed:float = 200
export var maxDistance:float = 2000
const TYPE:String = "BULLET"

var velocity:Vector2 = Vector2(1,0)
var _startPosition = Vector2()

func _ready():	
	add_to_group(TYPE)
	connect("area_entered", self, "_on_area_enter")
	connect("body_entered", self, "_on_body_enter")
	self._startPosition = self.get_position()
	
	randomize()
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
		if other.has_method("SetDamage"): other.SetDamage(self.damage)
		queue_free() 
	pass  
