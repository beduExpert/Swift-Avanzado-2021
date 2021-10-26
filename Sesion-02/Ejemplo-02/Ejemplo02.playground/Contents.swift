//: Playground - noun: a place where people can play

import UIKit

protocol SegundosPorAniosProtocol {
    var anios:Int { get set }
    func calcularSegundos() -> Int
}

class SegundosClase: SegundosPorAniosProtocol {
    var anios: Int = Int()
        
    func calcularSegundos() -> Int {
        let dias = 365
        let horas = 24
        let segundos = 3600
        
        return dias * horas * segundos * anios
    }
}

let segundosPorAnios = SegundosClase()
segundosPorAnios.anios = 4
print("El numero de segundos por los \(segundosPorAnios.anios) años son: \(segundosPorAnios.calcularSegundos())")

