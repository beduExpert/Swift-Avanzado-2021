//
//  Models.swift
//  JSONMap
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import Foundation
import ObjectMapper

struct User: Mappable {
  
  var firstName: String?
  var lastName :String?
  var age: Int?
  var address: Address?
  
  init?(map: Map) {}
  
  mutating func mapping(map: Map) {
    self.firstName <- map["firstName"]
    self.lastName  <- map["lastName"]
    self.age       <- map["age"]
    self.address   <- map["address"]
  }
}

struct Address: Mappable {
  
  var streetAddress: String?
  var city: String?
  var state: String?
  var postalCode: Int?
  
  init?(map: Map) {}
  
  mutating func mapping(map: Map) {
    self.streetAddress <- map["streetAddress"]
    self.city  <- map["city"]
    self.state <- map["state"]
    self.postalCode <- map["postalCode"]
  }
}
