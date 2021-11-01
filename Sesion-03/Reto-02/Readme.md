 
`Desarrollo Mobile` > `Swift Avanzado`
	
## Generics, funciones y protocolos comparables

### OBJETIVO 

- Implementación de generics con parámetros que conformen un protocolo usando "Comparable".


#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Crearemos una función que permita encontrar el elemento de enmedio de un Array.

No importa el tipo de dato.

Además, este Generic conformará el Protocolo Comparable.

<details>
	<summary>Solucion</summary>
<p> Creamos una función común, con un generic de nombre T.</p>
	
```
func middleVal<T: Comparable>(array: [T]) -> T? {
 	//...
}
```

<p> Para el algoritmo es necesario comparar si es vacio, de ser vacio el resultado seria nulo.</p>
	
```
guard !array.isEmpty else { return nil }
```

<p> Será necesario ordenar el Array para luego obtener el número de elementos y encontrar el elemento central.</p>
	
```
array.sorted()[(array.count - 1)/2]
```

<p> Finalmente:</p>

```
func middleVal<T: Comparable>(array: [T]) -> T? {
  guard !array.isEmpty else { return nil }
  return array.sorted()[(array.count - 1)/2]
}
```

</details> 



