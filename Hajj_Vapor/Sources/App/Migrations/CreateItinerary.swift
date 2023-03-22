import Fluent
import FluentPostgresDriver
import Foundation

struct CreateItinerary : Migration {
    
    func prepare(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("Itinerary")
            .id()
            .field("CurrentL", .string)
            .field("Transport", .string)
            .field("Type", .string)
            .field("DStart", .date)
            .field("DEnd", .date)
            .field("pilgrim_id", .uuid, .references("Pilgrim", "id"))
            .create()
    }
    
    func revert(on database: FluentKit.Database) -> NIOCore.EventLoopFuture<Void> {
        return database.schema("Itinerary").delete()
    }
    
    
}
