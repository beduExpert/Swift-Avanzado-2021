//
//  Routes.swift
//  Cap6-CoreData
//
//  Created by Arlen Peña on 28/11/21.
//  Copyright © 2021 Arlen Peña. All rights reserved.
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
