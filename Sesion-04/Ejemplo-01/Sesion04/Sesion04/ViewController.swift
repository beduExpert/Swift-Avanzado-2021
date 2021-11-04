//
//  ViewController.swift
//  Sesion04
//
//  Created by Ivan Alejandro Hernandez Sanchez on 03/11/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    
    @IBAction func actionNormal(_ sender: UIButton) {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3, execute: {
                print("Run thread 1")
            })
        }
        
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                print("Run thread 2")
            })
        }
        
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                print("Run thread 3")
            })
        }
        
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                print("Run thread 4")
            })
        }
    }
}



