//
//  ViewController.swift
//  Reto03Gestures
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  private let pinchGesture = UIPinchGestureRecognizer(target: self,
                                                      action: #selector(pinchGesture(sender:)))
  override func viewDidLoad() {
    super.viewDidLoad()
    imageView.isMultipleTouchEnabled = true
    imageView.isUserInteractionEnabled = true
    imageView.addGestureRecognizer(pinchGesture)
  }
  
  @objc func pinchGesture(sender: UIPinchGestureRecognizer) {
    if sender.state == .began {
      print("Began")
    } else if sender.state == .changed {
      print("Changed")
    } else if sender.state == .ended {
      print("Ended")
    }
  }
}

