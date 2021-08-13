//
//  ViewController.swift
//  Ejemplo01UserDefaults
//
//  Copyright © 2019 Bedu. All rights reserved.
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
    // Do any additional setup after loading the view.
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
  
}

