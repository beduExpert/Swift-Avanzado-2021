`Desarrollo Mobile` > `Swift Avanzado`

## Persistencia de datos con Realm

### OBJETIVO

- Aprender a utilizar un gestor de datos de terceros: Realm y almacenar datos sencillos.

#### REQUISITOS

1. Conexión a Internet
2. Paquetes de terminal para usar Pods o Carthage
3. Xcode

#### DESARROLLO

Crearemos un proyecto en iOS y crearemos un PodFile que tenga el siguiente contenido:

```
target ‘{YourProjectName}’ do
    use_frameworks!
    pod ‘RealmSwift’
end
```
Una vez compilado el PodFile probar que este agregado Realm al proyecto.

> import RealmSwift

Crearemos un archivo en Swift con un modelo de Realm:

```
class User: Object {
@objc dynamic var name = ""
```

Probaremos almacenar datos:

```
let realm = try! Realm()
let user = User()
user.name = "name"
realm.write {
realm.add(user)
}

```



