//
//  ViewController.swift
//  CoreDataApp
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var email: UITextField!
  @IBOutlet weak var password: UITextField!
  @IBOutlet weak var label: UILabel!
  
  private let datamanager = DataManager()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func save(_ sender: Any) {
    guard let email = email.text, let password = password.text else { return }
    datamanager.saveData(email: email, password: password)
  }
  
  @IBAction func load(_ sender: Any) {
    guard let data = datamanager.retrieve() else { return }
    label.text = data.value(forKey: "email") as? String
  }
  @IBAction func update(_ sender: Any) {
  }
  
  @IBAction func deleteData(_ sender: Any) {
  }
  
}

