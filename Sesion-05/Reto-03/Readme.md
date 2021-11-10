
`Desarrollo Mobile` > `Swift Avanzado`

## Spring Animations

### OBJETIVO

- Implementación de animaciones utilizando SpringAnimations.

#### REQUISITOS

0. Ejemplo 03
1. Xcode 11

#### DESARROLLO

Implementar una App con dos ImageViews.

Aplicar un Animate closure para hacer diferentes tipos de animaciones como traslación, escalamiento y rotación.

![](1.gif)

1.- Creamo sun nuevo proyecto con Swift como lenguaje.

2.- Agregamos al Main storyboard dos UIImageViews.

3.- Conectamos con el ViewController los IBOutlets.

4.- Implementamos un bloque de UIView para animations.

```
UIView.animate(withDuration: 2.0, animations: { () -> Void in
      self.image1.center = self.view.center
    })
```
5.- Continuaremos con los animations Pero esta vez con Spring animations.

6.- Definimos algunos Transforms.

```
let translate = CGAffineTransform(translationX: 50, y: 250)
let rotate = CGAffineTransform(rotationAngle: 360)
let scale = CGAffineTransform(scaleX: 2, y: 2) 
```

7.- Implementamos los Transforms dentro de un bloque de `UIView `animations.

```
func springAnimation() {
    UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8,
                   options: .curveEaseInOut,
                   animations: { () -> Void in
                    // Move "appleImage" from current position to center
                    self.image1.center = self.view.center
                    //You can even combine 2 animations together.
                    self.image2.transform = self.translate.concatenating(self.scale)
    }, completion: nil)
  }
```
