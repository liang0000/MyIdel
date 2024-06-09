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
					Button(action: {
						selectedCreature = creature
						selectedCharacter = false
					}, label: {
						Text(creature.name)
					})
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
						Button(action: {
							openWindow(id: "creatureWindow", value: selectedCreature.modelName)
						}, label: {
							Text("View \(selectedCreature.name)")
						})
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
