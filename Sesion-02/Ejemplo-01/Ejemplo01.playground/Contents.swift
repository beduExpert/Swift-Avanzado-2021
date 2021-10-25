//: Playground - noun: a place where people can play

import UIKit

protocol NuestroProtocolo {
    func devuelveNumRandom() -> Double
}

class NuestraClase: NuestroProtocolo {
    var lastRandom = 0.0
    let a = 3877.0
    let b = 29573.0
    
    func devuelveNumRandom() -> Double {
        lastRandom = (lastRandom * a + b)
        return lastRandom
    }
}

let resultado = NuestraClase()

print("Nuestro: \(resultado.devuelveNumRandom())")


