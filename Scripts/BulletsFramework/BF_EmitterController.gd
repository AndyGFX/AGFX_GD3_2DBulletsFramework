extends Node2D
class_name BF_EmitteController , "res://Scripts/BulletsFramework/icon_bf_controller.svg"


var _tween:Tween
var _object

func _init(target):
	self._tween = Tween.new()
	self._object = target
	self._object.add_child(self._tween)
	
	
func Setup(property, initial_val, final_val, duration, trans_type, ease_type, delay=0, repeat = false):
	self._tween.repeat = repeat
	self._tween.interpolate_property(self._object, property, initial_val, final_val, duration, trans_type, ease_type, delay)
	pass

func Start():
	self._tween.start()
	
func Stop():
	self._tween.stop(self._object)
	
