`Desarrollo Mobile` > `Swift Avanzado`
	
## Enums y Subscripts 

### OBJETIVO 

- Implementación de un Subscript en una clase y uso de Enums.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Crear un Enum para tipo de moneda.
Crear un extensión al enum que contenga un subscript.
El sig. código al ser ejecutado debe retornar un valor.

<details>
	<summary>Solución</summary>
<p> Comenzamos creando un Enum para los tipos de Divisas.</p>

```
enum Currency {
  case MXN
  case USD
}
```

<p> Creamos una extensión del Enum, aquí es donde implementaremos el código del Subscript.</p>
```
extension Currency {
	//...
}
```

<p> El subscript funcionara de la siguiente manera:</p>
<p> Un subscript tiene un parámetro de tipo String, este parámetro debe entrar en algun "caso".</p>
<p> El "Caso" coincide, entonces retornamos un valor de tipo String o Nil. </p>

```
  subscript(key: String) -> String? {
    if key == "Mexico" {
      return "Pesos Mexicanos MXN"
    }
    if key == "Dolares" {
      return "US Dolars"
    }
    return nil
  }
```
<p> El extensión quedaria de la sig. manera: </p>

```
extension Currency {
  subscript(key: String) -> String? {
    if key == "Mexico" {
      return "Pesos Mexicanos MXN"
    }
    if key == "Dolares" {
      return "US Dolars"
    }
    return nil
  }
}
```

<p> Probamos creando una instancia: </p>

```
var c = Currency.MXN
print(c["Mexico"])
```

</details> 




