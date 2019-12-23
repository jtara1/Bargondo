extends Control

var pizza_count = 0
var Pizza = load("res://game-objects/Pizza.tscn")

onready var character = $"../../"
onready var text_label = $NinePatchRect/Panel/RichTextLabel

func _ready():
	character.connect("item_consumed", self, "_on_Character_item_consumed")

func change_pizza_count(amount):
	pizza_count += amount
	text_label.text = str(pizza_count) + " / 3"

func _on_Character_item_consumed(item):
	if item is Pizza: change_pizza_count(1)
