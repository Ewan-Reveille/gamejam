extends Panel

class_name ItemStackHud

@onready var itemSprite: Sprite2D = $item
@onready var amountLabel: Label = $Label

var inventorySlot: InventorySlot

func update():
	if !inventorySlot || !inventorySlot: return
	itemSprite.visible = true
	itemSprite.texture = inventorySlot.item.texture
	if inventorySlot.amount == 1:
		amountLabel.visible = false
	else:
		amountLabel.visible = true
		amountLabel.text = str(inventorySlot.amount)
