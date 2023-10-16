extends Control

@onready var coinLabel: Label = $HBoxContainer_Coin/Label_Coin

@export var player: Node3D

func _ready():
	player.coinNumberUpdated.connect(UpdateCoinLabel)

func UpdateCoinLabel(newValue: int):
	coinLabel.text = str(newValue)