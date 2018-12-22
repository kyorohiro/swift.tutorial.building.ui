//
//  MealTableViewCell.swift
//  Xxx
//
//  Created by kiyohiro kawamura on 2018/12/21.
//  Copyright © 2018 kiyohiro kawamura. All rights reserved.
//

import UIKit

class MealTableViewCell: UITableViewCell {


    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var ratingView: RatingControl!
    @IBOutlet weak var photoView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
