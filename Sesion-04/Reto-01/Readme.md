 
`Desarrollo Mobile` > `Swift Avanzado`

	
## GCD Grand Central Dispatch

### OBJETIVO 

- Implementar un loader accionado por un tap a un boton, al terminar el tiempo se debera ocultar
- Es posible usar tambien un progress bar


#### REQUISITOS 

1. Xcode 11
2. Ejercicio-01
3. Ejercicio-02

#### DESARROLLO

Así como se llevo a cabo el uso de los hilos, implementar una animación simple con el uso de hilos.



<details>
	<summary>Solución</summary>
<p> Creamos el boton y los objectos (activity y progress bar)</p>
<p> Asignamos el codigo correspondiente</p>
<p> Eliminamos toda animación existente en el progressbar</p>

```	
// stop any current animation
        self.progressView.layer.sublayers?.forEach { $0.removeAllAnimations() }
        self.progressView.setProgress(0.0, animated: false)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.progressView.setProgress(1.0, animated: false)
            UIView.animate(withDuration: 10, delay: 0, options: [], animations: { [unowned self] in
                self.progressView.layoutIfNeeded()
            })
        }
```



</details> 
