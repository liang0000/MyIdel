//


import Foundation

struct SeaCreature: Identifiable {
	var name: String
	var modelName: String
	var id = UUID()
	
	static var seaCreatures = [
		SeaCreature(name: "Clam", modelName: "ClamScene"),
		SeaCreature(name: "Slug", modelName: "SlugScene"),
	]
}
