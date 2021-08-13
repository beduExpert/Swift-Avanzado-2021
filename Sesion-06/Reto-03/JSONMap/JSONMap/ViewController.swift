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
  
  let url = "https://gist.githubusercontent.com/richimf/ee011df8e4392d0c1307c1b6e9feed94/raw/9a208c321f2ac1211685a0f10b2f2216342b6078/data.json"
  
  override func viewDidLoad() {
    super.viewDidLoad()
    Alamofire.request(url, parameters: [:]).responseObject { (response: DataResponse<Animals>) in
      switch response.result {
      case .success(var results):
        print(results)
      case .failure(let error):
        print(error)
      }
    }
  }
  
}

