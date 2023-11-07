import Foundation
import SwiftData

enum DBSchemaV2: VersionedSchema {
    static var models: [any PersistentModel.Type] = [
        Animal.self
    ]
    
    static var versionIdentifier: Schema.Version = .init(1, 0, 1)
}

extension DBSchemaV2 {
    @Model
    class Animal: Identifiable {
        @Attribute(originalName: "name")
        let firstname: String
        let age: Int
        let type: AnimalType
        let uuid: String
        
        init(firstname: String, age: Int, type: AnimalType, uuid: String = UUID().uuidString) {
            self.firstname = firstname
            self.age = age
            self.type = type
            self.uuid = uuid
        }
        
        var id: String {
            uuid
        }
        
        var happiness: Double {
            switch type {
            case .bird:
                return 0.2
            case .mammal:
                return 1 / Double(age)
            case .amphibian:
                return 0.5 * exp(Double(age))
            case .fish:
                return 0.3 * log(Double(age))
            }
        }
        
        static func randomAnimal() -> Animal {
            switch Int.random(in: 0..<4) {
            case 0:
                return Animal(firstname: "Alice", age: Int.random(in: 1...100), type: .fish)
            case 1:
                return Animal(firstname: "Bob", age: Int.random(in: 1...100), type: .bird)
            case 2:
                return Animal(firstname: "Mallory", age: Int.random(in: 1...100), type: .mammal)
            default:
                return Animal(firstname: "foo", age: Int.random(in: 1...100), type: .amphibian)
            }
        }
    }
    
    enum AnimalType: Int, Codable {
        case bird
        case mammal
        case amphibian
        case fish
        
        var localizedString: String {
            switch self {
            case .bird:
                return "Vogel"
            case .mammal:
                return "Säugetier"
            case .amphibian:
                return "Amphibie"
            case .fish:
                return "Fisch"
            }
        }
    }
}
