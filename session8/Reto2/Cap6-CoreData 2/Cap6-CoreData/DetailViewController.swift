//
//  DetailViewController.swift
//  Cap6-CoreData
//
//  Created by Salvador Lopez on 29/11/21.
//  Copyright © 2021 Salvador Lopez. All rights reserved.
//

import UIKit

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

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
