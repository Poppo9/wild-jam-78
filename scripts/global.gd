extends Node

var giorno = 1
var ora = 7
var minuto = 0
var last_room_entered = 0
const max_life = 10
var vita = max_life

var lista_stanze = [
	"res://scenes/camera_2_0.tscn",
	"res://scenes/studio.tscn", #to be studio
	"res://scenes/stanza_gatto.tscn",
	"res://scenes/bagno.tscn",
	"res://scenes/cucina.tscn",
	"res://scenes/cantina.tscn",
	"res://scenes/esterno.tscn", #to be esterno
]

const mapping_nomi = {
	"camera": "I'm so tired... go to sleep.",
	"studio": "maybe read a book?",
	"stanza_gatto": "you HAVE to feed Muso, NOW!",
	"bagno": "you should use the bathroom...",
	"cucina": "you need to eat something...",
	"cantina": "can you check on 'Bob'?",
	"esterno": "you should pick some folowers now..."
}

var ordine_stanze = mapping_nomi.keys()

const lista_quests = [
	"bagno",
	"cucina",
	"stanza_gatto",
	"esterno",
	"cucina",
	"bagno",
	"cantina",
	"cucina",
	"studio",
	"bagno",
	"camera"
]
const quest_lunghe = [
	"bagno",
	"cucina",
	#"stanza_gatto",
	#"esterno",
	#"cantina",
	"studio",
	#"camera"
]
#const quest_lunghe = [
	#"bagno",
	#"cucina",
	#"studio"
#]

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
