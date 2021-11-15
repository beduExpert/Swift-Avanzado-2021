//
//  SongsViewCell.swift
//  Sesion06
//
//  Created by Ivan Alejandro Hernandez Sanchez on 15/11/21.
//

import UIKit

class SongsViewCell: UITableViewCell {

    @IBOutlet weak var genderLabel: UILabel!
    @IBOutlet weak var songLabel: UILabel!
    @IBOutlet weak var artistLabel: UILabel!
    @IBOutlet weak var durationLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
