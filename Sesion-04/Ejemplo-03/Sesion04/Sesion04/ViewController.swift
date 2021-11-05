//
//  ViewController.swift
//  Sesion04
//
//  Created by Ivan Alejandro Hernandez Sanchez on 03/11/21.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.loader.isHidden = true
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
    
    
    @IBAction func actionLoader(_ sender: UIButton) {
        print("Show loader")
        self.loader.isHidden = false
        DispatchQueue.background(delay: 3.0, background: {
            print("Run on background thread")
        }, completion:{
            print("Hide loader")
            self.loader.isHidden = true
        })
        
        
        
        // stop any current animation
        self.progressView.layer.sublayers?.forEach { $0.removeAllAnimations() }
        self.progressView.setProgress(0.0, animated: false)

        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
            self.progressView.setProgress(1.0, animated: false)
            UIView.animate(withDuration: 10, delay: 0, options: [], animations: { [unowned self] in
                self.progressView.layoutIfNeeded()
            })
        }
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
    
    
    @IBAction func asyncTest(_ sender: UIButton)  {
        DispatchQueue.global(qos: .background).async {
            DispatchQueue.main.asyncAfter(deadline: .now(), execute: {
                self.loadPhotos()
                self.loadPhotos2()
            })
        }
    }
    
    func loadPhotos()  {
        Task {
             let firstPhoto =  await downloadPhoto(time: 0.0)
             let secondPhoto = await  downloadPhoto(time: 2.0)
             let thirdPhoto =  await downloadPhoto(time: 1.0)

            let photos = [firstPhoto, secondPhoto, thirdPhoto]
            print(photos)
        }
    }
    
    func loadPhotos2()  {
        Task {
             async let firstPhoto = downloadPhoto(time: 0.0)
             async let secondPhoto = downloadPhoto(time: 2.0)
            async let thirdPhoto = downloadPhoto(time: 1.0)
            async let _4Photo = downloadPhoto(time: 1.0)
            async let _5Photo = downloadPhoto(time: 1.0)

            let photos = await [firstPhoto, secondPhoto, thirdPhoto, _4Photo, _5Photo]
            print(photos)
        }
    }
    
    func downloadPhoto(time: Double) async -> String {
 
        sleep(UInt32(time))
        return "Photo: \(time)"
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
