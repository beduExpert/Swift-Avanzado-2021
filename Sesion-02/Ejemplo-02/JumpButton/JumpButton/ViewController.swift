//
//  ViewController.swift
//  JumpButton
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
  @IBOutlet weak var button: JumpButton!

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func btnCancel_click(_ sender: Any) {
    //    button.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
    //    UIView.animate(withDuration: 2.0, delay: 0,
    //                   usingSpringWithDamping: 0.2,
    //                   initialSpringVelocity: 6.0,
    //                   options: .allowUserInteraction,
    //                   animations: { [weak self] in
    //                    self?.button.transform = .identity
    //      },completion: nil)
    button.jump()
  }
}
