//
//  ViewControllerB.swift
//  AppDelg
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {
  
  @IBOutlet weak var textField: UITextField!
  var delegatMessage: Message?

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  @IBAction func gotBack(_ sender: Any) {
    guard let text = textField.text else { return }
    delegatMessage?.message(text)
    dismiss(animated: true, completion: nil)
  }
  
}
