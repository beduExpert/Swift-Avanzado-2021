//
//  ViewController.swift
//  Reto01PinchGesture
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
    self.imageView.isUserInteractionEnabled = true
    // Do any additional setup after loading the view.
  }

  @IBAction func pinch(recognizer: UIPinchGestureRecognizer) {
     print(#function)
    let scale = recognizer.scale
    let transform = CGAffineTransform(scaleX: scale, y: scale)
    self.imageView.transform = transform
    //recognizer.scale = 1
  }
   
}

