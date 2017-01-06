//
//  MealTableViewCell.swift
//  HomieProject_1
//
//  Created by yonghwankim's macbook on 2017. 1. 5..
//  Copyright © 2017년 yonghwankim's macbook. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {

    // Mark: Properties
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var photoImageView: UIImageView!
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
