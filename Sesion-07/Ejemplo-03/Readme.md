
`Desarrollo Mobile` > `Swift Avanzado`

## Programmatic gestures

### OBJETIVO

- Implementar gestures usando Storyboard.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

1. Implementar las acciones del gesto Pan desde el Storyboard.

2. Basarse en el Ejemplo-01 y Ejemplo-02.

3. Por medio del `sender` obtener el valor del `state` y compararlo con los tres mas importantes como `began` o `ended`.

4. El IF-ELSE debe implementarse. La idea detrás de esto es “debuggear” los estados, ver como funciona cada uno de ellos al interacturar con los gestures

```swift
@IBAction func didPan(_ sender: UIPanGestureRecognizer) {
  if sender.state == .began {
    print("Began")
  } else if sender.state == .changed {
    print("Changed")
  } else if sender.state == .ended {
    print("Ended")
  }
}

