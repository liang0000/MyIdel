//


import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
	@Environment(\.openWindow) private var openWindow
	@State private var selectedCreature: SeaCreature?
	@State private var selectedCharacter: Bool = false
	
	var body: some View {
		NavigationSplitView {
			List {
				Button("Character") {
					selectedCreature = nil
					selectedCharacter = true
				}
				ForEach(SeaCreature.seaCreatures) { creature in
					Button(creature.name) {
						selectedCreature = creature
						selectedCharacter = false
					}
				}
			}
			.navigationTitle("Models")
		} detail: {
			if selectedCharacter {
				CharacterView()
			} else if let selectedCreature {
				Model3D(named: selectedCreature.modelName, bundle: realityKitContentBundle)
					.navigationTitle(selectedCreature.name)
					.toolbar {
						Button("View \(selectedCreature.name)") {
							openWindow(id: "creatureWindow", value: selectedCreature.modelName)
						}
					}
			} else {
				Text("Select a model")
			}
		}
		.frame(minWidth: 700, minHeight: 700)
	}
}

#Preview(windowStyle: .automatic) {
	ContentView()
}
