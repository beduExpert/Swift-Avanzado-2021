//
//  ViewController.swift
//  SaveImages
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
  
  func loadimages() {
    guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
    let context = appDelegate.persistentContainer.viewContext
    
    let imageData = UIImage().pngData()
    guard let imageEntity = NSEntityDescription.insertNewObject(forEntityName: "ImagesStorage", into: context) as? NSManagedObject else {
      return
    }
    imageEntity.setValue(imageData, forKey: "image")
    
    do {
      try context.save()
    } catch {
      print("Could not save. \(error), \(error.localizedDescription)")
    }
  }
  
}

