import Foundation
import SwiftData

enum GlobalObjects {
    static let modelContainer: ModelContainer = {
        do {
            let schema = Schema([Animal.self])
            let storeURL = URL.documentsDirectory.appending(path: "database.sqlite")
            let config = ModelConfiguration(url: storeURL)
            return try ModelContainer(for: schema, migrationPlan: MigrationPlan.self, configurations: config)
        } catch {
            fatalError("Failed to configure SwiftData container.")
        }
    }()
}

