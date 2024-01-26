extends Button

@onready var backgroundSprite: Sprite2D = $background
@onready var container: CenterContainer = $CenterContainer
@onready var inventory = preload("res://inventory/playerInventory.tres")

var itemStackHud: ItemStackHud
var index: int

func insert(isg: ItemStackHud):
	itemStackHud = isg
	backgroundSprite.frame = 1
	container.add_child(itemStackHud)
	if !itemStackHud.inventorySlot || inventory.slots[index] == itemStackHud.inventorySlot:
		return
	inventory.insertSlot(index, itemStackHud.inventorySlot)

func takeItem():
	var item = itemStackHud
	container.remove_child(itemStackHud)
	itemStackHud = null
	backgroundSprite.frame = 0
	return item

func isEmpty():
	return !itemStackHud
