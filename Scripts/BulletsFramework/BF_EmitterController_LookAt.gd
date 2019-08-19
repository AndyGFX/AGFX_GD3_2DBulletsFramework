extends Node2D
class_name BF_EmitteController_LookAt , "res://Scripts/BulletsFramework/icon_bf_controller.svg"


var _linked = null
var _object = null

func _init(target,linked):
	self._object = target
	self._linked = linked

func LookAt(pos:Vector2):
	self._object.look_at(pos)
	
func Update():
	if self._linked:
		self._object.set_global_position(self._linked.get_global_position())
	pass
	
func Start():
	pass
func Stop():
	pass

