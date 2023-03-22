//
//  File.swift
//
//
//  Created by Noura Althemali on 27/08/1444 AH.
//

import Foundation
import Vapor
import Fluent
import FluentPostgresDriver




final class Itinerary : Model , Content {
    
    
    static let schema = "Itinerary"
    
    @ID (key : .id)
    var id : UUID?
    @Field (key : "CurrentL")
    var CurrentL : String
    @Field (key : "Transport")
    var transport : String
    @Field (key : "Type")
    var type : String
    @Field (key : "DStart")
    var dstart : Date
    @Field (key : "DEnd")
    var dend : Date
    
    
    init() {
    }
    init(id: UUID? = nil, CurrentL: String, transport: String,  type: String, dstart: Date ,  dend: Date) {
        self.id = id
        self.CurrentL = CurrentL
        self.transport = transport
        self.type = type
        self.dstart = dstart
        self.dend = dend
        
    }
}
