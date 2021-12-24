
`Desarrollo Mobile` > `Swift Avanzado`

## Implementación de mas gestures

### OBJETIVO 

- Implementar alguno o ambos gestures tales como `UIPinchGestureRecognizer` o bien `UIScreenEdgePanGestureRecognizer`.

#### REQUISITOS 

1. Xcode 11 

#### DESARROLLO

Implementar el gesto de Pinch y el gesto de ScreenEdgePan.

Con lo visto en los ejemplos anteriores se deberá ser capaz de resolver este reto.
La idea es que al utilizar el gesto pinch se muestre en la consola el cambio de los eventos began, changed y ended.
Con el gesto ScreenPanGesture es necesario cambiar el color de fondo.

<details>
	<summary>Solución</summary>
<ol></br>
<li>Crearemos un proyecto con un UIImageView al cuál le agregaremos un gesture tipo Pinch y uno de tipo ScreenEdgePan.</li>
<li>A dicho view le habilitamos la propiedad para que pueda detectar interacciones touch.</li>
<li>Creamos la acción del gesto Pinch para insertar el siguiente código:</li>
	
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began {
          print("Began")
        } else if sender.state == .changed {
          print("Changed")
        } else if sender.state == .ended {
          print("Ended")
        }
    }
<li>Declaramos un arreglo de colores para utilizarlo en la acción del ScreenEdgePan</li>
	
	let listColors = [ UIColor(#colorLiteral(red: 0, 
						green: 1, 
						blue: 0.4945596457, 
						alpha: 1)) , 
			   UIColor(#colorLiteral(red: 0, 
						green: 0.6747120619, 
						blue: 0.7015240788, 
						alpha: 1)), 
			   UIColor(#colorLiteral(red: 0.7455447912, 
						green: 0.3212659955, 
						blue: 0.3475470543, 
						alpha: 1))]
	
<li>Creamos la acción del gesto ScreenEdgePan e insertamos el siguiente código:</li>
	
	   @IBAction func ScreenEdgeGestureChangeColor(_ sender: UIScreenEdgePanGestureRecognizer) {
        if sender.state == .ended {
            let randomInt = Int.random(in: 0..<listColors.count)
            sender.view?.backgroundColor = listColors [randomInt]
        }
    }
								 
</br>
</ol>
</details> 
