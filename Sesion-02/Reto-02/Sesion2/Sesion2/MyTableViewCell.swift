//
//  MyTableViewCell.swift
//  Sesion2
//
//  Created by Ivan Alejandro Hernandez Sanchez on 28/10/21.
//

import UIKit

class MyTableViewCell: UITableViewCell {

    @IBOutlet weak var imagen: UIImageView!
    @IBOutlet weak var texto1: UILabel!
    @IBOutlet weak var texto2: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
