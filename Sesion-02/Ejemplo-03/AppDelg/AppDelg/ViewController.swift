//
//  ViewController.swift
//  AppDelg
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

protocol Message {
  func message(_ text: String)
}

class ViewController: UIViewController {
  
  @IBOutlet weak var label: UILabel!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func goToVC2(_ sender: Any) {
    if let vc = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "ViewControllerB") as? ViewControllerB {
      vc.delegatMessage = self
      present(vc, animated: true, completion: nil)
    }
  }
  
}
extension ViewController: Message {
  func message(_ text: String) {
    self.label.text = text
  }
}

