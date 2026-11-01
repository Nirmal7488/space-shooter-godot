extends Node
var enemy_scene = preload("res://entities/enemies/enemy.tscn")
@onready var game_over = get_parent().get_node("GameOver")

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_parent().get_node("Boundary").area_entered.connect(_the_end)
	game_over.hide()
	var timer=Timer.new()
	add_child(timer)
	timer.wait_time=1
	timer.timeout.connect(_create_enemy)
	timer.start()


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass

func _create_enemy():
	var enemy=enemy_scene.instantiate()
	get_parent().get_node("Enemies").add_child(enemy)
	
func _the_end(body:Node):
	if body is Enemy:
		get_parent().get_node("GameOver").show()
		get_tree().paused = true
	
