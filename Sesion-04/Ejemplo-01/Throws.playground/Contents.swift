import UIKit

struct Item {
  var price: Int
  var count: Int
}

enum OxxoErrors: Error {
  case NoTenemosJoven
}

class Oxxo {
  var inventario = ["HotDog": Item(price: 20, count: 10),
                    "Maruchan": Item(price: 12, count: 5)]
  
  func comprar(item name: String) throws {
    guard let item = inventario[name] else {
      throw OxxoErrors.NoTenemosJoven
    }
    print("Pagando: $ \(item.price) MXN")
    print("Gracias vuelva pronto")
  }
}

let o = Oxxo()
try o.comprar(item: "Pizza")

