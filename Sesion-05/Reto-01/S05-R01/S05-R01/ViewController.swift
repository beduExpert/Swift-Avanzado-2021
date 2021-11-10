//
//  ViewController.swift
//  S05-R01
//
//  Created by Ivan Alejandro Hernandez Sanchez on 10/11/21.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var errorView: UIView!
    @IBOutlet weak var errorMessage: UILabel!
    
    @IBOutlet weak var userPassStack: UIStackView!
    @IBOutlet weak var userLabel: UITextField!
    @IBOutlet weak var passwordLabel: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.errorView.alpha = 0.0
        self.errorView.backgroundColor = .red.withAlphaComponent(0.3)
        self.errorView.layer.borderColor = UIColor.red.cgColor
        self.errorView.layer.borderWidth = 2
        
    }

    @IBAction func validateFieldsAction(_ sender: UIButton) {
        
        isvalidFields()
    }
    
    fileprivate func isvalidFields() {
        if let user = self.userLabel.text,
           let pass = self.passwordLabel.text,
           !user.trimmingCharacters(in: .whitespaces).isEmpty && !pass.trimmingCharacters(in: .whitespaces).isEmpty {
            if user == "admin" && pass == "admin" {
                performSegue(withIdentifier: "okSegue", sender: nil)
            } else {
                self.errorMessage.text = "Usuario o password incorrectos"
                
                UIView.animate(withDuration: 1, delay: 0.0, animations: {
                    self.errorView.alpha = 1.0
                }) { _ in
                    UIView.animate(withDuration: 1, delay: 2.0) {
                        self.errorView.alpha = 0.0
                    }
                }
                
                let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
                animation.repeatCount = 4
                animation.duration = 0.4/TimeInterval(animation.repeatCount)
                animation.autoreverses = true
                animation.values = [10, -10]
                self.userPassStack.layer.add(animation, forKey: "shake")
            }
            
        } else {
            var message = ""
            if let user = self.userLabel.text, user.trimmingCharacters(in: .whitespaces).isEmpty {
                message += "- Usuario requerido \n"
                
                let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
                animation.repeatCount = 4
                animation.duration = 0.4/TimeInterval(animation.repeatCount)
                animation.autoreverses = true
                animation.values = [10, -10]
                self.userLabel.layer.add(animation, forKey: "shake")
            }
            
            if let pass = self.passwordLabel.text, pass.trimmingCharacters(in: .whitespaces).isEmpty {
                message += "- Password requerido"
                
                let animation = CAKeyframeAnimation(keyPath: "transform.translation.x")
                animation.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
                animation.repeatCount = 4
                animation.duration = 0.4/TimeInterval(animation.repeatCount)
                animation.autoreverses = true
                animation.values = [10, -10]
                self.passwordLabel.layer.add(animation, forKey: "shake")
            }
            
            self.errorMessage.text = message
            
            UIView.animate(withDuration: 1, delay: 0.0, animations: {
                self.errorView.alpha = 1.0
            }) { _ in
                UIView.animate(withDuration: 1, delay: 2.0) {
                    self.errorView.alpha = 0.0
                }
            }
        }
    }
    
    
    // MARK: - Navigation
    /*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "okSegue" {
            guard let vc = segue.destination as? OkViewController else {return}
        }
    }
    */
}

