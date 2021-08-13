`Desarrollo Mobile` > `Swift Avanzado`


## Titulo del Ejemplo

### OBJETIVO

-  Identificar que el extensión es solo para aquellas clases del tipo que Self indica y solo para aquellas que conforman su protocolo.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

Crear una clase `ViewControllerB` que **NO** conforme el protocolo `ProtocolName`.

Debe heredar de `UIViewController`.

¿Es posible acceder a los valores del Extensión mediante el `ViewControllerB`?

1.- Comenzamos creando un protocolocon alguna función:

```
protocol ProtocolName {
    func doSomething()
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

protocol ProtocolName {
    func doSomething()
}
extension ProtocolName where Self: UIViewController {
    func blah() {
        print("Blah")
    }
}

class ViewController : UIViewController, ProtocolName {
    func doSomething() {
        print("Do Something");
    }
}
```