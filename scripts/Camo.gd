const CAMOS = {
	"none": { 
		"speed_mult": 1 
	},
	"tree": { 
		"speed_mult": 0.25,
		"sprite_frame": 292,
	},
	"trash_can": { 
		"speed_mult": 0.25,
		"sprite_frame": 280,
	}
}

var type = "none"
var paramters = CAMOS[type]

func _init(camo_type = "none"):
	self.type = camo_type
	self.parameters = CAMOS[camo_type]

func get_speed_mult():
	return self.parameters["speed_mult"]