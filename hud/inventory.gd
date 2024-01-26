extends Control

signal opened
signal closed

var isOpen: bool = false

@onready var inventory: Inventory = preload("res://inventory/playerInventory.tres")
@onready var ItemStackHudClass = preload("res://hud/itemsStackHud.tscn")
@onready var slots: Array = $NinePatchRect/GridContainer.get_children()

var itemInHand: ItemStackHud

func _ready():
	connectSlot()
	inventory.updated.connect(update)
	update()
	
func connectSlot():
	for i in range(slots.size()):
		var slot = slots[i]
		slot.index = i
		var callable = Callable(onSlotClicked)
		callable = callable.bind(slot)
		slot.pressed.connect(callable)

func update():
	for i in range(min(inventory.slots.size(), slots.size())):
		var inventorySlot: InventorySlot = inventory.slots[i]
		
		if !inventorySlot.item: continue
		
		var itemStackHud: ItemStackHud = slots[i].itemStackHud
		if !itemStackHud:
			itemStackHud = ItemStackHudClass.instantiate()
			slots[i].insert(itemStackHud)
		
		itemStackHud.inventorySlot = inventorySlot
		itemStackHud.update()

func open():
	visible = true
	isOpen = true
	opened.emit()

func close():
	visible = false
	isOpen = false
	closed.emit()
	
func onSlotClicked(slot):
	if slot.isEmpty() && itemInHand:
		insertItemFromSlot(slot)
		return
	if !itemInHand:
		takeItemFromSlot(slot)
	
func takeItemFromSlot(slot):
	itemInHand = slot.takeItem()
	add_child(itemInHand)
	updateItemInHand()
	
func insertItemFromSlot(slot):
	var item = itemInHand
	
	remove_child(itemInHand)
	itemInHand = null
	
	slot.insert(item)

func updateItemInHand():
	if !itemInHand: return
	itemInHand.global_position = get_global_mouse_position() - itemInHand.size / 2
	
func _input(event):
	updateItemInHand()
