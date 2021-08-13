//
//  ViewController.swift
//  Ejemplo02-UserDefaults
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var name: UITextField!
  @IBOutlet weak var age: UITextField!
  @IBOutlet weak var results: UILabel!
  
  let defaults = UserDefaults.standard
  let key1: String = "Name"
  let key2: String = "Age"
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func save(_ sender: Any) {
    let name: String? = self.name.text
    let age: Int? = Int(self.age.text ?? "")
    defaults.set(name, forKey: key1)
    defaults.set(age, forKey: key2)
  }
  
  @IBAction func load(_ sender: Any) {
    let name = defaults.string(forKey: key1) ?? "-"
    let age = defaults.string(forKey: key2) ?? "-"
    results.text = "Name: \(name), Age:  \(age)"
  }
  
  @IBAction func deleteData(_ sender: Any) {
    UserDefaults.standard.removeObject(forKey: key1)
    UserDefaults.standard.removeObject(forKey: key2)
  }
  
  
}

