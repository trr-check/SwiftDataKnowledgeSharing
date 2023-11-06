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
        let filterPredicate = #Predicate<Animal> { animal in
            animal.age >= 4
        }
        
        let fetchDescriptor = FetchDescriptor<Animal>(predicate: filterPredicate)
        
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
