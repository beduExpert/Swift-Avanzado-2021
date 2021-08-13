//
//  CellExtension.swift
//  CellExtensions
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

protocol RegistrableCell: class {
  static var nibName: String { get }
  static var reuseId: String { get }
}

extension RegistrableCell {
  
  static var nibName: String {
    return String(describing: self)
  }
  
  static var reuseId: String {
    return String(describing: self)
  }
  
  static func register(in tableView: UITableView) {
    tableView.register(UINib(nibName: Self.nibName, bundle: nil),
                       forCellReuseIdentifier: Self.reuseId)
  }
}
