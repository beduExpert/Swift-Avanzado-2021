//
//  ViewController.swift
//  Ejemplo2
//
//  Created by Arlen Peña on 30/11/21.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    var people: [NSManagedObject] = []
    var names: [String] = []
    @IBAction func agregar(_ sender: Any) {
        print("Entro")
        
        let alert = UIAlertController(title: "Nombre",
                                        message: "Agregar una nueva persona",
                                        preferredStyle: .alert)
        
        let saveAction2 = UIAlertAction(title: "save", style: .default) { resp in
            
            guard let textField = alert.textFields?.first,
              let nameToSave = textField.text else { return }
            //self.names.append(nameToSave)
            self.save(name: nameToSave)
            self.myList.reloadData()
        }
          let cancelAction = UIAlertAction(title: "Cancel", style: .cancel)
        
          alert.addTextField()
          alert.addAction(saveAction2)
          alert.addAction(cancelAction)
          present(alert, animated: true)
        
    }
    @IBOutlet weak var myList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Mi lista"
        myList.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
        myList.dataSource = self
        
    }
    override func viewDidAppear(_ animated: Bool) {
         super.viewDidAppear(animated)
       //1
         guard let appDelegate =
           UIApplication.shared.delegate as? AppDelegate else {
       return
       }
         let managedContext =
           appDelegate.persistentContainer.viewContext
       //2
         let fetchRequest =
           NSFetchRequest<NSManagedObject>(entityName: "Person")
       //3
         do {
           people = try managedContext.fetch(fetchRequest)
         } catch let error as NSError {
           print("Could not fetch. \(error), \(error.userInfo)")
         }
         print("mostar")
         myList.reloadData()
     }
    
    func save(name: String) {
          guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {return }
        // 1
          let managedContext = appDelegate.persistentContainer.viewContext
        // 2
          let entity = NSEntityDescription.entity(forEntityName: "Person",
                                       in: managedContext)!
          let person = NSManagedObject(entity: entity,
                                       insertInto: managedContext)
        // 3
          person.setValue(name, forKeyPath: "name")
        // 4
          do {
            try managedContext.save()
            people.append(person)
              print("person")
          } catch let error as NSError {
            print("Could not save. \(error), \(error.userInfo)")
          }
    }

}
extension ViewController:UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return people.count
        //return names.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let person = people[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for:indexPath)
        cell.textLabel?.text = person.value(forKeyPath: "name") as? String
        //cell.textLabel?.text = names[indexPath.row]
        return cell
    }
    
    
}
