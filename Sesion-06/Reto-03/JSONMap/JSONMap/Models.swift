//
//  Models.swift
//  JSONMap
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import Foundation
import ObjectMapper

struct Animals: Mappable {

  var animals: [Animal]?
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    self.animals <- map["animals"]
  }
}

struct Animal: Mappable {
  
  var id: String?
  var name :String?
  var type: Int?
  var weight: Int?
  
  init?(map: Map) {
  }
  
  mutating func mapping(map: Map) {
    self.id   <- map["id"]
    self.name <- map["name"]
    self.type <- map["type"]
    self.weight <- map["weight"]
  }
}
