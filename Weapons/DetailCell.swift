//
//  DetailCell.swift
//  Weapons
//
//  Created by yons on 2018/1/2.
//  Copyright © 2018年 xiao bo's studio. All rights reserved.
//

import UIKit

class DetailCell: UITableViewCell {

    @IBOutlet weak var keyLabel: UILabel!
    @IBOutlet weak var valueLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
