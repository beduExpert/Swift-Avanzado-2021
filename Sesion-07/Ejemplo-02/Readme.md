
`Desarrollo Mobile` > `Swift Avanzado`

## Gesture Methods

### OBJETIVO

- Implementación de los estados de un gesture recognizer.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

1.- Implementaremos los métodos de `UIGestureRecognizer` para detectar cuando iniciamos/terminamos la interacción.

2.- Cada recognizer tiene un property llamado `state`.

3.- Comparar el `state` del `recognizer` de la función asociada al Gesture. Luego con el State "genera" o valor general del UIGestureRecognizer.

4.- Para implementar con el Pan Gesture:

```
  @IBAction func pan(sender: UIPanGestureRecognizer) {
    if sender.state == UIGestureRecognizer.State.began {
      print("Inicio gesture")
    }
    else if sender.state == UIGestureRecognizer.State.ended {
      print("fin gesture")
    }
  }
```

