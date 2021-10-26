 
`Desarrollo Mobile` > `Swift Avanzado`

## Reto Protocolos

### OBJETIVO 

- Generar nuestros protocolos para implementar funciones especificas dentro de nuestros viewmodel.

#### REQUISITOS 

1. Xcode

#### DESARROLLO

Con base en el `Ejemplo-01`, implementar un protocolo con 3 funciones las cuales nos ayuden a:
- Generar nombre completo
- Obtener nombre
- Generar nombre completo comenzando por apellido


<details>
	<summary>Solucion</summary>
	<p>Creamos el protocolo con las 3 funciones que necesitaremos, todas regresaran un String como respuesta.</p>
	<p>Creamos nuestra clase que sera nuestro viewmodel para adaptar el modelo MVVM.</p>
	<p>Como suponemos que ya tenemos los datos crearemos las constantes a nuestro viewmodel con nuestro nombre y apellido.</p>
	<p>En nuestro viewmodel instanciamos el protocolo y agregamos las funciones.</p>
	<p>Agregamos el codigo a implementar y aplicamos la referencia para invocar las clases necesarias.</p>
	<p>El código a implementar seria el siguiente: </p>
 
```
import UIKit

protocol AccesosNombreProtocolo {
    func obtenerNombreCompleto() -> String
    func obtenerNombre() -> String
    func obtenerNombreCompletoPorApellido() -> String
}

class MiViewModel: AccesosNombreProtocolo {
    var nombre: String = "Alejandro"
    var apellido: String = "Hernandez"
        
    func obtenerNombreCompleto() -> String {
        return "\(nombre) \(apellido)"
    }
    
    func obtenerNombre() -> String {
        return nombre
    }
    
    func obtenerNombreCompletoPorApellido() -> String {
        return "\(apellido) \(nombre)"
    }
}

let accion = MiViewModel()
print("El nombre es: \(accion.obtenerNombre())")
print("El nombre completo es: \(accion.obtenerNombreCompleto())")
print("El nombre completo iniciando con apellido es: \(accion.obtenerNombreCompletoPorApellido())")
```

 <p>vemos que en nuestro viewmodel podemos hacer los cambios en nuestra logica de negocio lo que genera la separacion de la vista. </p>
</details> 
