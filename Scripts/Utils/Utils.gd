extends Node


func create_timer(wait_time, target, method, start):
	var timer = Timer.new()
	timer.set_wait_time(wait_time)
	timer.set_one_shot(true)
	timer.connect("timeout", target, method)
	add_child(timer)
	if start: timer.start()
	return timer
	pass 
	
func FindNode(node_name):
	return get_tree().get_root().find_node(node_name, true, false)
	
func get_scene_root():
	return get_tree().get_root()
	pass
	
# ---------------------------------------------------------
# Save to JSON file
# ---------------------------------------------------------
func SaveJSON(path,data, format=false):
	
	# Open the existing save file or create a new one in write mode
	var save_file = File.new()
	save_file.open(path, File.WRITE)
	
	# converts to a JSON string. We store it in the save_file
	if format:
		save_file.store_line(json_beautifier.beautify_json(to_json(data)))
	else:
		save_file.store_line(to_json(data))
	
	# The change is automatically saved, so we close the file
	save_file.close()
		
	pass

# ---------------------------------------------------------
# Load from JSON file
# ---------------------------------------------------------
func LoadJSON(path):
	var load_file = File.new()
	load_file.open(path, File.READ)
	return parse_json(load_file.get_as_text())	
	pass
	
	
func draw_circle_arc( canvas:CanvasItem, center, radius, angleFrom, angleTo, color ):
	var nbPoints = 32
	var pointsArc = PoolVector2Array()
    
	for i in range(nbPoints+1):
		var anglePoint = angleFrom + i*(angleTo-angleFrom)/nbPoints
		var point = center + Vector2( cos(deg2rad(anglePoint)), sin(deg2rad(anglePoint)) )* radius
		pointsArc.push_back( point )
        
		canvas.draw_multiline(pointsArc, color)
	
	canvas.draw_line(center,pointsArc[0],color)
	canvas.draw_line(center,pointsArc[pointsArc.size()-1],color)
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

