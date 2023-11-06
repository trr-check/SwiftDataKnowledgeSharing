import Foundation
import SwiftData

enum GlobalObjects {
    static let modelContainer: ModelContainer = {
        do {
            let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
            let config = ModelConfiguration(url: storeURL)
            return try ModelContainer(for: Animal.self, configurations: config)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }()
}

