 

`Desarrollo Mobile` > `Swift Avanzado`
	
## Brinca Mario

### OBJETIVO 

-  Implementacion de un PAN, un TAP y un LONGPRESS.
-  Poder mover la imagen de Mario con el dedo (PAN), al darle TAP hacer que brinque y hacerlo grande al presionarlo durante mas tiempo.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Implementar el `PanGestureRecognizer`, el `TapGestureRecognizer` y el `LongPressRecognizer`.

1.- Crear un nuevo proyecto en Xcode con swift como lenguaje y Storyboard.

2.- Agregar un `UIImageView` al ViewController en el Storyboard .

3.- Arrastrar los tres gestos de tipo `PanGesture`, `TapGestureRecognizer` y `LongPressRecognizer` al `UIImageview`. Estos gestos se encuentran en la librería.

4.- Crear una acción para cada uno de los gestos, arrastrandolos y presionando Ctrl.

5.- Agrega el código en la acción del `PanGestureRecognizer'

```
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
```

6.- Agrega el código en la acción del `TapGestureRecognizer'

```
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
```


7.- Agrega el código en la acción del `LongPressGestureRecognizer'

```
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
```
