import SwiftUI
import AVKit

class AVPlayerViewModel: ObservableObject {
    @Published var isPlaying: Bool = false
    var player: AVPlayer?

    init() {
        loadLocalVideo()
    }

    /// Loads the video from the local directory
    private func loadLocalVideo() {
        // Get the file URL from the app's bundle
        if let localVideoURL = Bundle.main.url(forResource: "cat", withExtension: "mp4") {
            print("Local video found: \(localVideoURL)")
            player = AVPlayer(url: localVideoURL)
        } else {
            print("Failed to locate the local video file in the bundle.")
        }
    }

    /// Plays the video
    func play() {
        guard let player = player else {
            print("Player not initialized.")
            return
        }
        isPlaying = true
        player.play()
    }

    /// Pauses the video
    func reset() {
        isPlaying = false
        player?.pause()
    }
}
