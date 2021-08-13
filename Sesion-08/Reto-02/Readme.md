
`Desarrollo Mobile` > `Swift Avanzado`

## Operaciones CRUD, actualización y eliminación de datos.

### OBJETIVO

- Implementar las operaciones CRUD. Especificamente la operación de Update y Delete en CoreData.

#### REQUISITOS

1. Xcode 11
2. Ejemplo-02 completo.

#### DESARROLLO

1.- Abrir el `DataManager` y agregar dos funciones, una para actualizar datos y otra para eliminarlos.

2.- Obtener los datos ingresando el email y actualizar el password.
El uso de un predicado sera necesario.

```
fetchRequest.predicate = NSPredicate(format: "email = %@", email)
```
3.- Para la eliminación de datos usaremos la función `.delete()`, esta función recibe un objeto de tipo `NSManagedObject`.

<details>
	<summary>Solución</summary>
	<p>La función de `Update`, tendrá dos parámetros, email y password. Usaremos un `FetchRequest` para obtener el dato que coincida con el email proporcionado.
	 Utilizaremos un Predicate para hacer el filtrado. </p>

```
	 func update(email: String, password: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
    fetchRequest.predicate = NSPredicate(format: "email = %@", email)
    do {
      let result = try managedContext.fetch(fetchRequest)
      let updateObject = result[0] as! NSManagedObject
      updateObject.setValue(password, forKey: "password")
      try managedContext.save()
    } catch {
    }
  }
```

<p> La implementación de la función Delete, comienza de la misma manera que UPDATE. La diferencia radica en el uso de la función `delete` de managedContext.</p>
	
```
func delete(email: String) {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    let fetchRequest = NSFetchRequest<NSFetchRequestResult> (entityName: "User")
    fetchRequest.predicate = NSPredicate(format: "email = %@", email)
    
    do {
      let data = try managedContext.fetch(fetchRequest)
      let objectToDelete = data[0] as! NSManagedObject
      managedContext.delete(objectToDelete)
      try managedContext.save()
    } catch {
      
    }
  }
```	
</details> 
