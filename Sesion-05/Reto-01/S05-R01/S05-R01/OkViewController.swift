//
//  OkViewController.swift
//  S05-R01
//
//  Created by Ivan Alejandro Hernandez Sanchez on 10/11/21.
//

import UIKit

class OkViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        animateBackground()
    }
    
    fileprivate func animateBackground() {
        UIView.animate(withDuration: 1, delay: 0.5, animations: {
            self.view.backgroundColor = .blue
        }) { _ in
            UIView.animate(withDuration: 1, delay: 2.0) {
                self.view.backgroundColor = .white
            }
        }
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
