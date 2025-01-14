extends Control

var sel_pos_start = Vector2() # first click position

export(Color) var line_color = Color(1, 1, 1)
export(int) var line_width = 1

func _process(_delta: float) -> void:
	update()

func _draw() -> void:
	if is_visible():
		var m_pos = get_viewport().get_mouse_position()
		#var top_left: Vector2 = get_viewport().get_camera().unproject_position(Utils.map_2_to_3(sel_pos_start))
		var top_left: Vector2 = sel_pos_start
		if top_left != m_pos:
			draw_line(top_left, Vector2(m_pos.x, top_left.y), line_color, line_width) # upper right
			draw_line(top_left, Vector2(top_left.x, m_pos.y), line_color, line_width) # lower left
			draw_line(m_pos, Vector2(m_pos.x, top_left.y), line_color, line_width) # upper left
			draw_line(m_pos, Vector2(top_left.x, m_pos.y), line_color, line_width) # lower right
