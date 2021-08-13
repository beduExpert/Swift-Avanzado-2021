`Desarrollo Mobile` > `Swift Avanzado`

## Código para descarga de imágenes.

### OBJETIVO 

- Armar una función que servirá de esqueleto para descargar imágenes de manera asíncrona.

#### REQUISITOS 

1. Xcode 11
2. Playgrounds

#### DESARROLLO

Código para descarga de imágenes.
Implementar un esqueleto que incluya un `queue`.
El `queue` tendrá prioridad de `.background`.
Y una **función** con un completion definido.
El queue ejecutará algún bloque, solo dejarlo indicado con `{}`.

<details>
	<summary>Solución</summary>
	<p> Comenzamos definiendo un DispatchQueue, agregando su tag o identificador, y un quality of service de tipo background. </p>

```
DispatchQueue(label: "com.bedu.download.images", qos: DispatchQoS.background)
```

<p> Definiremos una función con dos parámetros, uno de URL, y un completion. </p>
<p> El queue definido se encargará de ejecutar un bloque de codigo, dejaremos esto indicado. </p>
```
func loadImages(from url: URL, completion: (_ image: UIImage) -> Void) {
    downloadQueue.async(execute: {})
}
```
</details> 
