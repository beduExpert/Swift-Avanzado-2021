import UIKit

enum Device {
  case iPad
  case iPhone
  
  var model: Int {
    switch self {
    case .iPhone:
      return 11
    case .iPad:
      return 2
    }
  }
  
  func name() -> String {
    switch self {
    case .iPhone:
      return "iPhone"
    case .iPad:
      return "iPad"
    }
  }
}

let device = Device.iPhone
print(device.name())



// Nested Enums
enum Alimento {
  
  enum Bebida {
    case refresco
    case cerveza
    case cafe
  }
  
  enum Comida {
    case taco
    case quesadilla
    case pizza
  }
  
  case paquete(comida: Comida, bebida: Bebida)
  
  func getDescription() -> String {
    switch self {
    case let .paquete(bebida, comida):
      return "Paquete elegido con: \(bebida) y \(comida)"
    }
  }
}

let alim = Alimento.paquete(comida: .pizza, bebida: .cerveza)
print(alim.getDescription())



enum LightSwitch {
  case off
  case on
  mutating func turn() {
    switch self {
    case .off:
      self = .on
    case .on:
      self = .off
    }
  }
}

var ls = LightSwitch.off
ls.turn()
ls

// Custom Inits
enum IntCategory {
  case small
  case medium
  case big
  case weird
  
  init(number: Int) {
    switch number {
    case 0..<1000 :
      self = .small
    case 1000..<100000:
      self = .medium
    case 100000..<1000000:
      self = .big
    default:
      self = .weird
    }
  }
}

let intCategory = IntCategory(number: 12345)
print(intCategory)



// Temeprature values
struct TemperatureValue: CustomStringConvertible {
  var celcius, fahrenheit: Int
  
  var description: String {
    return "(\(celcius)C - \(fahrenheit)F)"
  }
  
  mutating func transposeCelciusToFahrenheit() {
    (fahrenheit, celcius) = (celcius, fahrenheit)
  }
}


class TemperatureReference: CustomStringConvertible {
  var celcius, fahrenheit: Int
  
  init(celcius: Int, fahrenheit: Int) {
    self.celcius = celcius
    self.fahrenheit = fahrenheit
  }
  
  var description: String {
    return "(\(celcius)C - \(fahrenheit)F)"
  }
  
  func transposeCelciusToFahrenheit() {
    (fahrenheit, celcius) = (celcius, fahrenheit)
  }
}

print("\nVALUE TYPE:")
var temperatureValues : [TemperatureValue] = [] {
    didSet {
        print("Temperature values =", temperatureValues)
    }
}

var tempVal1 = TemperatureValue(celcius: 12, fahrenheit: 35)
temperatureValues.append(tempVal1) // Calls didSet

let tempVal2 = TemperatureValue(celcius: 11, fahrenheit: 33)
let tempVal3 = TemperatureValue(celcius: 10, fahrenheit: 32)
temperatureValues.append(tempVal2) // Calls didSet
temperatureValues.append(tempVal3) // Calls didSet

print("Swap values:")
temperatureValues[0].transposeCelciusToFahrenheit() // Calls didSet
tempVal1.transposeCelciusToFahrenheit() // DOES NOT call didSet
temperatureValues[0].celcius = 42 // Calls didSet

print("\nREFERENCE TYPE:")
var temperatureReference : [TemperatureReference] = [] {
    didSet {
        print("Temperature reference values =", temperatureReference)
    }
}
var tempRef1 = TemperatureReference(celcius: 12, fahrenheit: 35)
temperatureReference.append(tempRef1) // Calls didSet
let tempRef2 = TemperatureReference(celcius: 11, fahrenheit: 33)
let tempRef3 = TemperatureReference(celcius: 10, fahrenheit: 32)
temperatureReference.append(tempRef2) // Calls didSet
temperatureReference.append(tempRef3) // Calls didSet
print("Swap values:")
temperatureReference[0].transposeCelciusToFahrenheit() // DOES NOT call didSet
tempRef2.transposeCelciusToFahrenheit() // DOES NOT call didSet
temperatureReference[0].celcius = 42 // DOES NOT call didSet


