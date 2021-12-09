//
//  Routes.swift
//  Cap6-CoreData
//
//  Created by Salvador Lopez on 22/05/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import Foundation


class Routes {
  var dir: String
  var persona: String
  var adeudo: String
  var notas: String
  
  init(dir:String, persona:String, adeudo:String, notas:String){
    self.dir = dir
    self.persona = persona
    self.adeudo = adeudo
    self.notas = notas
  }
}
