`Desarrollo Mobile` > `Swift Avanzado`


## Pasando datos al ViewModel

### OBJETIVO

- Aplicando lo visto en el `Ejemplo-01` enviaremos parametros con los cuales podremos interactuar en nuestro viewmodel.

#### REQUISITOS

1. Xcode 11

#### DESARROLLO

Siguiendo el flujo del ejemplo anterior, crearemos un protocolo con una funcion la cual nos dira cuantos segundos tenemos en un numero determinado de años, este numero lo enviaremos como un parametroa nuestro viewmodel

1.- Comenzaremos creando un protocolo con la variable para el numero de años asi como la funcion que nos ayudara a calcular los segundos:

```
protocol SegundosPorAniosProtocol {
    var anios:Int { get set }
    func calcularSegundos() -> Int
}
```

2.- Creamos el viewmodel en el que incorporaremos la logica.

```
class SegundosClase: SegundosPorAniosProtocol {
    var anios: Int = Int()
        
    func calcularSegundos() -> Int {
        let dias = 365
        let horas = 24
        let segundos = 3600
        
        return dias * horas * segundos * anios
    }
}
```

3.- Vemos que tenemos la variable `anios` en la cual pasaremos el parametro que necesitamos, en este ejemplo se dejo como una variable aparte ya que se podría incorporar dentro de la funcion.

```
let segundosPorAnios = SegundosClase()
segundosPorAnios.anios = 4
print("El numero de segundos por los \(segundosPorAnios.anios) años son: \(segundosPorAnios.calcularSegundos())")
```
 
