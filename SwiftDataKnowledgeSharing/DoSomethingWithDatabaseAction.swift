import Foundation
import SwiftData

final class DoSomethingWithDatabaseAction {
    private let modelContext: ModelContext
    
    init(modelContainer: ModelContainer) {
        self.modelContext = ModelContext(modelContainer)
    }
    
    func insertSomeExtraItems() {
        for _ in 0..<4 {
            modelContext.insert(Animal.randomAnimal())
        }
    }
    
    func queryAndDeleteSomeItems() {
        let fetchDescriptor = FetchDescriptor<Animal>()
        
        do {
            let fetchedAnimals = try modelContext.fetch(fetchDescriptor)
            
            for item in fetchedAnimals {
                modelContext.delete(item)
            }
        } catch {
            print("error while fetching")
        }
    }
}
