tool
extends Node2D

export var dispersion:float = 0
export var offsetSpawnPoint:Vector2 = Vector2()

# set group
const TYPE:String = "BULLET_ORIGIN"

func _ready():
	add_to_group(TYPE)
	pass
	
func _draw():
	if Engine.is_editor_hint():
		self.preview_in_editor()
	pass
	
func preview_in_editor():
	
	self.draw_fov(self,$SpawnPoint.position + self.offsetSpawnPoint,64,-self.dispersion,self.dispersion,Color.red)
	
	self.draw_line(
		$SpawnPoint.position + self.offsetSpawnPoint,
		$SpawnPoint.position + self.offsetSpawnPoint+Vector2(8,0),Color.green,1.5,true)
	self.draw_line($SpawnPoint.position + self.offsetSpawnPoint+Vector2(0,-2),$SpawnPoint.position + self.offsetSpawnPoint+Vector2(0,2),Color.green,1.5,true)

	# pivot (RED)
	self.draw_line($SpawnPoint.position+Vector2(0,-3),$SpawnPoint.position+Vector2(0,3),Color.red,1.5,false)
	self.draw_line($SpawnPoint.position+Vector2(-3,0),$SpawnPoint.position+Vector2(3,0),Color.red,1.5,false)
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