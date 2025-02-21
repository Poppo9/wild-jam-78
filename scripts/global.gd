extends Node

var giorno = 1
var ora = 7
var minuto = 0
var last_room_entered = 0
var vita = 10

var lista_stanze = [
	"res://scenes/camera_2_0.tscn",
	"res://scenes/camera_2_0.tscn", #to be studio
	"res://scenes/stanza_gatto.tscn",
	"res://scenes/bagno.tscn",
	"res://scenes/cucina.tscn",
	"res://scenes/cantina.tscn",
	"res://scenes/esterno.tscn", #to be esterno
]

const lista_quests = [
	"camera",
	"studio",
	"stanza_gatto",
	"bagno",
	"cucina",
	"cantina",
	"esterno"
]

var lista_quest_attive = []

var quest = "feed the cat"
var quests = {
	"eat something":[[6,7],[11,13],[18,19]], #2 volte al giorno
	"drink some water":[0,24], #2 volte
	#"go to the bathroom":, #2 volte al giorno
	#"feed the cat":, #1 volta
	#"eat something":, #2 volte al giorno
	#"drink some water":, #2 volte
	#"go to sleep":, #1
	#"go to the bathroom": #2 volte al giorno
}
var quest_bannate = []

var random_events = [
	"check the noise in the basement",
	"go to the bathroom", #2 volte al giorno
	"check the emails"
]
#ordine immaginato = [
	#"eat something", #2 volte al giorno
	#"drink some water", #2 volte
	#"go to the bathroom" #2 volte al giorno
	#"feed the cat", #1 volta
	#"check the noise in the basement",
	#"eat something", #2 volte al giorno
	#"drink some water", #2 volte
	#"go to the bathroom" #2 volte al giorno
	#"go to sleep", #1
#] possibili random events

var bob_position = Vector2(-125,-40)
