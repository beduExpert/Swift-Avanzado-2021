//
//  ViewController.swift
//  Reto03Gestures
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {
  
    let listColors = [ UIColor(#colorLiteral(red: 0, green: 1, blue: 0.4945596457, alpha: 1)) , UIColor(#colorLiteral(red: 0, green: 0.6747120619, blue: 0.7015240788, alpha: 1)), UIColor(#colorLiteral(red: 0.7455447912, green: 0.3212659955, blue: 0.3475470543, alpha: 1))]

    override func viewDidLoad() {
      super.viewDidLoad()
        print ("Inicio")
    }
      
  
    @IBAction func pinchGesture(_ sender: UIPinchGestureRecognizer) {
        if sender.state == .began {
          print("Began")
        } else if sender.state == .changed {
          print("Changed")
        } else if sender.state == .ended {
          print("Ended")
        }
    }
    @IBAction func ScreenEdgeGestureChangeColor(_ sender: UIScreenEdgePanGestureRecognizer) {
        
        if sender.state == .ended {
            let randomInt = Int.random(in: 0..<listColors.count)
            sender.view?.backgroundColor = listColors [randomInt]
        }
    }
    
  }


