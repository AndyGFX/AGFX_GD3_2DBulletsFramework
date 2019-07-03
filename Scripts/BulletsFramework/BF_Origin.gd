tool
extends Node2D

export var fireAngle:float = 0
export var offsetSpawnPoint:Vector2 = Vector2()


func _ready():	
	
	pass
	
	
func preview_setup():
	
	Utils.draw_circle_arc(self,$SpawnPoint.position + self.offsetSpawnPoint,64,-self.fireAngle,self.fireAngle,Color.red)
	self.draw_line(
		$SpawnPoint.position + self.offsetSpawnPoint,
		$SpawnPoint.position + self.offsetSpawnPoint+Vector2(8,0),Color.green,2,true)
	self.draw_line($SpawnPoint.position + self.offsetSpawnPoint+Vector2(0,-2),$SpawnPoint.position + self.offsetSpawnPoint+Vector2(0,2),Color.green,2,true)
	
	self.draw_line($SpawnPoint.position+Vector2(0,-2),$SpawnPoint.position+Vector2(0,2),Color.red,2,true)
	self.draw_line($SpawnPoint.position+Vector2(-2,0),$SpawnPoint.position+Vector2(2,0),Color.red,2,true)
	
func _process(delta):
	if Engine.is_editor_hint():
		print("draw")
		preview_setup()