//
//  DishCollectionViewCell.swift
//  MainChef
//
//  Created by Alexei Egorov on 26/10/2021.
//  Copyright © 2021 Gwinyai Nyatsoka. All rights reserved.
//

import UIKit

class DishCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var dishImage: UIImageView!
    @IBOutlet weak var dishNameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
        dishImage.layer.cornerRadius = 12
        dishImage.layer.masksToBounds = true
    }

}
