extends Node2D


export (PackedScene) var projectilePrefab
export (float) var fireDelay = 0.5
export (bool) var fireAtOnce = true

var fireIsEnabled:bool = true

# set group
const TYPE:String = "BULLET_EMITTER"

var origins:Array
var sequenceEnabled:bool=false
var currentTime:float = 0
var currentOrigin:int = 0
var container:Node2D

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

func SetProjectileSceneContainer(container:Node2D)->void:
	self.container = container
	
# -------------------------------------------------------
# Fire 
# -------------------------------------------------------
func Fire()->void:
	
	if !self.fireIsEnabled: return
	
	if self.fireAtOnce:
		self._FireAtOnce()
		self.fireIsEnabled = true
	else:
		self._FirePerOrigin()
	pass

# -------------------------------------------------------
# Procesing fire per projectile origin (sequenced)
# -------------------------------------------------------
func _process(delta):
	if self.sequenceEnabled:
		self.currentTime += delta
		if self.currentTime>=self.fireDelay:
			self.currentTime = 0
			self._FireFromOrigin(self.currentOrigin)
			self.currentOrigin +=1
			if self.currentOrigin>=self.origins.size():
				self.currentOrigin = 0
				self.sequenceEnabled = false
				self.fireIsEnabled = true
			pass
		
	pass
# -------------------------------------------------------
# HELPERS
# -------------------------------------------------------
func _FireAtOnce()->void:
	self.fireIsEnabled = false
	for i in range(self.origins.size()):
		self._FireFromOrigin(i)
	self.fireIsEnabled = true
	pass
	
func _FirePerOrigin()->void:
	self.currentOrigin = 0
	self.currentTime = 0
	self.sequenceEnabled = true
	self.fireIsEnabled = false
	pass
	
func _FireFromOrigin(id:int)-> void:
	
	var bullet = self.projectilePrefab.instance() 	
	
	bullet.set_global_transform(self.origins[id].get_global_transform())
	
	bullet.set_position(self.origins[id].get_global_position())	
	var currentOriginAngle:float = self.origins[id].GetAngle()
	var newFireAngle:float = rad2deg(self.get_rotation()) + currentOriginAngle + rand_range(-self.origins[id].dispersion,self.origins[id].dispersion)
	
	bullet.SetFireDirectionFromAngle(newFireAngle)
	
	self.container.add_child(bullet)
	pass

