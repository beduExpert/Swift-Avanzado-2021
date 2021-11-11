 
`Desarrollo Mobile` > `Swift Avanzado`

## Eventos y semaforo

### OBJETIVO 

- Integrar el código del Ejemplo-01 de la Sesión 3 con el semáforo.

#### REQUISITOS 

1. Xcode 11
2. Ejemplo-01 de la sesión 3

#### DESARROLLO

Una vez aprendido el uso de notificaciones y tener conocimiento del semaforo, integraremos ambos en un mismo reto
Usando el mismo codigo anterior, dispararemos distintos logueos por medio del semaforo tomando como referencia el ejemplo de los niños que quieren usar el ipad


<details>
	<summary>Solucion</summary>
	<p> La solución es simple, a nuestro Ejemplo 1 de la sesión 3 aprovecharemos lo ya construido invocando con el semaforo con distintos datos para el logueo</p>
	
	<p> Aqui elcodigo nuevo </p>
	 let login = LoginManager()
var loginData: [String: Any] = [:]


let semaphore = DispatchSemaphore(value: 1)

DispatchQueue.global().async {
   print("espera 1")
   semaphore.wait()
   print("termino la espera 1")
loginData = ["userID": 54, "userName": "Ivan"]
    login.loginWith(loginData)
    sleep(1)
   semaphore.signal()
   print("termina de jugar 1")
}
DispatchQueue.global().async {
   print("espera 2")
   semaphore.wait()
loginData = ["userID": 22, "userName": "Alex"]
    login.loginWith(loginData)
    print("termino la espera 2")
    sleep(1)
   semaphore.signal()
    print("termina de jugar 2")
}
DispatchQueue.global().async {
    print("espera 3")
   semaphore.wait()
    loginData = ["userID": 67, "userName": "Alejandro"]
        login.loginWith(loginData)
    print("termino la espera 3")
   sleep(1)
   semaphore.signal()
    print("termina de jugar 3")
}
	
	
</details> 
