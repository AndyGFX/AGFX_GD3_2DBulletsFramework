tool
extends Position2D
class_name BF_Origin

export var dispersion:float = 0
export var previewInScene:bool = true

# set group
const TYPE:String = "BULLET_ORIGIN"

func _ready():
	add_to_group(TYPE)
	pass
	
func _draw():
	if Engine.is_editor_hint():
		self.preview_in_editor()
	if previewInScene:
		self.preview_in_editor()
	pass
	
func preview_in_editor():
	
	# draw precision FOV
	self.draw_fov(self,Vector2(0,0),64,-self.dispersion,self.dispersion,Color.red)
	
	# draw main projectile direction
	self.draw_line(
		Vector2(1,0),
		Vector2(32,0),Color.green,1,true)
	
	
	self.draw_line(
		Vector2(1,0),
		Vector2(1,0)+Vector2(8,0),Color.green,1.5,true)
		
	self.draw_line(Vector2(0,-2),Vector2(0,2),Color.green,1.5,true)

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
	if Engine.is_editor_hint(): 
		update()
	
func GetSpawnPoint()->Vector2:
	var res:Vector2 = Vector2()	
	res = self.get_global_position()
	return res
	pass
	
func GetDirection()->Vector2:
	var res:Vector2 = Vector2(1,0)
	res = Vector2( cos(self.rotation), sin(self.rotation))
	return res
	pass
	
func GetAngle()->float:
	return self.get_rotation_degrees()	
	pass