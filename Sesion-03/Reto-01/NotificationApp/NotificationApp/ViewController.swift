//
//  ViewController.swift
//  NotificationApp
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  let bedu = "com.app.bedu"

  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
    NotificationCenter.default.addObserver(self, selector: #selector(methodOfReceivedNotification(notification:)),
                                           name: Notification.Name(bedu),
                                           object: nil)
  }
  
  @objc func methodOfReceivedNotification(notification: Notification) {
    // Take Action on Notification
    print("Hola")
  }

}

