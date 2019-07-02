extends Node2D

export var fireAngle:float = 0
export var offsetSpawnPoint:Vector2 = Vector2()


func _ready():	
	$SpawnPoint.position = self.offsetSpawnPoint;
	pass
	
	
func _draw():
	Utils.draw_circle_arc(self,Vector2(),64,-45,45,Color.red)
