`Desarrollo Mobile` > `Swift Avanzado`

## Entendimiento async/await

### OBJETIVO

- En esta actividad, crearemos dos funciones para ejemplificar el uso de async y await con el manejo de hilos.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

- Crea un nuevo proyecto en xCode, con un tipo de vista única.
- Agregar un botón simple con el que dispararemos el uso de los hilos de forma básica.
- Agregar acción al botón donde cargaremos 2 métodos similares, en ellos probaremos el async.let y el await para ver su funcionamiento.
- Simularemos con un sleep() la demora en la carga de imagenes
- En el segundo metodo agregamos mas imagenes para probar su funcionamiento en paralelo
- Usaremos el tipo de cola Background
- Imprime el resultado

Comenzamos creando nuestro boton y asignandole accion
```
@IBAction func asyncTest(_ sender: UIButton)  {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.loadPhotos()
                self.loadPhotos2()
            })
        }
    }
```

Creamos nuestros 2 metodos que haran la funcion de buscar las imagenes:

```
  func loadPhotos()  {
        Task {
             let firstPhoto =  await downloadPhoto(time: 0.0)
             let secondPhoto = await  downloadPhoto(time: 2.0)
             let thirdPhoto =  await downloadPhoto(time: 1.0)

            let photos = [firstPhoto, secondPhoto, thirdPhoto]
            print(photos)
        }
    }
    
    func loadPhotos2()  {
        Task {
             async let firstPhoto = downloadPhoto(time: 0.0)
             async let secondPhoto = downloadPhoto(time: 2.0)
            async let thirdPhoto = downloadPhoto(time: 1.0)
            async let _4Photo = downloadPhoto(time: 1.0)
            async let _5Photo = downloadPhoto(time: 1.0)

            let photos = await [firstPhoto, secondPhoto, thirdPhoto, _4Photo, _5Photo]
            print(photos)
        }
    }
```

Simulamos con otra funcion la espera de la carga

```
 func downloadPhoto(time: Double) async -> String {
 
        sleep(UInt32(time))
        return "Photo: \(time)"
    }
```





