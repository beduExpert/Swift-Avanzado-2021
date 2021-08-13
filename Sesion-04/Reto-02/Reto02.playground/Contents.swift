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
  
  func precio(item name: String) throws -> Int {
    guard let item = inventario[name] else {
      throw OxxoErrors.NoTenemosJoven
    }
    return item.price
  }
}

let o = Oxxo()
do {
  try o.comprar(item: "Pizza")
} catch OxxoErrors.NoTenemosJoven {
  print("Ya le dije que no tenemos")
}


// Optional
let value = try? o.precio(item: "Pizza")
