
`Desarrollo Mobile` > `Swift Avanzado`

## Acciones al finalizar una animación.

### OBJETIVO

- Implementar acciones al finalizar una animación.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

Tomamos como referencia el ejercicio 01, apartir de ahi crearemos nuestros cambios para el complementar nuestra animación
Aplicamos una animación simple de cambio de color, al finalizar mandar un mensaje tipo Alert con una accion la cual desencadenara una animacion diferente aumentando el tamaño, finalizando esta animación regresar al tamaño anterior.

En nuestro segundo bloque de la animación incluiremos un alert el cual al presionar Yes nos hara una animación para ampliar nuestra forma, esto quedaría de la siguiente forma:

```
alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                
                UIView.animate(withDuration: 1, delay: 0.5) {
                    self.animationView.frame.size.width += 20
                    self.animationView.frame.size.height += 20
                }
                
            }))
```

Ahora solo nos resta compilar y probar

```
UIView.animate(withDuration: 2, delay: 0.5, animations: {
            self.animationView.backgroundColor = .red
        }) { _ in
            let alert = UIAlertController(title: "Fin de animación", message: "Hagamos la siguiente animación", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                
                UIView.animate(withDuration: 1, delay: 0.5) {
                    self.animationView.frame.size.width += 20
                    self.animationView.frame.size.height += 20
                }
                
            }))

            self.present(alert, animated: true)
            
        }
```
