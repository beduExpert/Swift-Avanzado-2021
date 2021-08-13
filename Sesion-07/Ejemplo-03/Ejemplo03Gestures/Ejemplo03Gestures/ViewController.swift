//
//  ViewController.swift
//  Ejemplo03Gestures
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!

  private let panGestureRecognizer = UIPanGestureRecognizer(target: self,
                                                            action: #selector(didPan(sender:)))
  override func viewDidLoad() {
    super.viewDidLoad()
    panGestureRecognizer.delegate = self
    imageView.isMultipleTouchEnabled = true
    imageView.isUserInteractionEnabled = true
    imageView.addGestureRecognizer(panGestureRecognizer)
  }
  
  @objc func didPan(sender: UIPanGestureRecognizer) {
    let location = sender.location(in: imageView)
    let velocity = sender.velocity(in: imageView)
    let translation = sender.translation(in: imageView)
    
    if sender.state == .began {
      print("Began")
    } else if sender.state == .changed {
      print("Changed")
    } else if sender.state == .ended {
      print("Ended")
    }
  }
}
extension ViewController: UIGestureRecognizerDelegate {
}

