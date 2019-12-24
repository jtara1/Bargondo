extends Control

signal game_timer_ended
signal all_pizzas_collected

var pizza_count = 0
var pizzas_on_map = 4 # TODO: have this in a singleton

onready var character = $"../../"
onready var text_label = $NinePatchRect/PizzaPanel/RichTextLabel
onready var timer_text_label = $NinePatchRect/TimerPanel/TimerTextLabel

func _ready():
	character.connect("item_consumed", self, "_on_Character_item_consumed")

func change_pizza_count(amount):
	pizza_count += amount
	text_label.text = str(pizza_count) + "/" + str(pizzas_on_map)
	
	if pizza_count >= pizzas_on_map:
		emit_signal("all_pizzas_collected")

func _on_Character_item_consumed(item):
	if item is Pizza: change_pizza_count(1)

func _on_Timer_timeout():
	var text = timer_text_label.text
	var time_left = int(text)
	
	if time_left <= 0:
		emit_signal("game_timer_ended")
		timer_text_label.get_node("Timer").queue_free()
	else:
		timer_text_label.text = str(time_left - 1)
