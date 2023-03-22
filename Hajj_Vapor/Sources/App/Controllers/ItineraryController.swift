//
//  File.swift
//  
//
//  Created by Noura Althemali on 28/08/1444 AH.
//

import Foundation
import Fluent
import Vapor

struct ItineraryController: RouteCollection {
    
    func boot(routes: RoutesBuilder) throws {
        let itineraries = routes.grouped("Itinerary")
        itineraries.get(use: index)
        itineraries.post(use: create)
        itineraries.patch(":id", use: update)
        itineraries.group(":id") { itinerary in
            itinerary.delete(use: delete)
        }
    }
    
    func index(req: Request) async throws -> [Itinerary] {
        try await Itinerary.query(on: req.db).all()
    }
    
    func create(req: Request) async throws -> Itinerary {
        let itinerary = try req.content.decode(Itinerary.self)
        try await itinerary.save(on: req.db)
        return itinerary
    }
    
    func delete(req: Request) async throws -> HTTPStatus {
        guard let itinerary = try await Itinerary.find(req.parameters.get(":id"), on: req.db) else {
            throw Abort(.notFound)
        }
        try await itinerary.delete(on: req.db)
        return .noContent
    }
    
    //Our functions Starts here
    //----------------------------------------------------------
    
    func update(req: Request) throws -> EventLoopFuture<Itinerary> {
        let itinerary = try req.content.decode(Itinerary.self)
//        guard let itineraries = try await Itinerary.find(req.parameters.get(":id"), on: req.db)
        let uuid = req.parameters.get("id", as : UUID.self)
        return Itinerary
            .find(uuid, on : req.db)
            .unwrap(orError: Abort(.notFound))
            .flatMap{
                Itinerary in Itinerary.type = itinerary.type
                return Itinerary.save(on: req.db ).map{
                    Itinerary
                }
            }
    }


    
    
}

