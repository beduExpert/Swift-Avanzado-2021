`Desarrollo Mobile` > `Swift Avanzado`

## Completion Handler


### OBJETIVO

- Armar una función que servirá de esqueleto para descargar imágenes de manera asíncrona.

#### REQUISITOS

1. Lo necesario para desarrollar el ejemplo o el Reto

#### DESARROLLO


Declarar un `Dispatch Queue` de prioridad `.background`.
Crear la funcion, con parametros `URL` y `completion`.
El completion es `@escaping (_ image: UIImage) -> Void`.

Comenzamos declarando una variable de tipo ` (Bool) -> Void`, esta es asignada a una variable. A esto le llamaremos bloque.
Dentro del bloque ejecutaremos alguna tarea de cumplirse la condición previa en el IF.

```
let handlerBlock: (Bool) -> Void = { value in
  if value {
    print("Condicion se cumple")
  }
}
```

Declaramos una función que tendrá como parámetro un completion. El completion ejecutará el bloque previamente definido, por lo tanto es necesario definir dicho completion del mismo tipo para asegurar compatibilidad.

```
func functionHandler(completion: (Bool) -> Void) {
  completion(false)
}
```

Finalmente, ejecutamos la función:

```
functionHandler { (doneWork) in
  if doneWork {
    print("Condición SI se cumple")
  } else {
    print("No...")
  }
}
```

