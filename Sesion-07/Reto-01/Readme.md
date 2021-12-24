 

`Desarrollo Mobile` > `Swift Avanzado`
	
## Brinca Mario

### OBJETIVO 

-  Implementacion de un gesto PAN, un TAP y un LONGPRESS.
-  Poder mover la imagen de Mario con el dedo (PAN), al darle TAP hacer que brinque y hacerlo grande al presionarlo durante mas tiempo.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Implementar el `PanGestureRecognizer`, el `TapGestureRecognizer` y el `LongPressRecognizer` a una imagen de mario para poder interactuar con los gestos y el movimiento de la imagen.

* al mantener presionada la imagen es necesario que se active el gesto **PAN** y poder arrastrar a mario(la imagen) por la pantalla
* al dar un **TAP** es necesario que mario(la imagen) brinque y regrese.
* al ejecutar un **LONGPRESS** es necesario que mario(la imagen) crezca de tamaño y al soltaro que regrese a su tamaño original. 

<details>
	<summary>Solución</summary>
	<ol>
		</br>
	<li>Crearemos un proyecto con un UIImageView en el ViewController, al cuál le agregaremos la imagen de mario y los siguientes gestos:</li>
		<ul>
		<li> Pan Gesture Recognizer. </li>
		<li> Tap Gesture Recognizer. </li>
		<li> Long Press Gesture Recognizer. </li>
		</ul>
	</br>
	<li>Creamos cada una de las acciones arrastransolos y presionando Ctrl</li>
		<ul>
		<li> Al arrastrar el Pan Gesture Recognizer creamos la acción didPan </li>
			
        @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            print("Inicio gesture")
        }
        else if sender.state == UIGestureRecognizer.State.ended {
            print("fin gesture")
        }
        let translation = sender.translation(in: view)
        guard let gestureView = sender.view else {
            return
        }
        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )
        sender.setTranslation(.zero, in: view)
    }

<li> Al arrastrar el Tap Gesture Recognizer creamos la acción didTapView con el siguiente código:</li>


	@IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.4, delay: 0.2,
                       animations: {
            sender.view?.alpha = 0.5
            sender.view?.center.y = (sender.view?.center.y)! - 40
                }) { _ in
                    UIView.animate(withDuration: 0.4, delay: 0.1) {
                        sender.view?.center.y = (sender.view?.center.y)! + 20
                        sender.view?.alpha = 1.0
                    }
                }
    }
			

			
<li> Al arrastrar el Long Press Gesture Recognizer creamos la acción handleLongPress con el siguiente código:</li>		
	
	@IBAction func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        guard let gestureView = sender.view else {
            return
        }
            
        if sender.state == UIGestureRecognizer.State.began {
            print("Inicio gesture")
            gestureView.frame.size.height += 50
            gestureView.frame.size.width += 50
        }
        else if sender.state == UIGestureRecognizer.State.ended {
            print("fin gesture")
            gestureView.frame.size.height -= 50
            gestureView.frame.size.width -= 50
        }
    }
					
</ul>
	</ol>

</details> 

