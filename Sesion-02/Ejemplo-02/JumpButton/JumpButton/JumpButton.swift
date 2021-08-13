//
//  JumpButton.swift
//  JumpButton
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

protocol Jump {
  func jump()
}

extension Jump where Self: UIButton {
  func jump() {
    self.transform = CGAffineTransform(scaleX: 0.50, y: 0.50)
    UIView.animate(withDuration: 2.0,
                   delay: 0,
                   usingSpringWithDamping: 0.2,
                   initialSpringVelocity: 6.0,
                   options: .allowUserInteraction,
                   animations: { [weak self] in
                    self?.transform = .identity
      },completion: nil)
  }
}

public class JumpButton: UIButton, Jump {
}
