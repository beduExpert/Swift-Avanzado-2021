//
//  ViewController.swift
//  Reto02Gestures
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
    
  
  override func viewDidLoad() {
    super.viewDidLoad()
  }
  
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        let translation = sender.translation(in: view)
        if let view = sender.view {
          view.center = CGPoint(x: view.center.x + translation.x,
                                y: view.center.y + translation.y)
        }
        sender.setTranslation(CGPoint.zero, in: view)
        
        if sender.state == UIGestureRecognizer.State.began {
            scaleWithMove(scale: 1.5,sender: sender)
        }
        if sender.state == UIGestureRecognizer.State.ended {
          scaleWithMove(scale: 1.0,sender: sender)
        }
    }
    
  
    private func scaleWithMove(scale: CGFloat, sender: UIPanGestureRecognizer ) {
    UIView.animate(withDuration: 0.5, animations: { () -> Void in
        sender.view?.transform = CGAffineTransform(scaleX: scale, y: scale)
    }, completion: nil )
  }
}
