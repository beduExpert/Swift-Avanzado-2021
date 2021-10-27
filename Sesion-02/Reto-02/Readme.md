 
`Desarrollo Mobile` > `Swift Avanzado`

	
## Protocol extension en UITableView

### OBJETIVO 

- Crear un Extensión de nuestro UIViewController para que pueda ser implementado por una clase únicamente.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Implementar un `Extensión` de este protocolo para que permita saber los valores de la clase que lo conforme.
Implementar un tipo de celda del tipo UITableViewCell en la cual tendremos imagenes, textos y botones

El extensión será de este protocolo:

```
class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var texto1: UILabel!
    @IBOutlet weak var texto2: UILabel!
    @IBOutlet weak var boton: UIButton!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
}
```

Necesitamos agregar un identificador a la celda, esta por comodidad le llamaremos `cell`


Al **cell** que conforme este protocolo se podran acceder a los valores que le agreguemos fácilmente. 

Entonces:
¿cual seria la manera de utilizarlo facilmente en nuestra vista?

<details>
	<summary>Solucion</summary>
	<p> Creamos un proyecto nuevo en Xcode, y agregamos un TableView en nuestro ViewController.</p>
	<p> Creamos una extencion donde tengamos las funciones del `TableView`.</p>
	<p> Agregamos el delegate y el datasource a la extención.</p>

```
extension MyViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {        
        return UITableViewCell()
    }
    
    
}
```
 
<p> Agregamos unos datos para probar su funcionamiento.</p>
	

```
<p> El código final: </p>

```
class MusicListViewController: UIViewController {

    //@IBOutlet weak var showButton: UIButton!

    var data:[String] = [
        "Elemento 1", "Elemento 2", "Elemento 3"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
    }
}


extension MusicListViewController: UITableViewDelegate, UITableViewDataSource {    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell else {return UITableViewCell()}
        cell.texto1.text = data[indexPath.row]

        return cell
    }
}

```
  
</details> 
