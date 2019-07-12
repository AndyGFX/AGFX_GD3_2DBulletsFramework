extends Node2D


var player_1_fire
var player_2_fire
var eControl:BF_EmitteController
func _ready():

	
	
	
	self.player_1_fire = get_node("P1_shooting")
	self.player_1_fire.PreviewInScene(true);
	self.player_1_fire.SetProjectileSceneContainer($CONTAINER)
	
	self.player_2_fire = get_node("P2_shooting")
	self.player_2_fire.PreviewInScene(true);
	self.player_2_fire.SetProjectileSceneContainer($CONTAINER)
	
	$Control/Button_1.connect("pressed",self,"_on_Button_1_pressed")

	
	self.eControl = BF_EmitteController.new(self.player_1_fire)
	self.eControl.Setup("rotation_degrees",0,360,5,Tween.TRANS_LINEAR, Tween.EASE_IN_OUT,0,true)
	self.eControl.Start()
	
func _process(delta):
	if Input.is_action_just_pressed("ui_select"):
		self.player_1_fire.Fire()

func _on_Button_1_pressed():
	self.player_1_fire.Fire()

func _on_Button_2_pressed():
	self.player_2_fire.Fire()

func _on_Button_AF_ON_pressed():
	self.player_1_fire.AutoFireStart(0.1)
	self.player_2_fire.AutoFireStart(0.5)

func _on_Button_AF_OFF_pressed():
	self.player_1_fire.AutoFireStop()
	self.player_2_fire.AutoFireStop()
