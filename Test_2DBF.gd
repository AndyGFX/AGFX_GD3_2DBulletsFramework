extends Node2D


func _ready():
	$BF_Emitter.PreviewInScene(true);
	$BF_Emitter.SetProjectileSceneContainer($CONTAINER)
	pass

func _on_Button_pressed():	
	$BF_Emitter.Fire()
	pass
