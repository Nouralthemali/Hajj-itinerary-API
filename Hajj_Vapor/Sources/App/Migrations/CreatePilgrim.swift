import Fluent
import FluentPostgresDriver
import Foundation

struct CreatePilgrim : Migration {
    
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("Pilgrim")
            .id()
            .field("Name", .string)
            .field("Gender", .string)
            .field("PNumber", .string)
            .field("DOB", .date)
            .field("Age", .int )
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("Pilgrim").delete()
    }
    
    
}
