import Foundation
import SwiftData

enum MigrationPlan: SchemaMigrationPlan {
    static var schemas: [VersionedSchema.Type] = [
        DBSchemaV1.self,
        DBSchemaV2.self
    ]
    
    static var stages: [MigrationStage] = [
        v1tov2
    ]
    
    static var v1tov2: MigrationStage = .lightweight(fromVersion: DBSchemaV1.self, toVersion: DBSchemaV2.self)
}
