//
//  ViewController.swift
//  AppDelg
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var label: UILabel!
  let viewModel: ViewModel = ViewModel()

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func goToVC2(_ sender: Any) {
    guard let vc = viewModel.gotoNextView(delegate: self) else { return  }
    present(vc, animated: true, completion: nil)
  }
  
}
extension ViewController: Message {
  func message(_ text: String) {
    self.label.text = text
  }
}

