
`Desarrollo Mobile` > `Swift Avanzado`


## Eliminar datos almacenados por UserDefaults

### OBJETIVO

- Conocer las operaciones de UserDefaults.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

1.- De los datos almacenados en el `Ejemplo-01`.
 
2.- Agregar un boton que permita limpiar el `UserDefaults`.

3.- Opcionalmente:
Guardar los datos como un Array.

<details>
        <summary>Solución</summary>
        <p>Agregamos un Button en el ViewController y lo conectamos con su respectivo IBAction.</p>
        <p>Dentro de ese IBAction usaremos la función remove proporcionada por UserDefaults. </p>
```
    UserDefaults.standard.removeObject(forKey: key1)
```
</details>


