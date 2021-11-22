//
//  UserModel.swift
//  Sesion06
//
//  Created by Ivan Alejandro Hernandez Sanchez on 15/11/21.
//

import Foundation

struct CreateUserResponseModel: Codable {
    var meta:MetaModel?
    var data:UserModel?
    
    enum CodingKeys: String, CodingKey {
        case meta
        case data
    }
    
}

struct GenericUserResponseModel: Codable {
    var meta:MetaModel?
    var data:[UserModel]?
    
    enum CodingKeys: String, CodingKey {
        case meta
        case data
    }
    
}

struct MetaModel: Codable {
    var pagination:PaginationModel?
    
    enum CodingKeys: String, CodingKey {
        case pagination
    }
}

struct PaginationModel: Codable {
    var total:Int?
    var pages:Int?
    var page:Int?
    var limit:Int?
    var links:LinksModel?

    enum CodingKeys: String, CodingKey {
        case total
        case pages
        case page
        case limit
        case links
    }
}

struct LinksModel: Codable {
    var previous:String?
    var current:String?
    var next:String?

    enum CodingKeys: String, CodingKey {
        case previous
        case current
        case next
    }
}

struct UserModel: Codable {
    var name:String?
    var gender:String?
    var email:String?
    var status:String?
    var id:Int?
    
    enum CodingKeys: String, CodingKey {
        case name
        case gender
        case email
        case status
        case id
    }
}
