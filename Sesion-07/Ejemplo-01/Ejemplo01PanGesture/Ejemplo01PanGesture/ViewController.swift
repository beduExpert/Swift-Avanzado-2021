//
//  ViewController.swift
//  Ejemplo01PanGesture
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  
  override func viewDidLoad() {
    super.viewDidLoad()
      
  }
  
    @IBAction func handlePan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if let view = sender.view {
          view.center = CGPoint(x: view.center.x + translation.x,
                                y: view.center.y + translation.y)
        }
          sender.setTranslation(CGPoint.zero, in: view)
    }
   
}

