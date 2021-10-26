//: Playground - noun: a place where people can play

import UIKit

protocol AccesosNombreProtocolo {
    func obtenerNombreCompleto() -> String
    func obtenerNombre() -> String
    func obtenerNombreCompletoPorApellido() -> String
}

class MiViewModel: AccesosNombreProtocolo {
    var nombre: String = "Alejandro"
    var apellido: String = "Hernandez"
        
    func obtenerNombreCompleto() -> String {
        return "\(nombre) \(apellido)"
    }
    
    func obtenerNombre() -> String {
        return nombre
    }
    
    func obtenerNombreCompletoPorApellido() -> String {
        return "\(apellido) \(nombre)"
    }
}

let accion = MiViewModel()
print("El nombre es: \(accion.obtenerNombre())")
print("El nombre completo es: \(accion.obtenerNombreCompleto())")
print("El nombre completo iniciando con apellido es: \(accion.obtenerNombreCompletoPorApellido())")

