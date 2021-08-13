//
//  ViewController.swift
//  Ejemplo01PanGesture
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  @IBOutlet var panGesture: UIPanGestureRecognizer!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: self.imageView)
    if let view = recognizer.view {
      view.center = CGPoint(x: view.center.x + translation.x,
                            y: view.center.y + translation.y)
    }
    recognizer.setTranslation(CGPoint.zero, in: self.imageView)
  }
}

