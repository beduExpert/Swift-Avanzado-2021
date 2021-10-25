`Desarrollo Mobile` > `Swift Avanzado`


## Protocolos

### OBJETIVO

-  Crear un protocolo el que nos regrese un numero random como resultado.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

Crear un protocolo `NuestroProtocolo` el cual tendra una función `devuelveNumRandom`

Crear una clase `NuestraClase`que herede de `NuestroProtocolo`.

¿Es posible que nuestra clase pueda funcionar correctamente sin implementar la función del protocolo?

1.- Comenzamos creando un protocolo con la función:

```
protocol NuestroProtocolo {
    func devuelveNumRandom() -> Double
}
```

2.- Con un Extension podemos agregarle funcionalidad, por ejemplo agregar otro metodo/función.
Pero esta vez queremos que el protocolo solo pueda ser implementado por la clase `UIViewController`.

Entonces agregamos una función nueva a solo esta clase:

```
extension ProtocolName where Self: UIViewController {
    func blah() {
        print("Blah")
    }
}
```

**El código completo:**

```
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

print("Nuestro numero random: \(resultado.devuelveNumRandom())")
```
