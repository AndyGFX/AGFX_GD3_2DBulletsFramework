extends Node2D


func _ready():
	$BF_Emitter.PreviewInScene(true);
	pass

func _on_Button_pressed():	
	$BF_Emitter.Fire($CONTAINER)
	pass
