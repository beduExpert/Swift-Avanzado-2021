//
//  ViewController.swift
//  Ejemplo03Gestures
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
      
            if sender.state == .began {
              print("Began")
            } else if sender.state == .changed {
              print("Changed")
            } else if sender.state == .ended {
              print("Ended")
            }
        
        let translation = sender.translation(in: view)
        if let view = sender.view {
          view.center = CGPoint(x: view.center.x + translation.x,
                                y: view.center.y + translation.y)
        }
          sender.setTranslation(CGPoint.zero, in: view)
    }
    
}
