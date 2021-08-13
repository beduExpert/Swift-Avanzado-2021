import UIKit

@objc class Car: NSObject {
    @objc dynamic var name = "Tesla"
}

let car = Car()
car.observe(\Car.name, options: .new) { car, change in
    print("Model: \(car.name)")
}

//Cambiamos el nombre, el observador se activa ejecutando el Print()
car.name = "Cyber Truck"


