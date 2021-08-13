
`Desarrollo Mobile` > `Swift Avanzado`

## Enums y Mutating

### OBJETIVO

-  Introducir al uso de protocolos con mutating.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

En el **Ejemplo-01** se implementó un pequeño algoritmo para modificar las vidas de **Mario**. Conformaremos el **Protocolo** `MarioLifes`.
Finalizamos con el código siguiente:

 ```
 enum Mario: MarioLifes {
  case dead
  case alive(numberOfLifes: Int)
  
  var numberLifes: Int {
    switch self {
    case .dead: return 0
    case let .alive(numberLifes): return numberLifes
    }
  } 
  mutating func receivedDamage() {
    switch self {
    case .dead:
      self = .alive(numberOfLifes:0)
    case let .alive(numberOfLifes):
      if numberOfLifes <= 0 {
        self = .dead
      } else {
        self = .alive(numberOfLifes: numberLifes - 1)
      }
    }
  }
}
```

El reto consiste en agregar mas funcionalidad a este código.

**Agregar la funcionalidad de incrementar vida.**

<details>
	<summary>Solucion</summary>
	<p> Crearemos una función de tipo mutating directamente en el extension de MarioLifes</p>
	<p></p>
</details> 


