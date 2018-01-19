//
//  CardCell.swift
//  Weapons
//
//  Created by yons on 2017/12/25.
//  Copyright © 2017年 xiao bo's studio. All rights reserved.
//

import UIKit

class CardCell: UITableViewCell {
    @IBOutlet weak var weaponLabel: UILabel!
    @IBOutlet weak var favBtn: UIButton!
    @IBOutlet weak var originLabel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    @IBOutlet weak var backImageView: UIImageView!
    
    var favorite = false {
        willSet {
            if newValue {
                favBtn.setImage(#imageLiteral(resourceName: "fav"), for: .normal)
            } else {
                favBtn.setImage(#imageLiteral(resourceName: "unfav"), for: .normal)
            }
        }
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
