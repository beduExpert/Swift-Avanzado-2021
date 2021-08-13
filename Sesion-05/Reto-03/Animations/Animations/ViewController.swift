//
//  ViewController.swift
//  Animations
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  @IBOutlet weak var image1: UIImageView!
  @IBOutlet weak var image2: UIImageView!
  
  let translate = CGAffineTransform(translationX: 50, y: 250)
  let rotate = CGAffineTransform(rotationAngle: 360)
  let scale = CGAffineTransform(scaleX: 2, y: 2)
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  @IBAction func animate(_ sender: Any) {
    springAnimation()
  }
  
  func animageViews() {
    UIView.animate(withDuration: 2.0, animations: { () -> Void in
      // Move "appleImage" from current position to center
      self.image1.center = self.view.center
      //You can even combine 2 animations together.
      self.image2.transform = self.translate.concatenating(self.scale)
    })
  }
  
  // RETO:
  func springAnimation() {
    UIView.animate(withDuration: 1.5, delay: 0, usingSpringWithDamping: 0.7, initialSpringVelocity: 0.8,
                   options: .curveEaseInOut,
                   animations: { () -> Void in
                    // Move "appleImage" from current position to center
                    self.image1.center = self.view.center
                    //You can even combine 2 animations together.
                    self.image2.transform = self.translate.concatenating(self.scale)
    }, completion: nil)
  }
}


