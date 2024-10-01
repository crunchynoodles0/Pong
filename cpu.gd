extends StaticBody2D

var ball_pos : Vector2
var dist_y : int
var move_by : int
var win_height : int
var p_height : int
# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	win_height = get_viewport_rect().size.y
	p_height = $ColorRect.get_size().y


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	ball_pos = $"../ball".position
	dist_y = position.y - ball_pos.y
	if abs(dist_y) > get_parent().PADDLE_SPEED * delta:
		move_by = get_parent().PADDLE_SPEED * delta * (dist_y / abs(dist_y))
	else:
		move_by = dist_y
	position.y -= move_by 
	position.y = clamp(position.y, p_height / 2, win_height - p_height / 2)
