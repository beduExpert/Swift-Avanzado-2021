
`Desarrollo Mobile` > `Swift Avanzado`

## Implementación de mas gestures

### OBJETIVO 

- Implementar alguno o ambos gestures tales como `UIPinchGestureRecognizer` o bien `UIScreenEdgePanGestureRecognizer`.

#### REQUISITOS 

1. Xcode 11 

#### DESARROLLO

Implementar el gesto de Pinch y el gesto de ScreenEdgePan.

Con lo visto en los ejemplos anteriores se deberá ser capaz de resolver este reto.
La idea es implementar alguno o ambos gestures.

<details>
	<summary>Solución</summary>
	<p>Crearemos un proyecto con un ImageView al cuál le agregaremos un gesture tipo Pinch. </p>
	    <p> A dicho view le habilitamos el property para que pueda detectar interacciones touch.</p>
        <p> Creamos la acción para insertar el código e imprimir un mensaje cuando se disparen cada uno de los estados del gesto.</p>
        <p> Agregaremos el ScreenEdgePanGestureRecognizer al view principal y creamos la acción, declaramos un arreglo de colores y en la acción seleccionamos un color random para establecer el fondo</p>
        ```
            if sender.state == .ended {
            let randomInt = Int.random(in: 0..<listColors.count)
            sender.view?.backgroundColor = listColors [randomInt]
            }
        ```
	
</details> 
