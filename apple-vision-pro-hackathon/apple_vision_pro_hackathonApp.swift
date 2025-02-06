import SwiftUI

@main
struct apple_vision_pro_hackathonApp: App {
    @StateObject private var appModel = AppModel() // Initialize AppModel
    @StateObject private var avPlayerViewModel = AVPlayerViewModel() // Initialize AVPlayerViewModel

    var body: some Scene {
        WindowGroup {
            Group {
                if avPlayerViewModel.isPlaying {
                    AVPlayerView(viewModel: avPlayerViewModel)
                } else {
                    ContentView()
                        .environmentObject(appModel) // Pass appModel to environment
                }
            }
            .onAppear {
                appModel.immersiveSpaceState = .open
                avPlayerViewModel.play()
            }
            .onDisappear {
                appModel.immersiveSpaceState = .closed
                avPlayerViewModel.reset()
            }
        }
    }
}
