//
//  ViewController.swift
//  CoreDataFriends
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import UIKit
import CoreData

class ViewController: UIViewController {
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  func relationships() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let managedContext = appDelegate.persistentContainer.viewContext
    guard let entityUser = NSEntityDescription.entity(forEntityName: "User", in: managedContext),
      let entityFriend = NSEntityDescription.entity(forEntityName: "Friend", in: managedContext) else { return }
    entityUser.setValue("MyName", forKey: "name")
    entityFriend.setValue("FriendName", forKey: "name")
    
    //Create relation
    entityUser.setValue(entityFriend, forKey: "myFriends")
    do {
      try managedContext.save()
    } catch { }
  }
  
}

