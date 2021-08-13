//
//  ViewController.swift
//  Reto02Gestures
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
  @IBAction func pan(recognizer: UIPanGestureRecognizer) {
    let translation = recognizer.translation(in: self.imageView)
    if let view = recognizer.view {
      view.center = CGPoint(x: view.center.x + translation.x,
                            y: view.center.y + translation.y)
    }
    recognizer.setTranslation(CGPoint.zero, in: self.imageView)
    
    if recognizer.state == UIGestureRecognizer.State.began {
      scaleWithMove(scale: 1.5)
    }
    if recognizer.state == UIGestureRecognizer.State.ended {
      scaleWithMove(scale: 1.0)
    }
  }
  
  private func scaleWithMove(scale: CGFloat) {
    UIView.animate(withDuration: 0.5, animations: { () -> Void in
      self.imageView?.transform = CGAffineTransform(scaleX: scale, y: scale)
    }, completion: nil )
  }
}
