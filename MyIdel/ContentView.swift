//


import SwiftUI
import RealityKit
import RealityKitContent
import SplineRuntime

struct ContentView: View {
	@State var isShowVolume = false
	@State var isShowImmersiveSpace = false
	@Environment(\.openWindow) var openWindow
	@Environment(\.dismissWindow) var dismissWindow
	@Environment(\.openImmersiveSpace) var openImmersiveSpace
	@Environment(\.dismissImmersiveSpace) var dismissImmersiveSpace
	
	let url = URL(string: "https://build.spline.design/nuD7FiyAb-wjFB7DRDbQ/scene.splineswift")!
	
    var body: some View {
        VStack {
			CharacterView()
			
			HStack {
				Toggle("Show Volume", isOn: $isShowVolume)
					.toggleStyle(.button)
					.onChange(of: isShowVolume) { _, isShow in
						isShow ? openWindow(id: "volume") : dismissWindow(id: "volume")
					}
				
				Toggle("Show Immersive", isOn: $isShowImmersiveSpace)
					.toggleStyle(.button)
					.onChange(of: isShowImmersiveSpace) { _, isShow in
						Task {
							if isShow {
								await openImmersiveSpace(id: "immersiveSpace")
							} else {
								await dismissImmersiveSpace()
							}
						}
					}
			}
			.padding()
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}

struct CharacterView: View {
	var body: some View {
		let url = URL(string: "https://build.spline.design/nuD7FiyAb-wjFB7DRDbQ/scene.splineswift")!
		
		try? SplineView(sceneFileURL: url).ignoresSafeArea(.all)
	}
}

struct VolumeView: View {
	var body: some View {
		let url = URL(string: "https://build.spline.design/nuD7FiyAb-wjFB7DRDbQ/scene.splineswift")!
		
		SplineVolumetricContent(sceneFileURL: url)
	}
}

struct ImmersiveView: ImmersiveSpaceContent {
	var body: some ImmersiveSpaceContent {
		let url = URL(string: "https://build.spline.design/I8Hnv-UYExjd-L3eQLm9/scene.splineswift")!
		
		SplineImmersiveSpaceContent(sceneFileURL: url)
	}
}
