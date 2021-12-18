//
//  ViewController.swift
//  Sesion 07
//
//  Created by Ivan Alejandro Hernandez Sanchez on 24/11/21.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
//    TAP GESTURE
    @IBAction func didTapView(_ sender: UITapGestureRecognizer) {
        UIView.animate(withDuration: 0.4, delay: 0.2,
                       animations: {
            sender.view?.alpha = 0.5
            sender.view?.center.y = (sender.view?.center.y)! - 40
                }) { _ in
                    UIView.animate(withDuration: 0.4, delay: 0.1) {
                        sender.view?.center.y = (sender.view?.center.y)! + 20
                        sender.view?.alpha = 1.0
                    }
                }
    }

//    PAN GESTURE
    @IBAction func didPan(_ sender: UIPanGestureRecognizer) {
        if sender.state == UIGestureRecognizer.State.began {
            print("Inicio gesture")
        }
        else if sender.state == UIGestureRecognizer.State.ended {
            print("fin gesture")
        }
        
        let translation = sender.translation(in: view)

        guard let gestureView = sender.view else {
            return
        }

        gestureView.center = CGPoint(
            x: gestureView.center.x + translation.x,
            y: gestureView.center.y + translation.y
        )

        sender.setTranslation(.zero, in: view)
    }

//    LONG PRESS GESTURE
    @IBAction func handleLongPress(_ sender: UILongPressGestureRecognizer) {
        guard let gestureView = sender.view else {
            return
        }
            
        if sender.state == UIGestureRecognizer.State.began {
            print("Inicio gesture")
            gestureView.frame.size.height += 50
            gestureView.frame.size.width += 50
        }
        else if sender.state == UIGestureRecognizer.State.ended {
            print("fin gesture")
            gestureView.frame.size.height -= 50
            gestureView.frame.size.width -= 50
        }
    }
            
    
}
