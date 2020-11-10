extends Control

var value : int = 10

onready var valueLabel : Label = $Value
onready var secondTimer : Timer = $Timer

var goblinCount : int = 0
var goblinCost := 5
onready var goblinCountLabel : Label = $UnitPurchaseGrid/GoblinCount

var orcCost := 25
var orcCount : int = 0
onready var orcCountLabel : Label = $UnitPurchaseGrid/OrcCount


func _process(delta: float) -> void:
	valueLabel.text = "%s" % value
	$UnitPurchaseGrid/GoblinCost.text = "%s" % goblinCost
	goblinCountLabel.text = "%s" % goblinCount
	$UnitPurchaseGrid/OrcCost.text = "%s" % orcCost
	orcCountLabel.text = "%s" % orcCount

func _on_Timer_timeout() -> void:
	value += goblinCount
	value += orcCount * 10

func _on_GoblinPurchaseButton_pressed() -> void:
	if value < goblinCost:
		return
	value -= goblinCost
	goblinCount += 1

func _on_OrcPurchaseButton_pressed() -> void:
	if value < orcCost:
		return
	value -= orcCost
	orcCount += 1
