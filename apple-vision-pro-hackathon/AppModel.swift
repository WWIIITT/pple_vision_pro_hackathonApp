import SwiftUI

class AppModel: ObservableObject { // Conform to ObservableObject
    @Published var immersiveSpaceState: ImmersiveSpaceState = .closed
    @Published var immersiveSpaceID: String = "ImmersiveView" // Added missing ID

    enum ImmersiveSpaceState {
        case open
        case closed
        case inTransition  // Added missing state
    }

    func reset() {
        immersiveSpaceState = .closed
    }
}
