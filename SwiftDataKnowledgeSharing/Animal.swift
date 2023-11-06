import Foundation
import SwiftData

@Model
class Animal: Identifiable {
    let name: String
    let age: Int
    let type: AnimalType
    let uuid: String
    
    init(name: String, age: Int, type: AnimalType, uuid: String = UUID().uuidString) {
        self.name = name
        self.age = age
        self.type = type
        self.uuid = uuid
    }
    
    var id: String {
        uuid
    }
    
    static func randomAnimal() -> Animal {
        switch Int.random(in: 0..<4) {
        case 0:
            return Animal(name: "Alice", age: 5, type: .fish)
        case 1:
            return Animal(name: "Bob", age: 20, type: .bird)
        case 2:
            return Animal(name: "Mallory", age: 3, type: .mammal)
        default:
            return Animal(name: "foo", age: Int.random(in: 1...100), type: .amphibian)
        }
    }
}

enum AnimalType: String, Codable {
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
