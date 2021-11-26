
`Desarrollo Mobile` > `Swift Avanzado`

## Implementación de mas gestures

### OBJETIVO 

- Implementar alguno o ambos gestures tales como `UIPinchGestureRecognizer` o bien `UIScreenEdgePanGestureRecognizer`.

#### REQUISITOS 

1. Xcode 11 

#### DESARROLLO

Implementar de manera programática el gesto de Pinch y el gesto de ScreenEdgePan.

Con lo visto en los ejemplos anteriores se deberá ser capaz de resolver este reto.
La idea es implementar alguno o ambos gestures.

<details>
	<summary>Solución</summary>
	<p>Crearemos un proyecto con un View o ImageView al cuál le agregaremos uno o dos gestures. </p>
	<p> A dicho view le habilitamos el property para que pueda detectar interacciones touch.</p>

```
	imageView.isMultipleTouchEnabled = true
	imageView.isUserInteractionEnabled = true
```
<p> Creamos un property de tipo Gesture, el que deseemos implementar. puede ser PinchGesture o PanGesture.</p>

```
	let pinchGesture = UIPinchGestureRecognizer(target: self,
                                                      action: 	#selector(pinchGesture(sender:)))
```                                                
<p> Al Image agregamos el Gesture:</p>
	
```
imageView.addGestureRecognizer(pinchGesture)
``` 
</details> 
