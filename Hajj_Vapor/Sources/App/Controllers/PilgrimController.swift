import Fluent
import Vapor
import Foundation

//Overall, the PilgrimController provides basic CRUD (create, read, update, delete) operations for the Pilgrim model, allowing clients to interact with the database through a RESTful API.

struct PilgrimController: RouteCollection {
   
  /*The boot function is called when the application boots up and is responsible for registering the controller's routes
    with the RoutesBuilder. In this function, we group the routes under the "pilgrims" path and register the index, create, and delete handlers*/
    
    func boot(routes: Vapor.RoutesBuilder) throws {
        let pilgrims = routes.grouped("Pilgrim")
        pilgrims.get(use: index)
        pilgrims.post(use: create)
    
        //group to delete all
        pilgrims.group(":id") { pilgrim in
            pilgrim.delete(use: deleteRecord)
        }
    }
    
   /*The index function is the handler for the GET /pilgrims route. It queries the database for all the Pilgrim records and returns them as an array. The try await syntax is used because Fluent's query methods are asynchronous and can throw errors.*/

    func index(req: Request) async throws -> [Pilgrim] {
        try await Pilgrim.query(on: req.db).all()
    }

    /*The create function is the handler for the POST /pilgrims route. It decodes the request body to a Pilgrim model, saves it to the database, and returns the saved model. Again, the try await syntax is used because saving to the database is an asynchronous operation that can throw errors.*/
    
    func create(req: Request)  throws -> EventLoopFuture <Pilgrim> {
        let input = try req.content.decode(Pilgrim.self)
        let calendar = Calendar.current
        let ageComponents = calendar.dateComponents([.year], from: input.dob, to: Date())
        input.age = ageComponents.year!
        return  input.save(on: req.db).map{input}
        
    }

    //Our functions Starts here
    //----------------------------------------------------------
    
    func deleteRecord(req: Request) async throws -> HTTPStatus {
        guard let pilgrim = try await Pilgrim.find(req.parameters.get(":id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await pilgrim.delete(on: req.db)
        return .noContent
    }
    
    func getPilgrimByID(req: Request) throws -> EventLoopFuture<Pilgrim> {
        guard let pilgrimID = req.parameters.get("id", as: UUID.self) else {
            throw Abort(.badRequest)
        }
        return Pilgrim.find(pilgrimID, on: req.db)
            .unwrap(orError: Abort(.notFound))
    }

    
}
