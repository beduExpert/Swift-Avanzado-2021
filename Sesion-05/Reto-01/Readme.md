`Desarrollo Mobile` > `Swift Avanzado`

## Código para manejo de errores con animación.

### OBJETIVO 

- Desarrolla una interfaz de logueo con animaciones.

#### REQUISITOS 

1. Xcode 11

#### DESARROLLO

Desarrolla una interfaz que te solicite usuario y password
Al no contar con servicios dejar en duro la validación para que el usuario sea `admin` y su password sea de igual manera `admin`.
Ejecutar validaciones y animaciones


<details>
	<summary>Solución</summary>
	<p> Creamos la pantalla del login
	<br>Creamos la pantalla de exito
	<br>Realizar la comparacion de los elementos y ejecutar estos escenarios:
	<br>- Usuario y password correcto: Mandar a otra vista conde se cambie de color el fondo con una animación
	<br>- Usuario o password incorrectos: Animar con un estilo `shake` los campos de usuario y password y mostrar un mensaje en pantalla que nos indique que alguno de los datos es incorrecto
	<br>- Campos en blanco: Al presionar el botón, si se detecta que alguno de los campos no tiene contenido animar el elemento que no tiene contenido. 
	<br>
	<br>Ejecutamos nuestra app</p>

</details> 
