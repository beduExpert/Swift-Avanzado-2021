//
//  ViewController.swift
//  Cap6-CoreData
//
//  Created by Salvador Lopez on 22/05/20.
//  Copyright © 2020 Salvador Lopez. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return empleados.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = UITableViewCell(style: .subtitle, reuseIdentifier: nil)
      cell.detailTextLabel?.text = "Numero de empleado: \(empleados[indexPath.row].employeeNumber)..."
    cell.textLabel?.text = empleados[indexPath.row].name
    //cell.accessoryType = .detailButton
    return cell
  }
  
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    dump(empleados[indexPath.row])
    //Guardar Info en CoreData
    let appDelegate = UIApplication.shared.delegate as! AppDelegate
    let contexto = appDelegate.persistentContainer.viewContext
    
    let empleado = Persona(context: contexto)
    empleado.name = empleados[indexPath.row].name
    empleado.email = empleados[indexPath.row].email
    empleado.password = empleados[indexPath.row].password
    empleado.employeeNumber = empleados[indexPath.row].employeeNumber
    empleado.birthDay = empleados[indexPath.row].birthDate
    empleado.phoneNumber = empleados[indexPath.row].phoneNumber
    empleado.role = empleados[indexPath.row].role
    
    do{
      try contexto.save()
      let ac = UIAlertController(title: "Informacion de usuario", message: "El usuario se guardo de forma local, consultelo en la tabla principal.", preferredStyle: .alert)
      let aa = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
      ac.addAction(aa)
      self.present(ac, animated: true)
    }catch{
      print("error: \(error)")
    }
    
  }
  
  
  var empleados: [Empleados] = []

  @IBOutlet weak var tableView: UITableView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    self.tableView.delegate = self
    self.tableView.dataSource = self    
  }
    
    override func viewDidAppear(_ animated: Bool) {
        let queue = DispatchQueue(label: "com.bedu.coreData")
        queue.sync {
            //Llamada al VC
            var request = URLRequest(url: URL(string: "https://bedu-swift.herokuapp.com/cobranza.php")!)
            request.httpMethod = "POST"
            //paso 2 crear la tarea
            let task = URLSession.shared.dataTask(with: request) { (data, resp, error) in
              if error != nil {
                print("Se produjo el error \(String(describing: error))")
              }else{
                //dump(resp)
                //dump(data) // bytes
                //print(String(bytes: data!, encoding: .utf8)!) // formato encoding
                if let info = data{
                  do{
                    let jsonResult = try JSONSerialization.jsonObject(with: info) as! [AnyObject]
                    //dump(jsonResult)
                    //print(jsonResult)
                    jsonResult.forEach { (elemento) in
                      
                      var routesToSave: [Routes] = []
                      
                      //print(elemento["name"]!!)
                      if let routesElemento = elemento["routes"]!! as? [AnyObject]{
                        //print("Array AnyObject")
                        //print(routesElemento)
                        routesElemento.forEach { (ruta) in
                          routesToSave.append(Routes(dir: ruta["direccion"] as! String, persona: ruta["personaVisita"] as! String, adeudo: ruta["adeudo"] as! String, notas: ruta["notas"] as! String))
                        }
                      }else if let routesElemento = elemento["routes"]!! as? AnyObject{
                        //print("AnyObject")
                        //print(routesElemento)
                        routesToSave.append(Routes(dir: routesElemento["direccion"] as! String, persona: routesElemento["personaVisita"] as! String, adeudo: routesElemento["adeudo"] as! String, notas: routesElemento["notas"] as! String))
                      }
                      self.empleados.append(Empleados(name: elemento["name"]!! as! String, email: elemento["email"]!! as! String, password: elemento["pass"]!! as! String, employeeNumber: elemento["employeeNumber"]!! as! String, birthDate: elemento["birthDate"]!! as! String, phoneNumber: elemento["phoneNumber"]!! as! String, role: elemento["role"]!! as! String, routes:routesToSave))
                    }
                  DispatchQueue.main.async {  // Executing on main thread.
                      self.tableView.reloadData() // Updating UI.
                      print("Done tv")
                  }
                  }catch{
                    print("Error JSONSerialization")
                  }
                }
              }
            }
            task.resume()
        }
    }


}

