 
`Desarrollo Mobile` > `Swift Avanzado`

	
## Protocol extension en UITableViewCell

### OBJETIVO 

- Crear un Extensión que pueda ser implementado por una clase únicamente.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Implementar un `Extensión` de este protocolo para que permita saber los valores de la clase que lo conforme.

El extensión será de este protocolo:

```
protocol RegistrableCell: class {
	static var nibName: String { get }
	static var reuseId: String { get {
}
```

Las variables serán `computed properties`.

Al **cell** que conforme este protocolo se podran acceder a los valores de **nibName** y **id** fácilmente. 

Entonces:
¿cual seria la manera de registrarlo en un tableview fácilmente?

<details>
	<summary>Solucion</summary>
	<p> Creamos un proyecto nuevo en Xcode, con un TableView.</p>
	<p> Creamos extensión del protocolo. Ya que el protocolo es de tipo class, solo clases pueden conformarlo. La extensión usara Self para acceder a los properties de la clase que conforme.</p>

```
extension RegistrableCell {
  
  static var nibName: String {
    return String(describing: self)
  }
  
  static var reuseId: String {
    return String(describing: self)
  }
```
 
<p> Para simplificar el registro de celdas, pasaremos el TableView como parámetro. Agregamos una nueva función.</p>
	
```
static func register(in tableView: UITableView) {
    tableView.register(UINib(nibName: Self.nibName, bundle: nil),
                       forCellReuseIdentifier: Self.reuseId)
  }
```
<p> El código final: </p>

```
protocol RegistrableCell: class {
  static var nibName: String { get }
  static var reuseId: String { get }
}

extension RegistrableCell {
  
  static var nibName: String {
    return String(describing: self)
  }
  
  static var reuseId: String {
    return String(describing: self)
  }
  
  static func register(in tableView: UITableView) {
    tableView.register(UINib(nibName: Self.nibName, bundle: nil),
                       forCellReuseIdentifier: Self.reuseId)
  }
}
```
  
</details> 
