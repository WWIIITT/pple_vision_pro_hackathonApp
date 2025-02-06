import SwiftUI
import RealityKit
import AVKit

struct ImmersiveView: View {
    @EnvironmentObject var appModel: AppModel
    @State private var videoEntity: ModelEntity?

    var body: some View {
        RealityView { content in
            if let videoEntity = videoEntity {
                content.add(videoEntity)
            } else {
                print("Video entity not loaded.")
            }
        }
        .task {
            videoEntity = createVideoEntity()
        }
    }

    private func createVideoEntity() -> ModelEntity? {
        guard let videoURL = Bundle.main.url(forResource: "chickenSoviet", withExtension: "mp4") else {
            print("Failed to find video in bundle.")
            return nil
        }

        let player = AVPlayer(url: videoURL)
        let material = VideoMaterial(avPlayer: player)
        let plane = MeshResource.generatePlane(width: 1.0, height: 0.75) // Adjust size as needed
        let entity = ModelEntity(mesh: plane, materials: [material])

        player.play() // Start playback
        return entity
    }
}

#Preview {
    ImmersiveView()
        .environmentObject(AppModel())
}
