extends Sprite2D

var score := [0, 0] # 0:player , 1: cpu
const PADDLE_SPEED : int = 500
@onready var pause_menu = $CanvasLayer
var paused = false
func _process(delta):
	if Input.is_action_just_pressed("pause"):
		pauseMenu()
	

func restart():
	score[1] = 0
	$hud/cpuscore.text = str(score[1])
	score[0] = 0
	$hud/playerscore.text = str(score[0])
	pause_menu.hide()
	Engine.time_scale = 1
	$winningtext/lose.hide()
	$winningtext/lose.hide()
	$balltimer.start()
	
func pauseMenu():
	if paused:
		pause_menu.hide()
		Engine.time_scale = 1
	else:
		pause_menu.show()
		Engine.time_scale = 0
	paused = !paused
func _on_balltimer_timeout():
	$ball.new_ball()


func _on_scoreleft_body_entered(body: Node2D) -> void:
	score[1] += 1
	$hud/cpuscore.text = str(score[1])
	if score[1] >= 7:
		pauseMenu()
		$winningtext/lose.show()
	$balltimer.start()


func _on_scoreright_body_entered(body: Node2D) -> void:
	score[0] += 1
	$hud/playerscore.text = str(score[0])
	if score[0] >= 7:
		pauseMenu()
		$winningtext/win.show()
	$balltimer.start()
