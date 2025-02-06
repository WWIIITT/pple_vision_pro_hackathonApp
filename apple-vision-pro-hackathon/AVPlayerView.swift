import SwiftUI
import AVKit

struct AVPlayerView: UIViewControllerRepresentable {
    @ObservedObject var viewModel: AVPlayerViewModel

    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let playerViewController = AVPlayerViewController()
        playerViewController.player = viewModel.player
        return playerViewController
    }

    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        if viewModel.isPlaying {
            uiViewController.player?.play()
        } else {
            uiViewController.player?.pause()
        }
    }
}
