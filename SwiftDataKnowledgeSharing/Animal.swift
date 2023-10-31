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
