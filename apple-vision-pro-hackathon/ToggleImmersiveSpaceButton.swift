import SwiftUI

struct ToggleImmersiveSpaceButton: View {
    @EnvironmentObject private var appModel: AppModel // Use EnvironmentObject

    @Environment(\.dismissImmersiveSpace) private var dismissImmersiveSpace
    @Environment(\.openImmersiveSpace) private var openImmersiveSpace

    var body: some View {
        Button {
            Task { @MainActor in
                switch appModel.immersiveSpaceState {
                case .open:
                    appModel.immersiveSpaceState = .inTransition
                    await dismissImmersiveSpace()
                    // Don't set .closed here; handle in onDisappear()

                case .closed:
                    appModel.immersiveSpaceState = .inTransition
                    switch await openImmersiveSpace(id: appModel.immersiveSpaceID) {
                    case .opened:
                        // Don't set .open here; handle in onAppear()
                        break

                    case .userCancelled, .error:
                        // On error, mark as closed
                        fallthrough
                    @unknown default:
                        appModel.immersiveSpaceState = .closed
                    }

                case .inTransition:
                    // This state should never allow a button press
                    break
                }
            }
        } label: {
            Text(appModel.immersiveSpaceState == .open ? "Hide Immersive Space" : "Show Immersive Space")
        }
        .disabled(appModel.immersiveSpaceState == .inTransition)
        .animation(.none, value: 0)
        .fontWeight(.semibold)
    }
}
