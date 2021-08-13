//
//  ViewController.swift
//  GestureMethods
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func pan(sender: UIPanGestureRecognizer) {
    if sender.state == UIGestureRecognizer.State.began {
      print("Inicio gesture")
    }
    else if sender.state == UIGestureRecognizer.State.ended {
      print("fin gesture")
    }
  }
}

