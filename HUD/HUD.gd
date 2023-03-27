extends Control


func _physics_process(_delta):
	$Lives.text="Lives: "+str(Global.lives)
