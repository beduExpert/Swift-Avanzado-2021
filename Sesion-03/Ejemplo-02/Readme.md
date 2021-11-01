`Desarrollo Mobile` > `Swift Avanzado`

## Generics y múltiples parámetros

### OBJETIVO

- Implementación de generics con múltiples parámetros.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

Comenzamos a crear una función comun de dos parámetros, esta función recibirá el mismo tipo de dato en ambos parámetros. ya que no queremos crear una función para manejar Ints y otra para manejar Strings (por dar un ejemplo), creamos una función generica.

```
func anotherMethod<T> (first: T, second: T) {
  print("Mismo tipo de datos")
}
```

Ahora, queremos manejar tipos de datos diferentes, creamos una variante de Generic utilizando DOS generics, usar T para ek primero y U para el segundo.

```
func anotherMethod<T, U> (first: T, second: U) {
   print("Distinto tipo de datos")
}
```

Finalmente probamos dichas funciones:

```
// Implementation
anotherMethod(first: 123, second: 456)
anotherMethod(first: 123, second: "456")
```

