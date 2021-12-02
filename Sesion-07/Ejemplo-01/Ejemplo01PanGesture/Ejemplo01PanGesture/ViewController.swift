//
//  ViewController.swift
//  Ejemplo01PanGesture
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
      
      // Initialize Pan Gesture Recognizer
      let panGestureRecognizer = UIPanGestureRecognizer(target: self, action: #selector(handlePan(_:)))

      // Add Pan Gesture Recognizer
      imageView.addGestureRecognizer(panGestureRecognizer)
      
  }
  
  @objc private func handlePan(_ sender: UIPanGestureRecognizer) {
    let translation = sender.translation(in: self.imageView)
    if let view = sender.view {
      view.center = CGPoint(x: view.center.x + translation.x,
                            y: view.center.y + translation.y)
    }
      sender.setTranslation(CGPoint.zero, in: self.imageView)
  }
}

