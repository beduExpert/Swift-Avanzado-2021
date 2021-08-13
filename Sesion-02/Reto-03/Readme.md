`Desarrollo Mobile` > `Swift Avanzado`

	
## Patron MVVM

### OBJETIVO 

-  Implementar el patrón delegate en conjunto con MVVM.

#### REQUISITOS 

1. Xcode 11
2. Ejemplo-03

#### DESARROLLO

Con base en el patrón delegate previamente visto, crear una pequeña app con las sig. capas:

	- ViewController
	- ViewModel

El ViewController y el ViewModel estarán conectados mediante el patrón delegate.


<details>
	<summary>Solucion</summary>
	<p>Al proyecto del Ejemplo-03, agregamos una clase llamada ViewModel</p>
	<p>A esta clase movemos el codigo de protocolos, IDs, y la función para ir a la sig. vista.</p>
	
```
	protocol Message {
  func message(_ text: String)
}

class ViewModel {
  
  private let storyboardName = "Main"
  private let viewControllerB = "ViewControllerB"
  
  func gotoNextView(delegate: Message) -> ViewControllerB? {
    if let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: viewControllerB) as? ViewControllerB {
      vc.delegatMessage = delegate
      return vc
    }
    return nil
  }
}
```
<p>De regreso al VC, creamos una instancia del ViewModel.</p>

```
let viewModel: ViewModel = ViewModel()
```

<p>El código del IBAction se reduce como sigue: </p>

```
 @IBAction func goToVC2(_ sender: Any) {
    guard let vc = viewModel.gotoNextView(delegate: self) else { return  }
    present(vc, animated: true, completion: nil)
  }
```
</details> 
