import SwiftUI
import SwiftData

@main
struct SwiftDataKnowledgeSharingApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(GlobalObjects.modelContainer)
    }
}
