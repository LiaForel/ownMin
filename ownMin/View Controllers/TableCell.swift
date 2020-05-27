//
//  TableCell.swift
//  ownMin
//
//  Created by Bakulia Kurmant on 4/30/20.
//  Copyright © 2020 Bakulia Kurmant. All rights reserved.
//

import UIKit

class TableCell: UITableViewCell {

    
    @IBOutlet var imgView: UIImageView!
    
    @IBOutlet var categoryLabel: UILabel!
    
    @IBOutlet var nameLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
