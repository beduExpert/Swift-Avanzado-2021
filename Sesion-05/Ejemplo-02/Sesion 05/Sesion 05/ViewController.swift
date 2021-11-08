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
        
        UIView.animate(withDuration: 2, delay: 0.5, animations: {
            self.animationView.backgroundColor = .red
        }) { _ in
            let alert = UIAlertController(title: "Fin de animación", message: "Hagamos la siguiente animación", preferredStyle: .alert)

            alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: { _ in
                
                UIView.animate(withDuration: 1, delay: 0.5) {
                    self.animationView.frame.size.width += 20
                    self.animationView.frame.size.height += 20
                }
                
            }))

            self.present(alert, animated: true)
            
        }
        
    }
    
}
