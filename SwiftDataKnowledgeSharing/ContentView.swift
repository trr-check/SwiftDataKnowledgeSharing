import SwiftUI
import SwiftData

struct ContentView: View {
    @Query(filter: #Predicate<Animal> { animal in animal.happiness >= 0.02 }, animation: .bouncy) var allAnimals: [Animal]
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            List {
                ForEach(allAnimals) { animal in
                    HStack {
                        Text(animal.name)
                        Text("\(animal.age)")
                        Spacer()
                        Text(animal.type.localizedString)
                    }
                    .padding()
                    .swipeActions {
                        Button {
                            modelContext.delete(animal)
                        } label: {
                            Label("delete", systemImage: "trash")
                        }
                    }
                }
            }
            .padding()
            
            Button {
                modelContext.insert(Animal.randomAnimal())
            } label: {
                Text("new animal")
            }
            .buttonStyle(BorderedButtonStyle())
        }
    }
}
