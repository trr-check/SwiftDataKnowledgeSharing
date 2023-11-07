import Foundation
import SwiftData

@Model
class Animal: Identifiable {
    let firstname: String
    let lastname: String
    let age: Int
    let type: AnimalType
    let uuid: String
    
    init(firstname: String, lastname: String, age: Int, type: AnimalType, uuid: String = UUID().uuidString) {
        self.firstname = firstname
        self.lastname = lastname
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
            return Animal(firstname: "Alice", lastname: "", age: Int.random(in: 1...100), type: .fish)
        case 1:
            return Animal(firstname: "Bob", lastname: "", age: Int.random(in: 1...100), type: .bird)
        case 2:
            return Animal(firstname: "Mallory", lastname: "", age: Int.random(in: 1...100), type: .mammal)
        default:
            return Animal(firstname: "foo", lastname: "", age: Int.random(in: 1...100), type: .amphibian)
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
