//
//  ViewController2.swift
//  Cap6-CoreData
//
//  Created by Salvador Lopez on 22/05/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import UIKit
import CoreData

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
  var empleados: [Empleados] = []
  
  @IBOutlet weak var tableView: UITableView!
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return empleados.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let celda = UITableViewCell(style: .default, reuseIdentifier: nil)
    celda.textLabel!.text = empleados[indexPath.row].name
    return celda
  }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //dump(empleados[indexPath.row])
        let storyBoard: UIStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let detailVC = storyBoard.instantiateViewController(withIdentifier: "detailVC") as! DetailViewController
        detailVC.empleado = empleados[indexPath.row]
        self.navigationController?.pushViewController(detailVC, animated: true)
        //self.present(detailVC, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            confirmDelete(el:empleados[indexPath.row])
        }
    }
    
    func confirmDelete(el:Empleados){
        dump(el)
        let alert = UIAlertController(title: "Eliminar", message: "¿Desea borrar \(el.name) de forma permanente?", preferredStyle: .actionSheet)
        let deleteAct = UIAlertAction(title: "Eliminar", style: .destructive) { ok in
            print("ok, delete: \(ok)")
            self.empleados.removeAll()
            self.deleteData(el: el)
        }
        let cancelAct = UIAlertAction(title: "Cancelar", style: .default) { cancelar in
            print("cancel: \(cancelar)")
        }
        alert.addAction(deleteAct)
        alert.addAction(cancelAct)
        self.present(alert, animated: true) {
            print("Ending present...")
        }
    }
  

    override func viewDidLoad() {
        super.viewDidLoad()
      self.tableView.delegate = self
      self.tableView.dataSource = self
    }
  
  override func viewWillAppear(_ animated: Bool) {
    empleados.removeAll()
    self.dataFromCoreData()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    self.dataFromCoreData()
  }

  func dataFromCoreData(){
    
    self.tableView.reloadData()
    
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let contexto = appDelegate.persistentContainer.viewContext
    
    //let requestData = NSFetchRequest<NSFetchRequestResult>(entityName: "Persona") as [Persona]
    let requestData = NSFetchRequest<Persona>(entityName: "Persona")
    
    do{
      let resulFromRequestData = try contexto.fetch(requestData)
      
      resulFromRequestData.forEach { (p) in
        //print(p.name!)
        //print((persona as Persona).name)
        //print((persona as AnyObject).value(forKey: "name")!)
        empleados.append(Empleados(name: p.name!, email: p.email!, password: p.password!, employeeNumber: p.employeeNumber!, birthDate: p.birthDay!, phoneNumber: p.phoneNumber!, role: p.role!, routes: []))
      }
      
    }catch{
      print("Error: \(error)")
    }
    
  }
    
    func deleteData(el:Empleados){
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let contexto = appDelegate.persistentContainer.viewContext
        
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Persona")
        fetchRequest.predicate = NSPredicate(format: "name == %@", "\(el.name)")
        
        do{
            let record = try contexto.fetch(fetchRequest)
            let objToDelete = record[0] as! NSManagedObject
            contexto.delete(objToDelete)
            do{
                try contexto.save()
                self.dataFromCoreData()
                self.tableView.reloadData()
            }catch{
                print("Error saving data")
            }
        }catch{
            print("Error requesting data")
        }
        
  }


}
