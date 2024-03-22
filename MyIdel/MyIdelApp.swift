//


import SwiftUI

@main
struct MyIdelApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
		
		WindowGroup(id: "volume") {
			VolumeView()
		}
		.windowStyle(.volumetric)
		.defaultSize(width: 0.3, height: 0.3, depth: 0.3, in: .meters)
		
		ImmersiveSpace(id: "immersiveSpace") {
			ImmersiveView()
		}
		.immersionStyle(selection: .constant(.full), in: .full)
    }
}
