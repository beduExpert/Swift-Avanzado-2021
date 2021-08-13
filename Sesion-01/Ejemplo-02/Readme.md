`Desarrollo Mobile` > `Swift Avanzado`

## Extensions, Protocolos y Mutating

### OBJETIVO

- Reforzar el concepto de uso de Extensions con protocolos y mutating.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

Implementaremos un `Protocol`, un `Enum` y un `Extension`.

Llevaremos mediante un Exension implementación por defecto al Protocolo.

A la definición del Protocolo:
```
protocol MarioLifes {
  var numberLifes: Int { get set }
  mutating func receivedDamage()
}
```

Crearemos un Extension, con una implementación por defecto:
```
extension MarioLifes {
  mutating func receivedDamage() {
    numberLifes = 0
  }
}
```
Cabe mencionar que para poder editar el valor del property es necesario cambiarlo a `{ get set }`.

Por consiguiente, esto provocará que al conformar el protocolo se deba escribir el códgo correspondiente al get y set de dicho computed property.

```
enum Mario: MarioLifes {
  var numberLifes: Int {
    get {
      return 5
    }
    set {}
  }
}
```


