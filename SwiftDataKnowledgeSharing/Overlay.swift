import SwiftUI
import SwiftData

struct Overlay: View {
    @StateObject var viewModel = ViewModel()
    
    var body: some View {
        VStack {
            Spacer()
            Button {
                viewModel.add()
            } label: {
                Label("add", systemImage: "plus")
            }
            Spacer()
            Button {
                viewModel.remove()
            } label: {
                Label("remove", systemImage: "minus")
            }
            Spacer()
        }
    }
}

extension Overlay {
    final class ViewModel: ObservableObject {
        private let databaseAction = DoSomethingWithDatabaseAction(modelContainer: GlobalObjects.modelContainer)
        
        func add() {
            databaseAction.insertSomeExtraItems()
        }
        
        func remove() {
            databaseAction.queryAndDeleteSomeItems()
        }
    }
}
