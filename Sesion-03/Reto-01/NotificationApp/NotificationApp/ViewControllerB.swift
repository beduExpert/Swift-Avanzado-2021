//
//  ViewControllerB.swift
//  NotificationApp
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewControllerB: UIViewController {
  
  let bedu = "com.app.bedu"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }
  
  // Remove notification
  deinit {
    print("bye")
    NotificationCenter.default.removeObserver(self, name: Notification.Name(bedu), object: nil)
  }

  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    NotificationCenter.default.post(name: Notification.Name(bedu), object: nil)
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
