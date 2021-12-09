//
//  DetailViewController.swift
//  Cap6-CoreData
//
//  Created by Salvador Lopez on 29/11/21.
//  Copyright © 2021 Salvador Lopez. All rights reserved.
//

import UIKit
import CoreData

class DetailViewController: UIViewController {
    
    var empleado = Empleados()
    
    @IBOutlet weak var nombreLb: UITextField!
    @IBOutlet weak var emailLb: UITextField!
    @IBOutlet weak var numeroEmpLb: UITextField!
    @IBOutlet weak var telefonoLb: UITextField!
    @IBOutlet weak var cargoLb: UITextField!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        dump(empleado)
        nombreLb.text = empleado?.name
        emailLb.text = empleado?.email
        numeroEmpLb.text = empleado?.employeeNumber
        telefonoLb.text = empleado?.phoneNumber
        cargoLb.text = empleado?.role
    }

    @IBAction func updateData(_ sender: Any) {
        print("Update...")
        dump(empleado)
        self.updateData(el:empleado!)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    func updateData(el:Empleados){
       let appDelegate = UIApplication.shared.delegate as! AppDelegate
       let contexto = appDelegate.persistentContainer.viewContext
       
       let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "Persona")
        fetchRequest.predicate = NSPredicate(format: "employeeNumber == %@","\(el.employeeNumber)")
       
       do {
           let record = try contexto.fetch(fetchRequest)
           let recordToUpdate = record[0] as! NSManagedObject
           recordToUpdate.setValue("\(nombreLb.text!)", forKey: "name")
           recordToUpdate.setValue("\(emailLb.text!)", forKey: "email")
           recordToUpdate.setValue("\(telefonoLb.text!)", forKey: "phoneNumber")
           recordToUpdate.setValue("\(cargoLb.text!)", forKey: "role")
           print("Done!")
           do{
               try contexto.save()
               let ac = UIAlertController(title: "Atención", message: "¡Registro actualizado con exito!", preferredStyle: .alert)
               let aa = UIAlertAction(title: "Aceptar", style: .default, handler: nil)
               ac.addAction(aa)
               self.present(ac, animated: true, completion: nil)
           }catch{
               print("error")
           }
       }catch{
           print("Error in fetch")
       }
   }


}
