 
`Desarrollo Mobile` > `Swift Avanzado`

	
## Protocol extension en UITableView

### OBJETIVO 

- Crear un Extensión de nuestro UIViewController para que pueda ser implementado por una clase únicamente.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Implementar un `Extensión` de este protocolo para que permita saber los valores de la clase que lo conforme.
Implementar un tipo de celda del tipo UITableViewCell en la cual tendremos imagenes, textos y botones
Cargar 3 imagenes a nuestra galeria de Assets

Crearemos nuestro TableViewCell ya que podremos darle formato a nuestros campos quedando de la siguiente manera:

```
class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var texto1: UILabel!
    @IBOutlet weak var texto2: UILabel!
        
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
En nuestro ViewController agregamos un elemento tipo TableView y le añadimos una celda, necesitamos agregar un identificador a la celda, esta por comodidad le llamaremos `cell`


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
 
<p> Agregamos unos datos para probar su funcionamiento, para esto necesitamos una estructura para generar nuestro listado de datos, esto de la siguiente forma:.</p>
	
```
struct MyObject {
    var image:String
    var text1:String
    var text2:String
}
```
	
<p> Como siguiente paso necesitamos cargar datos para usar, estos los declaramos en una variable `data` </p>
```
var data = [MyObject]()
```
<p> Necesitamos ingresarle valores, para el ejemplo usaremos los nombres de las imagenes cargadas y los textos que queramos incluir, quedando de la siguiente forms: </p>
```
self.data.append(MyObject(image: "1", text1: "Titulo 1", text2: "Subtitulo 1"))
self.data.append(MyObject(image: "2", text1: "Titulo 2", text2: "Subtitulo 2"))
self.data.append(MyObject(image: "3", text1: "Titulo 3", text2: "Subtitulo 3"))
```


<p> El código final: </p>

```
import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var tableView: UITableView!
    
    var data = [MyObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.FillData()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
    }

    func FillData() {
        self.data.append(MyObject(image: "1", text1: "Titulo 1", text2: "Subtitulo 1"))
        self.data.append(MyObject(image: "2", text1: "Titulo 2", text2: "Subtitulo 2"))
        self.data.append(MyObject(image: "3", text1: "Titulo 3", text2: "Subtitulo 3"))

        self.tableView.reloadData()

    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? MyTableViewCell else {return UITableViewCell()}
        cell.texto1.text = data[indexPath.row].text1
        cell.texto2.text = data[indexPath.row].text2
        cell.imagen.image = UIImage(named: data[indexPath.row].image)

        return cell
    }
}

struct MyObject {
    var image:String
    var text1:String
    var text2:String
}

	
	
class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var texto1: UILabel!
    @IBOutlet weak var texto2: UILabel!
    
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
  
</details> 
