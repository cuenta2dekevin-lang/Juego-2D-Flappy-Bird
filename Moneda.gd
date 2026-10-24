extends Area2D

@export var valor: int = 1

func _ready() -> void:
	body_entered.connect(_on_body_entered)

func _on_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and "monedas" in body:
		body.monedas += valor
		print("Monedas: ", body.monedas)
		queue_free()
