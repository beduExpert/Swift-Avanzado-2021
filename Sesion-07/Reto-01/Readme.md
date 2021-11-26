 

`Desarrollo Mobile` > `Swift Avanzado`
	
## Brinca Mario

### OBJETIVO 

-  Implementacion de un PAN y un TAP.
-  Poder mover la imagen de Mario con el dedo (PAN) y al darle TAP hacer que brinque

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Implementar el `PanGestureRecognizer`, y `TapGestureRecognizer`.

Al igual que el Ejemplo-01.

1.- Crear un nuevo proyecto en Xcode con swift como lenguaje y Storyboard.

2.- Agregar un `UIImageView` al Storyboard y conectarlo con el `ViewController`, crear su IBOutlet correspondiente.

3.- Arrastrar un Gesture de tipo `PanGesture` al `UIImageview`. Este Gesture se puede encontrar en el Library.

4.- Crear una función de tipo `@IBAction` con un `sender` de tipo `PanGestureRecognizer`.

5.- Agrega por codigo el `TapGestureRecognizer'

<details>
	<summary>Solución</summary>
	<p> La función que va conectada con el Gesture debe tener el parámetro de sender igual al gesture, es decir, si es un Pan gesture, el parámetro debe ser UIPanGestureRecognizer.</p>

```
  @IBAction func handlePan(_ sender: UIPanGestureRecognizer){

   }
```


<p> Nuestro codigo del PAN nos ayudara a ver el funcionamiento al momento de arrastrar la imagen.</p>

```
@IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        
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
</details> 
