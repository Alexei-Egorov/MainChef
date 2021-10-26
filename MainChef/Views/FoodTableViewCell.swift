//
//  FoodTableViewCell.swift
//  MainChef
//
//  Created by Alexei Egorov on 27/10/2021.
//  Copyright © 2021 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class FoodTableViewCell: UITableViewCell {

    @IBOutlet weak var itemTitle: UILabel!
    @IBOutlet weak var amountLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
