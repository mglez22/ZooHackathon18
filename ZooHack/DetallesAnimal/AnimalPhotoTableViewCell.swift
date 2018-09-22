//
//  AnimalPhotoTableViewCell.swift
//  ZooHack
//
//  Created by David Higuera on 15/9/18.
//  Copyright © 2018 UPM. All rights reserved.
//

import UIKit

class AnimalPhotoTableViewCell: UITableViewCell {
    @IBOutlet weak var imagenAnimal: UIImageView!
    @IBOutlet weak var nombreAnimal: UIButton!
    override func awakeFromNib() {
        super.awakeFromNib()
        imagenAnimal.layer.cornerRadius = 10.0
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
