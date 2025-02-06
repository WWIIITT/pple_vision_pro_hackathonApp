import SwiftUI

struct ContentView: View {
    @EnvironmentObject var appModel: AppModel // Use AppModel as an EnvironmentObject

    var body: some View {
        VStack {
            Text("Immersive Space State: \(appModel.immersiveSpaceState == .open ? "Open" : "Closed")")
                .padding()

            Button("Reset") {
                appModel.reset() // Call reset function in AppModel
            }
        }
        .padding()
    }
}
