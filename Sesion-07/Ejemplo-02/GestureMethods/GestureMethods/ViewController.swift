//
//  ViewController.swift
//  GestureMethods
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
 
  
  override func viewDidLoad() {
    super.viewDidLoad()
   
      
  }
  
    @IBAction func pan(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
          print("Inicio gesture")
        }
        else if sender.state == UIGestureRecognizer.State.ended {
          print("fin gesture")
        }
        
    }
    
  }


