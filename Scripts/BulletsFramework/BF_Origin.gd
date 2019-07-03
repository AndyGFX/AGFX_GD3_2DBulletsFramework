tool
extends Node2D

export var fireAngle:float = 0
export var offsetSpawnPoint:Vector2 = Vector2()


func _ready():	
	
	pass
	
func _draw():
	if Engine.is_editor_hint():
		self.preview_in_editor()
	pass
	
func preview_in_editor():
	
	self.draw_fov(self,$SpawnPoint.position + self.offsetSpawnPoint,64,-self.fireAngle,self.fireAngle,Color.red)
	
	self.draw_line(
		$SpawnPoint.position + self.offsetSpawnPoint,
		$SpawnPoint.position + self.offsetSpawnPoint+Vector2(8,0),Color.green,2.1,true)
	self.draw_line($SpawnPoint.position + self.offsetSpawnPoint+Vector2(0,-3),$SpawnPoint.position + self.offsetSpawnPoint+Vector2(0,2),Color.green,2,true)

	self.draw_line($SpawnPoint.position+Vector2(0,-3),$SpawnPoint.position+Vector2(0,3),Color.red,2.1,false)
	self.draw_line($SpawnPoint.position+Vector2(-3,0),$SpawnPoint.position+Vector2(3,0),Color.red,2.1,false)
	pass
	
func draw_fov( canvas:CanvasItem, center, radius, angleFrom, angleTo, color ):
	
	var pointsArc = PoolVector2Array()
    
	var point = center + Vector2( cos(deg2rad(angleFrom)), sin(deg2rad(angleFrom)) )* radius
	pointsArc.push_back( point )
	
	point = center + Vector2( cos(deg2rad(angleTo)), sin(deg2rad(angleTo)) )* radius
	pointsArc.push_back( point )
        
	canvas.draw_line(center,pointsArc[0],color)
	canvas.draw_line(center,pointsArc[1],color)
	canvas.draw_line(pointsArc[0],pointsArc[1],color)
	pass	
	
func _process(delta):
	if Engine.is_editor_hint(): update()