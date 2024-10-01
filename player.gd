extends StaticBody2D

var win_height : int
var p_height : int
var win_width : int
var p_width : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y
	


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_left"):
		position.y -= get_parent().PADDLE_SPEED * delta
		position.x -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_up") and Input.is_action_pressed("ui_right"):
		position.y -= get_parent().PADDLE_SPEED * delta
		position.x += get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_left"):
		position.y += get_parent().PADDLE_SPEED * delta
		position.x -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down") and Input.is_action_pressed("ui_right"):
		position.y += get_parent().PADDLE_SPEED * delta
		position.x += get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_up"):
		position.y -= get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_down"):
		position.y += get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_right"):
		position.x += get_parent().PADDLE_SPEED * delta
	elif Input.is_action_pressed("ui_left"):
		position.x -= get_parent().PADDLE_SPEED * delta
	#tried to get 8-directional movement
	
#limit paddle movement to window
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
	position.x = clamp(position.x, p_width / 2 , (win_height-97) - p_width / 2)
