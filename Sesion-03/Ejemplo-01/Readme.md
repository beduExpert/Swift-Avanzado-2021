`Desarrollo Mobile` > `Swift Avanzado`

## Disparar evento basico

### OBJETIVO

- Introduccion a NotificationCenter.

#### REQUISITOS

1. Xcode 11
2. Playgrounds

#### DESARROLLO

- Implementaremos un Observador mediante KVO.

En esta actividad, crearás los siguientes elementos solicitados:

Crea un playground nuevo o un proyecto en xCode, con un tipo de vista única.
Crea 2 clases, en una de ellas crea la notificación y en la otra la invocación en sus funciones.
Crea el evento destructor de la clase para remover la notificación.
Crea una función donde imprimas los valores de object y de userInfo.
Instancia las 2 clases e invoca el disparador de la notificación con 


Paso 1.- Crearemos nuestro observador
```
        notificationCenter
            .addObserver(self,
                         selector:#selector(loginSuccess(_:)),
                         name: NSNotification.Name("com.user.login.success"),
                         object: nil)
```

Paso 2.- Generamos la función requerida
```
    @objc func loginSuccess(_ notification: Notification) {
        print(notification.object as? [String: Any] ?? [:])
        print(notification.userInfo as? [String: Any] ?? [:])
        print(notification.userInfo?["userInfo"] as? [String: Any] ?? [:])
    }
```

Paso 3.- Creamos nuestro destructor de la suscripción
```
    deinit {
        notificationCenter
            .removeObserver(self,
                            name: NSNotification.Name("com.user.login.success"),
                            object: nil)
    }
```

Paso 4.- En otra clase creamos nuestro POST a la notificación
```
        let loginResponse = ["userInfo": ["userID": 21, "userName": "Alex"]]
        notificationCenter
            .post(name: NSNotification.Name("com.user.login.success"),
                  object: loginDetails,
                  userInfo: loginResponse
            ) }
```

Paso 5.- Invocamos y probamos
```
let ourClass = LoginViewController()
ourClass.viewDidLoad()


let login = LoginManager()
let loginData: [String: Any] = ["userID": 54, "userName": "Ivan"]
login.loginWith(loginData)
```


El codigo final:

![](1.png)

