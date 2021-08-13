 

`Desarrollo Mobile` > `Swift Avanzado`
	
## Pinch Gesture

### OBJETIVO 

-  Implementación de un Pinch Gesture.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Implementar el `PinchGestureRecognizer`.

Al igual que el Ejemplo-01.

1.- Crear un nuevo proyecto en Xcode con swift como lenguaje y Storyboard.

2.- Agregar un `UIImageView` al Storyboard y conectarlo con el `ViewController`, crear su IBOutlet correspondiente.

3.- Arrastrar un Gesture de tipo `PanGesture` al `UIImageview`. Este Gesture se puede encontrar en el Library.

4.- Crear una función de tipo `@IBAction` con un `sender` de tipo `PanGestureRecognizer`.

<details>
	<summary>Solución</summary>
	<p> La función que va conectada con el Gesture debe tener el parámetro de sender igual al gesture, es decir, si es un Pinch gesture, el parámetro debe ser UIPinchGestureRecognizer.</p>

```
  @IBAction func pinch(recognizer: UIPinchGestureRecognizer) {

   }
```

<p> Obtendremos la escala mediante el recognizer de la función: </p>

```
    let scale = recognizer.scale
```

<p> Mediante el CGAffineTransform crearemos una escala o cambio de tamaño. Luego este nuevo tamaño lo asginaremos al View en cuestión para modificarlo.</p>

```
@IBAction func pinch(recognizer: UIPinchGestureRecognizer) {
    let scale = recognizer.scale
    let transform = CGAffineTransform(scaleX: scale, y: scale)
    self.imageView.transform = transform
    //recognizer.scale = 1
}
```
</details> 