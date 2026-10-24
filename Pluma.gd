extends Area2D

@export var valor: int = 1

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and "plumas" in body:
		body.plumas += valor
		print("Plumas: ", body.plumas)
		queue_free()
