`Desarrollo Mobile` > `Swift Avanzado`

## Animación con UIKit


### OBJETIVO

- Implementar animaciones en un proyecto.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO


En esta actividad, crearás los siguientes elementos solicitados:

Crea un nuevo proyecto en xCode, con un tipo de vista única.
Agregar un botón simple con el que dispararemos la animación
Agregar una vista (View) que será la que contendrá nuestra animación.
Aplicar 3 animaciones (Color, tamaño y ubicación) en la misma acción

Iniciamos creando nuestro botón y un View, los agregaremos a nuestros outlets
```
@IBOutlet weak var animationView: UIView!
@IBOutlet weak var loginButton: UIButton!
```

Dentro de la accion de nuestro botón agregaremos nuestra animación

```
@IBAction func animationAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.animationView.backgroundColor = .red
            self.animationView.frame.size.width += 10
            self.animationView.frame.size.height += 10
            self.animationView.center.x += 40
        }
        
    }
```

Finalmente, ejecutamos y vemos el resultado:

```
class ViewController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func animationAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.animationView.backgroundColor = .red
            self.animationView.frame.size.width += 10
            self.animationView.frame.size.height += 10
            self.animationView.center.x += 40
        }
        
    }
    
}

```
