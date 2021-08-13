
`Desarrollo Mobile` > `Swift Avanzado`

## Implementación de parámetros con @escaping.

### OBJETIVO

- Introducir la sintaxis básica y funcionamiento de esta palabra reservada.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

Comenzamos a partir del esqueleto de función definido en el Reto-01:

```
import UIKit

protocol RequestImages {}
struct ImageProvider: RequestImages {
  fileprivate let downloadQueue =
    DispatchQueue(label: "com.bedu.download.images", qos: DispatchQoS.background)
  
  //MARK: - Fetch image from URL and Images cache
  func loadImages(from url: URL, completion: (_ image: UIImage) -> Void) {
    downloadQueue.async(execute: {})
  }
}
```

A partir de esta función, ejecutaremos la acción de desargar imagen.
Usamos `Data` y le pasamos como parámetro una `url`:

```
do {
   let data = try Data(contentsOf: url)
    
} catch { print("Could not load URL: \(url): \(error)") }
```

Posteriormente, manejaremos la respuesta, si es exitosa tendremos nuestra imagen, la cual gracias a un dispatchQueue convertiremos en Imagen.

```
if let image = UIImage(data: data) {
   DispatchQueue.main.async { completion(image) }
} else { print("Could not decode image") }
```