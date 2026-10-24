extends Area2D

@onready var detector = $DetectorPaso

var jugador_ha_pasado: bool = false

func _ready() -> void:
	body_entered.connect(_on_tubo_body_entered)
	detector.body_entered.connect(_on_detector_body_entered)

func _on_tubo_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and body.has_method("morir") and not body.muriendo:
		body.morir()

func _on_detector_body_entered(body: Node2D) -> void:
	if body is CharacterBody2D and "puntos" in body and not jugador_ha_pasado:
		jugador_ha_pasado = true
		body.puntos += 1
		print("Puntuación: ", body.puntos)
