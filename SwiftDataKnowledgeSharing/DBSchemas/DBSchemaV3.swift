import Foundation
import SwiftData

enum DBSchemaV3: VersionedSchema {
    static var models: [any PersistentModel.Type] = [
        Animal.self
    ]
    
    static var versionIdentifier: Schema.Version = .init(2, 0, 0)
}

extension DBSchemaV3 {
    @Model
    class Animal: Identifiable {
        let subtitle: String
        let type: AnimalType
        let uuid: String
        
        init(subtitle: String, type: AnimalType, uuid: String = UUID().uuidString) {
            self.subtitle = subtitle
            self.type = type
            self.uuid = uuid
        }
        
        var id: String {
            uuid
        }
        
        static func randomAnimal() -> Animal {
            switch Int.random(in: 0..<4) {
            case 0:
                return Animal(subtitle: "xxx", type: .fish)
            case 1:
                return Animal(subtitle: "xxx", type: .bird)
            case 2:
                return Animal(subtitle: "xxx", type: .mammal)
            default:
                return Animal(subtitle: "xxx", type: .amphibian)
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
