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

final class Pilgrim : Model , Content {
  
    
    static let schema = "Pilgrim"
   
    @ID (key : .id)
    var id : UUID?
    @Field (key : "Name")
    var name : String
    @Field (key : "Gender")
    var gender : String
    @Field (key : "PNumber")
    var pnumber : String
    @Field (key : "DOB")
    var dob : Date
    @Field (key : "Age")
    var age : Int?
    
    init() {
    }
    init(id: UUID? = nil, name: String, gender: String,  dob: Date , pnumber : String) {
           self.id = id
           self.name = name
           self.gender = gender
           self.dob = dob
         self.pnumber = pnumber
        
       }
}
