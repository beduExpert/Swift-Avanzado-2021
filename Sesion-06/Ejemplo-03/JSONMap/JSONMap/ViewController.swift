//
//  ViewController.swift
//  JSONMap
//
//  Copyright © 2020 Bedu. All rights reserved.
//

import UIKit
import Alamofire
import ObjectMapper
import AlamofireObjectMapper

class ViewController: UIViewController {
  
  let url = "https://gist.githubusercontent.com/richimf/0d18f9ba3e028fca677b39949fd92185/raw/c9b355b816864d3aa79bcacb93493a6608d841b8/file.json"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Alamofire.request(url, parameters: [:]).responseObject { (response: DataResponse<User>) in
      switch response.result {
      case .success(var results):
        print(response)
      case .failure(let error):
        print(error)
      }
    }
  }
  
}

