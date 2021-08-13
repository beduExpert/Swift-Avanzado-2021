//
//  ImageCollectionViewCell.swift
//  PhotosApp
//
//  Copyright © 2019 Bedu. All rights reserved.
//

import UIKit

class ImageCollectionViewCell: UICollectionViewCell {
  
  @IBOutlet weak var imageView: UIImageView!
  
  override func awakeFromNib() {
    super.awakeFromNib()
    // Initialization code
  }
  
  func setImage(_ image: UIImage){
    self.imageView.image = image
  }
  
}
