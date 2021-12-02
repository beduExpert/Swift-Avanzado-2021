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
      let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(pan(_:)))

      // Add Pan Gesture Recognizer
      imageView.addGestureRecognizer(panGestureRecognizer)
      
  }
  
  @objc private func pan(_ sender: UIPanGestureRecognizer) {
    if sender.state == UIGestureRecognizer.State.began {
      print("Inicio gesture")
    }
    else if sender.state == UIGestureRecognizer.State.ended {
      print("fin gesture")
    }
  }
}

