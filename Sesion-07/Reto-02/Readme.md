 
`Desarrollo Mobile` > `Swift Avanzado`

## Reto gesture animations

### OBJETIVO 

- Implementación de un `PanGesture`.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Utilizar `UIView` Animations en conjunto con Gestures.

* Al arrastrar una imagen, esta debe de aumentar de tamaño.
* Al soltar la imagen, debe de regresar a su tamaño original.

![](0.gif)

<details>
	<summary>Solucion</summary>
	<p> De igual forma que en los ejemplos y el reto anterior, es necesario agregar un UIImageView en el View Controller y un gesto tipo PAN.</p>
	<p> Agregar la acción del gesto en el ViewController con parámetro de tipo UIPanGestureRecognizer.</p>
	<p> Implementamos en la acción el movimiento al arrastrar la imagen y dos condiciones "if" que detecten el inicio y fin del gesture como se muestra a continuación:</p>
	
	@IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if let view = sender.view {
          view.center = CGPoint(x: view.center.x + translation.x,
                                y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: view)
        
        if sender.state == UIGestureRecognizer.State.began {
            scaleWithMove(scale: 1.5,sender: sender)
        }
        if sender.state == UIGestureRecognizer.State.ended {
          scaleWithMove(scale: 1.0,sender: sender)
        }
    	}
 
<p>La función que se encarga de escalar y animar la imágen es la siguiente: </p>
 
  	private func scaleWithMove(scale: CGFloat, sender: UIPanGestureRecognizer ) {
   		UIView.animate(withDuration: 0.5, animations: { () -> Void in
        		sender.view?.transform = CGAffineTransform(scaleX: scale, y: scale)
    		}, completion: nil )
  	}
 
</details> 

