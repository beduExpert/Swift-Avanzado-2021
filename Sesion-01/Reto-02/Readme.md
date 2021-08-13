`Desarrollo Mobile` > `Swift Avanzado`

## Game Character Type Implementation 

### OBJETIVO 

- Integrar Enums, protocols y extensiones con implementaciones por defecto.

#### REQUISITOS 

1. Xcode 11 

#### DESARROLLO

Crear un Enum que permita crear instancias de dos Personajes diferentes: Mario y Luigi.

Ambos comparten similitudes, entonces mucho de su código podria ser similar, aqui entramos con el extensión y protocols.

Crearemos dos Enums, uno para Mario y otro para Luigi. Cada uno tendra codigo diferente pero sus protocolos deberán tener similitudes como el daño recibido, numero de vidas por defecto, un computed property en el extensión que permita diferenciar de que personaje se trata.

<details>
	<summary>Solucion</summary>
	<p>Comenzaremos definiendo un protocolo llamado CharacterType, que tendrá dos valores, Mario y Luigi. </p>
	
```
enum CharacterType {
	case Mario
	case Luigi
}
```

<p> Definiremos un protocolo para el daño, llamado Damage. </p>

```
protocol Damage {
  mutating func receivedDamage()
}
```

<p> Tendremos una implementación por defecto para manejar las vidas.  Crearemos el protocolo Lifes e integraremos una implementación por default.</p>

```
protocol Lifes: Damage {
  var numberLifes: Int { get set }
  mutating func receivedDamage()
}
extension Lifes {
  mutating func receivedDamage() {
    numberLifes = 0
  }
}
```

<p>Finalmente crearemos un modulo para cada personaje. Crearemos un protocolo para mario y uno para Luigi.</p>

```
// Mario
protocol MarioLifes: Lifes {
  var type: CharacterType { get }
}
extension MarioLifes {
  var type: CharacterType {
    .Mario
  }
}
```

<p>Para Luigi:</p>

```
// Luigi
protocol LuigiLifes: Lifes {
  var type: CharacterType { get }
}
extension LuigiLifes {
  var type: CharacterType {
    .Luigi
  }
}
```

<p>Estas dos implementaciones son la base para la creación de la definición de cada personaje, podemos implementar una Enumeración para agregar codigo diferente, asi ambos dejan de ser tan similares.</p>

```
// Implementation
enum Mario: MarioLifes {
  var numberLifes: Int {
    get {
      return 8
    }
    set {}
  }
}

enum Luigi: LuigiLifes {
  var numberLifes: Int {
    get {
      return 2
    }
    set {}
  }
}
```
	
</details> 

