`Desarrollo Mobile` > `Swift Avanzado`

	
## Variables Opcionales mediante throws

### OBJETIVO 

-  Implementar un try? y crear una variable opcional.

#### REQUISITOS 

1. Xcode 11
2. Playgrounds

#### DESARROLLO

Del `Reto-01` implementar un código que permita la creación de un Optional llamado "Pizza".

```

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

```

<details>
	<summary>Solucion</summary>
<p>La solución es simple, dentro de las opciones del try tenemos try?./p>
	
```
// Optional
let value = try? o.precio(item: "Pizza")
```
	
</details> 
