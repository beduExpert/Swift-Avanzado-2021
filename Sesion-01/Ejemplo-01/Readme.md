
`Desarrollo Mobile` > `Swift Avanzado`

## Enums y Mutating

### OBJETIVO

-  Introducir al uso de protocolos con mutating.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

Implementamos un pequeño algoritmo para modificar las vidas de Mario. Conformaremos el Protocolo MarioLifes.
Implementar código mostrado en un Playground.
Explicar funcionamiento.
La idea es combinar el funcionamiento de mutating con self.

Comenzaremos definiendo un Protocolo, el cuál permita definir un Property y una fución. La función debe ser `mutating`:

```
protocol MarioLifes {
  var numberLifes: Int { get }
  mutating func receivedDamage()
}
```

Ya teniendo la función, comenzaremos  a definir un Enum.
El Enum debe conformar dicho protocolo.

```
enum Mario: MarioLifes {
	// code...
}
```

El Enum debe terner almenos un case, en este caso agregare dos. Uno referente al estado de `dead` y otro para las vidas de mario.

Asi mismo definimos un Computed Property que permitirá regresal el numero de vidas.

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
```
 
Por último, implementamos la función mutating. Agregamos una pequeña condición que permita saber si el Enum esta en estado `dead` o si tiene vidas.
 
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