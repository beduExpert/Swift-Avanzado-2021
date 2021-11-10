
`Desarrollo Mobile` > `Swift Avanzado`
	
## Implementación de Escaping, DispatchTime y closures. 

### OBJETIVO 

-  Implementación de parámetros con @escaping y DispatchTime.

#### REQUISITOS 

1. Xcode 11
2. Playgrounds.


#### DESARROLLO

Para implementar este reto es necesario:

Declarar en el playground lo siguiente, esto es para poder utilizar el `DispatchTime`:

```
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true
```

Definimos un `enum` de comida, este manejara estados de la comida:

- cruda
- horneada

Definir una clase `Horno`.
Un método definido en **Horno** que consista en hornear la comida despues de cierto tiempo.

Para el tiempo usaremos:

```
 let time = DispatchTime.now() + .seconds(seconds)
  DispatchQueue.main.asyncAfter(deadline: time) {
    // tu código
  }
```

Con escaping ejecutaremos cualquier código que deseemos, puede ser desde cambiar el estado de la comida hasta un `print()`.

<details>
	<summary>Solución</summary>
	<p> Definiremos un Enum para manejar los estados de la comida, ya sea crudo u horneado. Para poder alterar su valor es necesario utilizar mutating.</p>
	
```
enum Comida {
  	case cruda
  	case horneada
 	mutating func hornear(){
   		self = .horneada
  	}
}
```
	<p> La definición de la clase contendrá una función, esta función tendrá como parámetro un closure pero de tipo @escaping.</p>
	
```
class Horno {
  func hornear(seconds: Int, closure: @escaping ()->()) {
    //...
  }
}
```
	<p> Implementamos el código basado en un DispatchQueue que manejará el tiempo. Dentro de este closure asincrono ejecutaremos nuestro closure. </p>
	
```
let time = DispatchTime.now() + .seconds(seconds)
DispatchQueue.main.asyncAfter(deadline: time) {
  closure()
}
```
	<p> La clase queda definida de la siguiente manera: </p>
```
class Horno {
  func hornear(seconds: Int, closure: @escaping ()->()){
    let time = DispatchTime.now() + .seconds(seconds)
    DispatchQueue.main.asyncAfter(deadline: time) {
      closure()
    }
  }
}
```
	
<p> Finalmente la implementación: </p>

```
var comida = Comida.cruda
var horno = Horno()
horno.hornear(seconds: 5) {
  comida.hornear()
  print("comida \(comida)")
}
```
</details> 
