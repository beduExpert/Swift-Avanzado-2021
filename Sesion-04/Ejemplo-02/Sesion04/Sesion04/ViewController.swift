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
    
    
    @IBAction func action(_ sender: UIButton) {
        print("Run on main thread 1")
        DispatchQueue.background(delay: 3.0, background: {
            print("Run on background thread 1")
        }, completion: {
            print("End thread 1, now continue on main thread")
        })

        print("Run on main thread 2")
        DispatchQueue.background(background: {
            print("Run on background thread 2")
        }, completion:{
            print("End thread 2, now continue on main thread")
        })
        
        print("Run on main thread 3")
        DispatchQueue.background(delay: 2.0, completion:{
            print("Run on background thread 3, now continue on main thread")
        })
        print("Run on main thread 4")
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




extension DispatchQueue {

    static func background(delay: Double = 0.0, background: (()->Void)? = nil, completion: (() -> Void)? = nil) {
        DispatchQueue.global(qos: .background).async {
            background?()
            if let completion = completion {
                DispatchQueue.main.asyncAfter(deadline: .now() + delay, execute: {
                    completion()
                })
            }
        }
    }

}
