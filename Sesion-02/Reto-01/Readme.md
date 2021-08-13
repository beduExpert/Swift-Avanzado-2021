 
`Desarrollo Mobile` > `Swift Avanzado`

## Titulo del Ejemplo 

### OBJETIVO 

- Identificar que el extensión es solo para aquellas clases del tipo que Self indica y solo para aquellas que conforman su protocolo.

#### REQUISITOS 

1. Xcode

#### DESARROLLO

Con base en el `Ejemplo-01`, implementar una clase que herede de `NSObject` y conforme el protocolo antes creado.

Intentar acceder a los métodos de la extensión.

<details>
	<summary>Solucion</summary>
	<p>Crearemos una nueva clase, llamemosla MyClass.</p>
	<p>Agregaremos algo de codigo, una funcion.</p>
   <p>Hacemos que MyClass conforme el protocolo ProtocolName.</p>
   <p>El código a implementar seria el siguiente: </p>
 
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

class MyClass: NSObject, ProtocolName {
    func doSomething() {
        print("Do Something");
    }
}

let m: MyClass = MyClass()
m.doSomething()
```

 <p>la instancia de MyClass no tiene acceso a la extensión del protocolo debido a que no es del mismo tipo que Self especifica. </p>
</details> 
