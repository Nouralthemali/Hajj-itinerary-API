import Fluent
import Vapor

func routes(_ app: Application) throws {

    try app.register(collection: PilgrimController())

    try app.register(collection: ItineraryController())
    
}
