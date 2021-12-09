//
//  ViewController2.swift
//  Cap6-CoreData
//
//  Created by Salvador Lopez on 22/05/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import UIKit
import CoreData

var empleados: [Empleados] = []

class ViewController2: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
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
        self.present(detailVC, animated: true, completion: nil)
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

}
