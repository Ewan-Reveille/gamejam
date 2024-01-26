extends Node2D
#
#var textures = []  # tableau pour stocker les textures
#var current_texture_index = 0
#
#func _ready():
	## Charger les textures
	#textures.append(load("res://art/cinematic/page_3_déchirure.png"))
	#textures.append(load("res://art/cinematic/perso avec fond (1).png"))
	#textures.append(load("res://art/cinematic/perso avec fond (2).png"))
	#textures.append(load("res://art/cinematic/perso avec fond (3).png"))
	#textures.append(load("res://art/cinematic/perso avec fond (4).png"))
	#textures.append(load("res://art/cinematic/perso avec fond (5).png"))
#
	##$Timer.connect("timeout", self, "_on_timer_timeout")
	#$Timer.start()
#
	## Afficher la première image
	#$TextureRect.texture = textures[0]
#
#func _on_timer_timeout():
	## Changer d'image lorsque le timer expire
	#current_texture_index += 1
#
	#if current_texture_index < len(textures):
		#$TextureRect.texture = textures[current_texture_index]
	#else:
		## Toutes les images ont été affichées, terminer la cinématique
		#$Timer.stop()
		## Vous pouvez ajouter ici une logique pour passer à la scène suivante ou effectuer d'autres actions
#
