extends Node2D


func _ready():
	$BF_Emitter_1.PreviewInScene(true);
	$BF_Emitter_1.SetProjectileSceneContainer($CONTAINER)
	
	$BF_Emitter_2.PreviewInScene(true);
	$BF_Emitter_2.SetProjectileSceneContainer($CONTAINER)
	
	pass

func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		$BF_Emitter_1.Fire()
		$BF_Emitter_2.Fire()
	pass

func _on_Button_pressed():	
	$BF_Emitter_1.Fire()
	$BF_Emitter_2.Fire()
	pass


func _on_Button_1_pressed():
	$BF_Emitter_1.Fire()
	pass 


func _on_Button_2_pressed():
	$BF_Emitter_2.Fire()
	pass 


func _on_Button_AF_ON_pressed():
	$BF_Emitter_1.AutoFireStart(0.5)
	$BF_Emitter_2.AutoFireStart(0.5)
	pass # Replace with function body.


func _on_Button_AF_OFF_pressed():
	$BF_Emitter_1.AutoFireStop()
	$BF_Emitter_2.AutoFireStop()
	pass # Replace with function body.
