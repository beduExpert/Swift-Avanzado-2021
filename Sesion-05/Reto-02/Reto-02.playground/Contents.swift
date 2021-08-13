
import UIKit
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum Comida {
  case cruda
  case horneada
  mutating func hornear(){
    self = .horneada
  }
}

class Horno {
  func hornear(seconds: Int, closure: @escaping ()->()){
    let time = DispatchTime.now() + .seconds(seconds)
    DispatchQueue.main.asyncAfter(deadline: time) {
      closure()
    }
  }
}

var comida = Comida.cruda
var horno = Horno()
horno.hornear(seconds: 5) {
  comida.hornear()
  print("comida \(comida)")
}
