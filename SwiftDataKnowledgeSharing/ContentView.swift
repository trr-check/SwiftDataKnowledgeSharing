import SwiftUI
import SwiftData

struct ContentView: View {
    @Query var allAnimals: [Animal]
    
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
                }
            }
            .padding()
        }
    }
}
