//
//  Empleados.swift
//  Cap6-CoreData
//
// Created by Arlen Peña on 28/11/21.
//  Copyright © 2021 Arlen Peña. All rights reserved.
//

import Foundation

class Empleados{
  var name: String
  var email: String
  var password: String
  var employeeNumber: String
  var birthDate: String
  var phoneNumber: String
  var role: String
  var routes: [Routes]
    
    init?(){
        return nil
    }
  
  init(name:String,email:String,password:String,employeeNumber:String,birthDate:String,phoneNumber:String,role:String,routes:[Routes]){
    self.name =  name
    self.email = email
    self.password = password
    self.employeeNumber = employeeNumber
    self.birthDate = birthDate
    self.phoneNumber = phoneNumber
    self.role = role
    self.routes = routes
  }
}
