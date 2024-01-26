extends Area2D

@export var itemsRes: InventoryItem

func collect(inventory: Inventory):
	inventory.insert(itemsRes)
	queue_free()
