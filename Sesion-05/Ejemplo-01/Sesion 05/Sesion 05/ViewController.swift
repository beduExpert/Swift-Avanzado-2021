//
//  ViewController.swift
//  Sesion 05
//
//  Created by Ivan Alejandro Hernandez Sanchez on 06/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var animationView: UIView!
    @IBOutlet weak var loginButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func animationAction(_ sender: UIButton) {
        
        UIView.animate(withDuration: 1, delay: 0.5) {
            self.animationView.backgroundColor = .red
            self.animationView.frame.size.width += 10
            self.animationView.frame.size.height += 10
            self.animationView.center.x += 40
        }
        
    }
    
}


