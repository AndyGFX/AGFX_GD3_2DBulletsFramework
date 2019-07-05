extends Node2D


export (PackedScene) var projectilePrefab
export (float) var fireDelay = 0.5
export (bool) var fireAtOnce = true
export (bool) var delayPerFire = false # true = delay before next shoot per bullet on origin | true = fire at once on all origin

var fireIsEnabled:bool = true

# set group
const TYPE:String = "BULLET_EMITTER"

var origins:Array

func _ready():
	
	# set node group
	add_to_group(TYPE)
	
	# get all assigned origins
	var count = self.get_child_count()
	for i in range(count):
		var origin = self.get_child(i)
		if origin.is_in_group("BULLET_ORIGIN"):
			self.origins.append(origin)
	pass

# -------------------------------------------------------
# Preview emitter setup in scene
# -------------------------------------------------------
func PreviewInScene(state:bool)->void:
	for i in range(self.origins.size()):
		self.origins[i].previewInScene = state

# -------------------------------------------------------
# Fire 
# -------------------------------------------------------
func Fire(container:Node2D)->void:
	
	if !self.fireIsEnabled: return
	self.fireIsEnabled = false
	
	if self.fireAtOnce:
		self._FireAtOnce(container)
		self.fireIsEnabled = true
	else:
		self._FirePerOrigin()
	pass


# -------------------------------------------------------
# HELPERS
# -------------------------------------------------------
func _FireAtOnce(container:Node2D)->void:
	for i in range(self.origins.size()):
		self._FireFromOrigin(i,container)
	pass
	
func _FirePerOrigin()->void:
	pass
	
func _FireFromOrigin(id:int,container:Node2D)-> void:
	
	var bullet = self.projectilePrefab.instance() 	
	
	bullet.set_global_transform(self.origins[id].get_global_transform())
	
	bullet.set_position(self.origins[id].get_global_position())	
	var currentOriginAngle:float = self.origins[id].GetAngle()
	var newFireAngle:float = rad2deg(self.get_rotation()) + currentOriginAngle + rand_range(-self.origins[id].dispersion,self.origins[id].dispersion)
	
	bullet.SetFireDirectionFromAngle(newFireAngle)
	
	container.add_child(bullet)
	pass

