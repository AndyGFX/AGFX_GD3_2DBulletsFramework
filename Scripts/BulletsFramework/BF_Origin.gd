extends Node2D

export var fireAngle:float = 0
export var offsetSpawnPoint:Vector2 = Vector2()


func _ready():
	$FireDirection.rotation = self.fireAngle
	$SpawnPoint.position = self.offsetSpawnPoint;
	pass
