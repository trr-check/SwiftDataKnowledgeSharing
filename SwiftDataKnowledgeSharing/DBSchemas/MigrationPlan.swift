import Foundation
import SwiftData

enum MigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        DBSchemaV1.self,
        DBSchemaV2.self,
        DBSchemaV3.self
    ]
    
    static var stages: [MigrationStage] = [
        v1tov2,
        v2tov3
    ]
    
    static var v1tov2: MigrationStage = .lightweight(fromVersion: DBSchemaV1.self, toVersion: DBSchemaV2.self)
    
    static func migrateV2toV3AnimalType(animalType: DBSchemaV2.AnimalType) -> DBSchemaV3.AnimalType {
        switch animalType {
        case .bird:
            return .bird
        case .mammal:
            return .mammal
        case .amphibian:
            return .amphibian
        case .fish:
            return .fish
        }
    }
    
    static var tempItems: [DBSchemaV3.Animal] = []
    
    static var v2tov3: MigrationStage = .custom(
        fromVersion: DBSchemaV1.self,
        toVersion: DBSchemaV2.self,
        willMigrate: { context in
            let items = try context.fetch(FetchDescriptor<DBSchemaV2.Animal>())
            for item in items {
                let newItem = DBSchemaV3.Animal(subtitle: "\(item.firstname) age: \(item.age)", type: migrateV2toV3AnimalType(animalType: item.type))
                tempItems.append(newItem)
                context.delete(item)
            }
        },
        didMigrate: { context in
            for item in tempItems {
                context.insert(item)
            }
            
            try context.save()
        }
    )
}
