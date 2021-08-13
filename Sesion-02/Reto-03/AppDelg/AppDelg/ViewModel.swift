//
//  ViewModel.swift
//  AppDelg
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

protocol Message {
  func message(_ text: String)
}

class ViewModel {
  
  private let storyboardName = "Main"
  private let viewControllerB = "ViewControllerB"
  
  func gotoNextView(delegate: Message) -> ViewControllerB? {
    if let vc = UIStoryboard(name: storyboardName, bundle: nil).instantiateViewController(withIdentifier: viewControllerB) as? ViewControllerB {
      vc.delegatMessage = delegate
      return vc
    }
    return nil
  }
  
}
