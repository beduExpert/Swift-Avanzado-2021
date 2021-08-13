 
`Desarrollo Mobile` > `Swift Avanzado`

	
## Init y throws

### OBJETIVO 

- Implementar una estructura que tenga un inicializador/constructor con throws.


#### REQUISITOS 

1. Xcode 11
2. Playgrounds 

#### DESARROLLO

Así como implementamos una función con throws.

Implementar una estructura que tenga un inicializador/constructor con throws.

La estructura está conformada:

- Nombre struct: ComprarDulces
- Init: NombreDulce, Tienda.

<details>
	<summary>Solución</summary>
<p> Creamos la estructura de nombre ComprarDulces</p>

```
struct ComprarDulces {
 //...
}
```	

<p> Así como una función, agregamos el 	throws` al final de la función. </p>
	
```
init(nombre: String, tienda: Oxxo) throws {
}
```

<p> Finalmente la implementación utilizando un *try* simple:</p>

```
struct ComprarDulces {
  init(nombre: String, tienda: Oxxo) throws {
    try tienda.comprar(item: nombre)
  }
}
```

</details> 