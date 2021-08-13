`Desarrollo Mobile` > `Swift Avanzado`

## App Fotos Delegate y Main View

### OBJETIVO

- Mostrar la foto tomada en la vista principal, precisamente en el CollectionView.

#### REQUISITOS

1. Xcode 11
2. Proyecto de App terminado del Reto-03 de esta sesión.
3. iPhone con iOS 13 y cable lightning.
4. Cuenta de desarrollador de iOS, no es necesaria la version de paga.

#### DESARROLLO

1.- Una vez capturada una fotografia, esta pasara como `Data` en el ViewController que la implemente.

2.- Con base en el patrón `delegate` la vista principal estará escuchando el evento, entonces en esta clase se recibirá la variable de tipo `Data`.

3.- `Data` perce no es una imágen, hay que usar la clase 	`UIImage` para convertirla.

4.- Una vez convertida la imágen, agregarla a la lista de imágenes.

5.- Refrescar el CollectionView para que sea mostrada, el orden no es importante.


