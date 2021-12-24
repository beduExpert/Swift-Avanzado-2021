 
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
	
	
	let translation = recognizer.translation(in: self.imageView)
    if let view = recognizer.view {
      view.center = CGPoint(x: view.center.x + translation.x,
                            y: view.center.y + translation.y)
    }
    recognizer.setTranslation(CGPoint.zero, in: self.imageView)
    
    if recognizer.state == UIGestureRecognizer.State.began {
      scaleWithMove(scale: 1.5)
    }
    if recognizer.state == UIGestureRecognizer.State.ended {
      scaleWithMove(scale: 1.0)
    }
	

<p>La función que se encarga de escalar y animar la imágen es la siguiente: </p>
 
 	private func scaleWithMove(scale: CGFloat) { UIView.animate(withDuration: 0.5, animations: { () -> Void in
      		self.imageView?.transform = CGAffineTransform(scaleX: scale, y: scale)
   		 }, completion: nil )
 	 }
 
</details> 

